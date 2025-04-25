`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 14:35:44
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`default_nettype none

module top (
    // 12MHz System Clock
    input wire clk,
    // Geiger counter digital input
    input wire pio1,
    // UART TX
    output wire tx,
    // Debug RGB LED. Note that they are connected to cathode and therefore active low
    output wire led0_b,
    output wire led0_g,
    output wire led0_r,
    // 2 Buttons, BTN0 for reset
    input wire [1:0] btn
);
    // ===================== Parameters =====================
    // Please modify these parameters before synthesis!
    parameter DEBUG_ENABLED = 0; // Enables serial debug output

    // ===================== Unified Reset Signal =====================
    wire [1:0] db_btn;
    wire reset_n; // Active LOW reset
    debouncer #(
        .WIDTH(2),
        .CLOCKS(1024),
        .CLOCKS_CLOG2(10)
    ) m_db_btn (
        .clk(clk),
        .din(btn),
        .dout(db_btn)
    );
    assign reset_n = ~db_btn[0];
    //assign led0_b = db_btn[1];
    
    // ===================== FIFO =====================
    // For now, this FIFO simply caches the data coming 
    // from the neoTRNG and outputs it to serial
    // so serial will always try to empty this FIFO
    (* mark_debug = "true" *) reg fifo_we_reg = 0;            // Write enable
    (* mark_debug = "true" *) reg fifo_re_reg = 0;            // Read enable
    (* mark_debug = "true" *) reg [7:0] fifo_in_reg;
    (* mark_debug = "true" *) wire [7:0] fifo_out;
    (* mark_debug = "true" *) reg [511:0] fifo_out_cache;     // This is required to fully cache the FIFO, since a shift left operation on the original will delete it
    (* mark_debug = "true" *) wire fifo_full;
    (* mark_debug = "true" *) wire fifo_empty;
    assign led0_r = ~fifo_full;           // indicate FIFO full warning on red LED
    assign led0_b = ~fifo_empty;          // indicate FIFO empty warning on blue LED
    serial_fifo serial_fifo(
        .clk(clk),
        .rst(~reset_n),
        // Write related pin
        .full(fifo_full),
        .din(fifo_in_reg),
        .wr_en(fifo_we_reg),
        // Read related pins
        .empty(fifo_empty),
        .dout(fifo_out),
        .rd_en(fifo_re_reg)
    );
    
    // ===================== neoTRNG modules =====================
    (* mark_debug = "true" *) wire valid_neotrng_output;
    (* mark_debug = "true" *) reg [7:0] neotrng_data_reg = 8'hff;
    (* mark_debug = "true" *) wire [7:0] neotrng_data_wire;
    neoTRNG neotrng (
        .clk_i(clk),
        .rstn_i(reset_n),
        .enable_i(1),           // TODO: you can disable or enable neoTRNG here for debugging purposes
        .valid_o(valid_neotrng_output),
        .data_o(neotrng_data_wire)
    );

    // neoTRNG has a weird idiosyncracy: you MUST extract the data immediately when the valid pin goes high, or else it would be too late
    // As such, this snippet of code caches the valid output of neoTRNG inside a register
    always @(posedge clk) begin
        if (valid_neotrng_output)
            neotrng_data_reg <= neotrng_data_wire;
        else
            neotrng_data_reg <= neotrng_data_reg;
    end

    // ===================== FastClk Nuclear Decay detector =====================
    wire fastclk_ready;
    wire [7:0] fastclk_data_wire;
    fastclk fastclk(
        .rst(~reset_n),
        .clk(clk),
        .geiger_in(pio1),

        .data(fastclk_data_wire),
        .ready(fastclk_ready)
    );
    
    // ===================== Blake2s hash algorithm core =====================
    
    (* mark_debug = "true" *) reg blake_init_reg = 0;
    (* mark_debug = "true" *) reg blake_update_reg = 0;
    (* mark_debug = "true" *) reg blake_finish_reg = 0;
    (* mark_debug = "true" *) reg [511:0] blake_blockdata_reg = 512'h0;
    (* mark_debug = "true" *) reg [511:0] blake_blockdata_bitmask = 512'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_000000ff;
    wire [255:0] blake_output_wire;
    reg [255:0] blake_output_reg = 256'h0;
    (* mark_debug = "true" *) wire blake_ready;
    
    blake2s_core blakecore(
        .clk(clk),
        .reset_n(reset_n),

        // Control signals
        .init(blake_init_reg),
        .update(blake_update_reg),
        .finish(blake_finish_reg),

        // Data inputs
        .block(blake_blockdata_reg),
        .blocklen(7'h40),

        // Outputs
        .digest(blake_output_wire),
        .ready(blake_ready)
    );

    // ===================== Serial module =====================
    reg uart_send = 0;
    reg [7:0] uart_data;
    wire uart_ready;
    
    UART_TX_CTRL uart_tx (
        .CLK(clk),
        .SEND(uart_send),
        .DATA(uart_data),
        .READY(uart_ready),
        .UART_TX(tx)
    );
    
    /*always @(posedge clk or negedge uart_ready) begin
        //UART is not ready, do not send any data
        if (~uart_ready) begin
            uart_send <= 0;
            uart_data <= 8'h20;
        // UART is ready, send next character
        end else begin
            if (valid_neotrng_output[0]) begin
                uart_send <= 1;
                uart_data <= neotrng_data_reg[7:0];
            end else begin
                uart_send <= 0;
                uart_data <= 8'h20;
            end
        end
    end*/

    // ===================== Control unit (FSM) =====================

    parameter FSM_INIT0         = 4'd3;
    parameter FSM_INIT1         = 4'd4;

    parameter FSM_IDLE          = 4'd0;
    // Seed states are meant to be states that feed the FIFO data to output (demo mode)
    parameter FSM_SEED0         = 4'd1;
    parameter FSM_SEED1         = 4'd2;
    // Output states are when data is being fed out of the FIFO to the BLAKE2s hash function
    parameter FSM_OUTPUT0       = 4'd6;
    parameter FSM_OUTPUT1       = 4'd7;
    parameter FSM_OUTPUT2       = 4'd8;
    parameter FSM_OUTPUT3       = 4'd9;
    parameter FSM_OUTPUT4       = 4'd10;
    parameter FSM_OUTPUT5       = 4'd11;
    parameter FSM_OUTPUT6       = 4'd12;

    parameter FSM_UART_SEND     = 4'd5;
    parameter FSM_NOP           = 4'd14; // Explicitly force a no operation
    parameter FSM_DEBUG         = 4'd15;

    (* mark_debug = "true" *) reg [3:0] fsm_state_reg = FSM_INIT0;
    reg [3:0] fsm_current_state = FSM_INIT0;
    reg toPrintDebug = DEBUG_ENABLED;

    reg [9:0] output_count_1 = 0; // This counter determines which bytes of data are being committed. 0 -> 8 -> 16 -> ... -> 504. This will apply a shift left
    reg [5:0] final_output_ctr = 0; // This counter counts the number of bytes leaving the system through the serial port. As the Blake2 function gives 256 bits, this has to run 32 times

    always @(posedge clk or negedge reset_n) begin
        // Reset State
        if (!reset_n) begin
            fifo_re_reg <= 0;
            fifo_we_reg <= 0;
            fifo_in_reg <= 8'h00;
            uart_send <= 0;
            fsm_state_reg <= FSM_INIT0;
            toPrintDebug <= DEBUG_ENABLED;
            blake_init_reg <= 0;
            blake_update_reg <= 0;
            blake_finish_reg <= 0;
            fifo_out_cache <= 512'h0;
        end
        else begin
            case (fsm_state_reg)
                FSM_INIT0: begin        // The main purpose of this state is to initialise the big modules, like the Blake2 unit
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    blake_init_reg <= 1;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    fsm_state_reg <= FSM_INIT1;
                end

                FSM_INIT1: begin        // Wait for the big modules to finish initialising before going to IDLE
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    // The transition also waits patiently for neoTRNG to boot up, for the FIFO to init (full signal turns off), and blake to completely start up
                    if (valid_neotrng_output & ~fifo_full & fifo_empty & blake_ready) begin
                        fsm_state_reg <= FSM_IDLE;
                    end
                end

                FSM_IDLE: begin
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00; // We commented this out as the next clock cycle needs to retain the FIFO in data
                    uart_send <= 0;
                    fsm_state_reg <= fsm_state_reg;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    // SKIP debug stub here, will cause too many messages!
                    if (fastclk_ready) begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_SEED1;
                    end else if (valid_neotrng_output) begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_SEED0;
                    end else if (fifo_full) begin
                        // Output to BLAKE2s once FIFO is full
                        // ideally, we want to deplete the FIFO
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_OUTPUT0;
                    end
                end

                FSM_SEED0: begin
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 1;
                    fifo_in_reg <= neotrng_data_reg;
                    uart_send <= 0;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    // SKIP debug stub here, will cause too many messages!
                    if (fastclk_ready) begin
                        // During the neoTRNG based seeding, do another validation pass 
                        // with the fastclk just to be sure we ingest the data coming 
                        // from the geiger counter
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_SEED1;
                    end else begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_IDLE;
                    end
                end

                FSM_SEED1: begin
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 1;
                    fifo_in_reg <= fastclk_data_wire;
                    uart_send <= 0;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    if (toPrintDebug) begin
                        fsm_current_state <= FSM_SEED1;
                        fsm_state_reg <= FSM_DEBUG;
                    end else begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_IDLE;
                    end
                end

                FSM_OUTPUT0: begin        // Initial output, set initial conditions including initial addresses. Init the Blake2 core as well
                    fifo_re_reg <= 1;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    blake_init_reg <= 1;  // Init the blake2 core here so it has a few clock cycles
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    output_count_1 <= 0;

                    fifo_out_cache <= 512'h0;
                    blake_blockdata_bitmask <= 512'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_000000ff;
                    blake_blockdata_reg <= (blake_blockdata_reg & (~blake_blockdata_bitmask)) | (fifo_out << output_count_1);

                    if (toPrintDebug) begin
                        fsm_current_state <= FSM_OUTPUT0;
                        fsm_state_reg <= FSM_DEBUG;
                    end else begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_OUTPUT1;
                    end
                end

                FSM_OUTPUT1: begin      // Intermediate output, increment the address and check if the address has overflowed. Do not read or write anything yet!
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    blake_blockdata_bitmask <= blake_blockdata_bitmask << 8;
                    output_count_1 <= output_count_1 + 8;

                    // SKIP debug stub here, will cause double increment!
                    if (output_count_1 >= 504) begin
                        // goto finish state
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_OUTPUT3;
                    end else begin
                        // goto store state
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_OUTPUT2;
                    end
                end

                FSM_OUTPUT2: begin      // Store this number into the block register
                    fifo_re_reg <= 1;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    blake_blockdata_reg <= (blake_blockdata_reg & (~blake_blockdata_bitmask)) | (fifo_out << output_count_1);

                    // go back to intermediate state
                    if (toPrintDebug) begin
                        fsm_current_state <= FSM_OUTPUT2;
                        fsm_state_reg <= FSM_DEBUG;
                    end else begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_OUTPUT1;
                    end
                end

                FSM_OUTPUT3: begin      // Finish state, no need to store the last byte, and turn on the blake update signal so it starts computing
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 1;

                    if (toPrintDebug) begin
                        fsm_current_state <= FSM_OUTPUT3;
                        fsm_state_reg <= FSM_DEBUG;
                    end else begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_OUTPUT4;
                    end
                end

                FSM_OUTPUT4: begin      // Wait for blake2 unit to finish computing
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    if (toPrintDebug) begin
                        fsm_current_state <= FSM_OUTPUT4;
                        fsm_state_reg <= FSM_DEBUG;
                    end else if (blake_ready & ~blake_finish_reg & ~blake_init_reg & ~blake_update_reg) begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_OUTPUT5;
                    end
                end

                FSM_OUTPUT5: begin      // Output to serial! As we've completed the computation
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    // 256-bit digest that we have to output
                    blake_output_reg <= blake_output_wire;
                    final_output_ctr <= 0;

                    if (toPrintDebug) begin
                        fsm_current_state <= FSM_OUTPUT5;
                        fsm_state_reg <= FSM_DEBUG;
                    end else begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_UART_SEND;
                    end
                end

                FSM_UART_SEND: begin
                    toPrintDebug <= 0;
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    if (uart_ready) begin
                        uart_send <= 1;
                        uart_data <= blake_output_reg[7:0];
                        fsm_state_reg <= FSM_OUTPUT6;
                    end else begin
                        uart_send <= 0;
                        uart_data <= 8'hff;
                    end
                end

                FSM_OUTPUT6: begin
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    // fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    blake_init_reg <= 0;
                    blake_update_reg <= 0;
                    blake_finish_reg <= 0;

                    blake_output_reg <= blake_output_reg >> 8;
                    final_output_ctr <= final_output_ctr + 1;

                    // SKIP debug stub here, will cause double increment!
                    if (final_output_ctr >= 31) begin
                        // goto finish state
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_IDLE;
                    end else begin
                        // continue printing
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_UART_SEND;
                    end
                end

                FSM_NOP: begin
                    toPrintDebug <= 0;
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    uart_send <= 0;
                    
                    fsm_state_reg <= fsm_current_state;
                end

                FSM_DEBUG: begin
                    toPrintDebug <= 0;
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    if (uart_ready) begin
                        uart_send <= 1;
                        uart_data <= fsm_current_state;
                        fsm_state_reg <= fsm_current_state;
                    end else begin
                        uart_send <= 0;
                        uart_data <= 8'hff;
                    end
                end

            endcase
        end

    end
    

endmodule