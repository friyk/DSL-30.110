`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2025 09:36:40
// Design Name: 
// Module Name: tb
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


module tb;
    // Inputs
    reg [31:0]s;
    reg clk;
    
    // Outputs
    wire [31:0]mm;
    wire [31:0]ss;

    s_to_mmss dut(s, clk, mm, ss);
    
    // Clock generation
always begin
    #1 clk = ~clk;
end

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
    $dumpon;
    
    // Initialise signals at start of simulation
    s = 0;
    clk = 0;
    
    // Simulation
//    #100 s = 30;
//    #100 s = 56;
//    #100 s = 60;
//    #100 s = 62;
//    #100 s = 67;
    #100 s = 9999;
    #2000 s = 3600;
    #2000 $finish;

    $dumpoff;
end

endmodule
