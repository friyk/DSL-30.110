`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2025 13:32:03
// Design Name: 
// Module Name: ms_counter
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


module ms_counter(
    input rst,
    input clk,
    output reg [31:0] out
    );
    
    initial out = 0;
    
    // Synchronous reset
    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= 0;
        else
            out <= out + 1;
    end
    
endmodule
