`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 15:45:12
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

module tb;
    // Inputs
    reg clk;
    reg reset;
    reg button_in;
    
    // Outputs
    wire button_out;

    debounce dut(clk, reset, button_in, button_out);
    
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
    button_in = 0;
    
    // Simulation
    #1 reset = 1;
    #5 reset = 0;
    #1 button_in = 1;
    #15 button_in = 0;
    #4 button_in = 1;
    #64 button_in = 0;
    #128 $finish;

    $dumpoff;
end

endmodule
