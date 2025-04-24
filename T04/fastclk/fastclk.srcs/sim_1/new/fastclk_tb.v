
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
    
    wire [31:0] counter;
    wire [31:0] hold;
    wire ready;
    
    fastclk uut(reset,clk,gpio,counter,hold,ready);

always begin
    #1 clk = ~clk;
end

initial begin
    reset = 1;
    clk = 0;
    gpio = 1;
    
    #1 reset = 0;   // t=1
        
    #10 gpio = 0;   // t=11    
    #1 gpio = 1;    // t=12    
    #4 gpio = 0;    // t=16    
    #2 gpio = 1;    // t=18    
    #6 gpio = 0;    // t=24
    #1 gpio = 1;    // t=25
    
    #3 $finish;     // t=28
    
end
endmodule
