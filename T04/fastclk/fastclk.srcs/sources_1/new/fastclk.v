`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 14:52:26
// Design Name: 
// Module Name: fastclk
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

// using io pin 
module fastclk(
    input rst,
    input sysclk,
    input pio1,
    
    output reg [7:0]counter,
    output reg [7:0]counterHold
    );

always @(negedge sysclk or posedge rst) begin
    if (rst) begin    
        counter <= 8'b0000000;
        counterHold <= 8'b00000000;   
    end
         
    else if (~pio1)
        counter <= counter + 1'b1;
        
    else if (pio1) begin
        counterHold = counter;
        counter = 8'b00000000;
    end
end            
   

endmodule
