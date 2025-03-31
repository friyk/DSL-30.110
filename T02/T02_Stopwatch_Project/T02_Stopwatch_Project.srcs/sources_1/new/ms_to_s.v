`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 16:46:17
// Design Name: 
// Module Name: ms_to_s
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

// Refer to this link https://web.archive.org/web/20180517023231/http://www.hackersdelight.org/divcMore.pdf
// For how to do a divide by 1000! Although it's in C, it avoids using any complex operations like multiply and divide

module ms_to_s(
    input [31:0]ms,
    output [31:0]s
    );
endmodule
