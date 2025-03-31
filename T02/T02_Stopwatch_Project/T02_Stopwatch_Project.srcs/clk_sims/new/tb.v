`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 21:57:10
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
    reg clk;
    reg reset;
    
    // Outputs
    wire clk_out;

    clk_100M_to_1k dut(clk, reset, clk_out);
    
    // Clock generation
always begin
    #1 clk = ~clk;
end

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
    $dumpon;
    
    // Initialise signals at start of simulation
    clk = 0;
    reset = 0;
    
    // Simulation
    #1 reset = 1;
    #5 reset = 0;
    #128 $finish;

    $dumpoff;
end

endmodule
