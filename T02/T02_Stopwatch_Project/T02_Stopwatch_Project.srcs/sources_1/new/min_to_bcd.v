`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 16:51:13
// Design Name: 
// Module Name: min_to_bcd
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


module min_to_bcd(
    input  [15:0] mm,
    output [3:0] bcd_0,
    output [3:0] bcd_1
);

    assign bcd_0 = mm % 10;    // Ones place
    assign bcd_1 = mm / 10;    // Tens place

endmodule
