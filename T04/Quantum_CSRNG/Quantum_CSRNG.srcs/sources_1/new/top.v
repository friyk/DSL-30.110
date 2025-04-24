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
    // ===================== Unified Reset Signal =====================
    wire [1:0] db_btn;
    wire reset_n; // Active LOW reset
    wire debug_clk; // Debug clock that uses button press
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
    reg fifo_we_reg = 0;            // Write enable
    reg fifo_re_reg = 0;            // Read enable
    reg [7:0] fifo_in_reg;
    wire [7:0] fifo_out;
    wire fifo_full;
    wire fifo_empty;
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
    wire valid_neotrng_output;
    wire [7:0] neotrng_data_wire;
    neoTRNG neotrng (
        .clk_i(clk),
        .rstn_i(reset_n),
        .enable_i(1),           // TODO: you can disable or enable neoTRNG here for debugging purposes
        .valid_o(valid_neotrng_output),
        .data_o(neotrng_data_wire)
    );

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
    
    wire blake_init;
    wire blake_update;
    wire blake_finish;
    
    blake2s_core blakecore(
        .clk(clk),
        .reset_n(reset_n),
        .init(blake_init),
        .update(blake_update),
        .finish(blake_finish)
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

    parameter FSM_IDLE          = 4'h0;
    // Seed states are meant to be states that feed the FIFO data to output (demo mode)
    parameter FSM_SEED0         = 4'h1;
    parameter FSM_SEED1         = 4'h2;
    parameter FSM_SEED2         = 4'h3;
    parameter FSM_SEED3         = 4'h4;
    parameter FSM_WRITE_FIFO    = 4'h5;
    // Output states are when data is being fed out of the FIFO to the serial device
    parameter FSM_OUTPUT0       = 4'h6;

    parameter FSM_DEBUG         = 4'hf;
    parameter DEBUG_ENABLED     = 1'b1;

    reg [3:0] fsm_state_reg = FSM_IDLE;
    reg [3:0] fsm_current_state = FSM_IDLE;
    reg toPrintDebug = DEBUG_ENABLED;

    always @(posedge clk or negedge reset_n) begin

        // Reset State
        if (!reset_n) begin
            fifo_re_reg <= 0;
            fifo_we_reg <= 0;
            fifo_in_reg <= 8'h00;
            uart_send <= 0;
            fsm_state_reg <= FSM_IDLE;
            toPrintDebug <= DEBUG_ENABLED;
        end
        else begin
            case (fsm_state_reg)
                FSM_IDLE: begin
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 0;
                    fifo_in_reg <= 8'h00;
                    uart_send <= 0;
                    fsm_state_reg <= fsm_state_reg;

                    if (toPrintDebug) begin
                        fsm_current_state <= FSM_IDLE;
                        fsm_state_reg <= FSM_DEBUG;
                    end else if (fastclk_ready) begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_SEED1;
                    end else if (valid_neotrng_output) begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_SEED0;
                    end
                end

                FSM_SEED0: begin
                    fifo_re_reg <= 0;
                    fifo_we_reg <= 1;
                    fifo_in_reg <= neotrng_data_wire;
                    uart_send <= 0;

                    if (toPrintDebug) begin
                        fsm_current_state <= FSM_SEED0;
                        fsm_state_reg <= FSM_DEBUG;
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

                    if (toPrintDebug) begin
                        fsm_current_state <= FSM_SEED1;
                        fsm_state_reg <= FSM_DEBUG;
                    end else begin
                        toPrintDebug <= DEBUG_ENABLED;
                        fsm_state_reg <= FSM_IDLE;
                    end
                end

                FSM_DEBUG: begin
                    toPrintDebug <= 0;
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


        /*//set data if valid
        if (valid_neotrng_output[0]) begin
            neotrng_data[7:0] <= neotrng_data_wire[7:0];
        end else if (valid_neotrng_output[1]) begin
            neotrng_data[15:8] <= neotrng_data_wire[15:8];
        end else if (valid_neotrng_output[2]) begin
            neotrng_data[23:16] <= neotrng_data_wire[23:16];
        //hold data if invalid
        end else begin
            neotrng_data <= neotrng_data;
        end*/
    end
    

endmodule