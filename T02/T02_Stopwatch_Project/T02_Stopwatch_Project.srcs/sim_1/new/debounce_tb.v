`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 15:03:16
// Design Name: 
// Module Name: debounce_tb
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

module debounce_tb;
    // Inputs
    reg clk;
    reg reset;
    reg button_in;
    
    // Outputs
    wire button_out;

    debounce dut(sw, led);
    
    // Clock generation
always begin
    #2 clk = ~clk;
end

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
    $dumpon;
    
    // Initialise signals at start of simulation
    clk = 0;
    reset = 0;
    button_in = 0;
    
    // Simulation
    
    #10 $finish;

    $dumpoff;
end

endmodule
