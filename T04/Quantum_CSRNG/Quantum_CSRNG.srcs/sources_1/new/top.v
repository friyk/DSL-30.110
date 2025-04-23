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
    // UART TX
    output wire tx,
    // 2 Buttons, BTN0 for reset
    input wire [1:0] btn
);
    // ===================== Button Debouncer =====================
    wire [1:0] db_btn;
    debouncer #(
        .WIDTH(2),
        .CLOCKS(1024),
        .CLOCKS_CLOG2(10)
    ) m_db_btn (
        .clk(clk),
        .din(btn),
        .dout(db_btn)
    );
    
    // ===================== neoTRNG module =====================
    wire valid_neotrng_output;
    wire [7:0] neotrng_data_wire;
    reg [7:0] neotrng_data;
    neoTRNG neotrng (
        .clk_i(clk),
        .rstn_i(~db_btn[0]),
        .enable_i(1),
        .valid_o(valid_neotrng_output),
        .data_o(neotrng_data_wire)
    );
    
    always @(posedge clk or negedge valid_neotrng_output) begin
       if (~valid_neotrng_output)
          neotrng_data <= neotrng_data;      //hold data if invalid
       else
          neotrng_data <= neotrng_data_wire; //set data if valid
    end
    
    
    // ===================== Serial module =====================
    reg uart_send;
    reg [7:0] uart_data;
    wire uart_ready;
    
    UART_TX_CTRL uart_tx (
        .CLK(clk),
        .SEND(uart_send),
        .DATA(uart_data),
        .READY(uart_ready),
        .UART_TX(tx)
    );
    
    always @(posedge clk or negedge uart_ready) begin
        //UART is not ready, do not send any data
        if (~uart_ready) begin
            uart_send <= 0;
            uart_data <= 8'h20;
        // UART is ready, send next character
        end else begin
            if (valid_neotrng_output) begin
                uart_send <= 1;
                uart_data <= neotrng_data;
            end else begin
                uart_send <= 0;
                uart_data <= 8'h20;
            end
        end
    end

endmodule