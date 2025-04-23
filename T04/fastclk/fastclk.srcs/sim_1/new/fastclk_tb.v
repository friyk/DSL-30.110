`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 15:25:14
// Design Name: 
// Module Name: fastclk_tb
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


module fastclk_tb;
    
    reg reset;
    reg clk;
    reg gpio;
    
    wire [7:0] counter;
    wire [7:0] hold;

    
    fastclk uut(reset,clk,gpio,counter,hold);

always begin
    #1 clk = ~clk;
end

initial begin
    reset = 1;
    clk = 1;
    gpio = 0;
    
    #1 reset = 0;
    
    
    # 10
    gpio = 1;
    # 1
    gpio = 0;
    #4
    gpio = 1;
    #2
    gpio = 0;
    #3 $finish;
    
end
endmodule
