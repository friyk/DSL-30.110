`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2025 12:19:44
// Design Name: 
// Module Name: top_module
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


//module top_module(

//    );
//endmodule

module top_module(
    input [1:0]sw, // 2-bit input (sw[1], sw[0]), use 1 bit only
    output [7:0]led // 8-bit output (led[7:0]), use 1 bit only
    );

    // Logic gate implementations
    assign led[0] = ~sw[0]; // NOT A
    assign led[1] = ~sw[1]; // NOT B
    assign led[2] = sw[0] & sw[1]; // A AND B
    assign led[3] = sw[0] | sw[1]; // A OR B
    assign led[4] = ~(sw[0] | sw[1]); // A NOR B
    assign led[5] = ~(sw[0] & sw[1]); // A NAND B
    assign led[6] = sw[0] ^ sw[1]; // A XOR B
    assign led[7] = ~(sw[0] ^ sw[1]); // A XNOR B

endmodule
