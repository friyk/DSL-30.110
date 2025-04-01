`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 16:48:54
// Design Name: 
// Module Name: s_to_mmss
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

module s_to_mmss(
    input [31:0] s,
    input clk,          // This device relies on the master 100MHz clock to perform simple division
    output reg [31:0] mm,
    output reg [31:0] ss
    );
    
    // We use simple primary school style division, keep subtracting until we cannot subtract anymore and we get our quotient and remainder :)
    reg [2:0]state;
    reg signed [31:0]quotient;
    reg signed [31:0]remainder;
    reg signed [31:0]temp;
    
    initial quotient = 0;
    initial remainder = 0;
    initial state = 0;
    initial temp = 0;
    initial mm = 0;
    initial ss = 0;
    
    
    always @(posedge clk) begin
        // Load from inputs
        if (state == 0) begin
            // Load seconds into the temp register
            temp <= s;
            
            // Reset quotient and remainders
            quotient <= 0;
            remainder <= 0;
            
            // Preserve output register values
            mm <= mm;
            ss <= ss;
            
            // Transition to state 0 (calculating state 1)
            state <= 1;
        end
        
        else if (state == 1) begin
            // Save temp to register, before trying to calculate quotient
            remainder <= temp;
            
            state <= 2;
        end
        
        else if (state == 2) begin
            temp <= temp - 60; // Perform division by subtracting 60 repeatedly
            
            state <= 3;
        end
        
        else if (state == 3) begin
            if (temp < 0) begin
                // Ignore the result, we've reached minimum, preserve quotient and save results to output regs
                quotient <= quotient;
                remainder <= remainder;
                state <= 4;
            end else begin
                // Continue subtracting
                quotient <= quotient + 1;
                remainder <= remainder;
                state <= 1;
            end
        end
        
        // Save data, and go back to the beginning
        else begin
            mm <= quotient;
            ss <= remainder;
        
            state <= 0;
        end
    
    end
    
endmodule
