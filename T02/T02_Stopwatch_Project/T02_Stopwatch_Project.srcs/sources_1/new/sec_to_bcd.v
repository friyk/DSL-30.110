`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 16:51:13
// Design Name: 
// Module Name: sec_to_bcd
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


module sec_to_bcd(
    input  [15:0] ss,       // seconds (0–59)
    output [3:0] bcd_0,     // Ones place (0–9)
    output [3:0] bcd_1      // Tens place (0–5)
);

    wire [7:0] value = ss[7:0];  // Use only the lower 8 bits

    assign bcd_1 = value / 10;   // Tens digit
    assign bcd_0 = value % 10;   // Ones digit

endmodule
