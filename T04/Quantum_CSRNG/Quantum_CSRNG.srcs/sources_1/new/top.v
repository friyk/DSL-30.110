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
    // RGB LED (Active Low)
    output wire led0_r,
    output wire led0_g,
    output wire led0_b,
    // 4 LEDs
    output wire [3:0] led,
    // UART TX
    output wire tx,
    // 2 Buttons
    input wire [1:0] btn
);
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

endmodule