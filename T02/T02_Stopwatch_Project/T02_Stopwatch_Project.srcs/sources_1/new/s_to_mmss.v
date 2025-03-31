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
    reg state;
    reg [31:0]in_buf; // Input buffer. Only takes in s upon state 1
    reg [31:0]quotient;
    reg [31:0]remainder;
    reg [31:0]temp;
    
    initial state = 0;
    initial mm = 0;
    initial ss = 0;
    
    always @(posedge clk) begin
        if (state == 0) begin
            // Preserve minutes and seconds registers, do not change their values
            mm <= mm;
            ss <= ss;
            
            remainder <= temp; // Save the remainder, just in case this subtraction yields a negative number
            temp <= temp - 60; // Perform division by subtracting 60 repeatedly
            
            // if this subtraction operation will result in a negative number, discard the result and transition to state 1
            if (temp < 0) begin
                quotient <= quotient;
                state <= 1;
            end else begin
                // If we were able to subtract by 60, save quotient
                quotient <= temp;
                state <= state;
            end
        end else if (state == 1) begin
            // Load seconds into the temp register
            temp <= s;
            
            // Load quotient and remainder into minutes and seconds registers
            mm <= quotient;
            ss <= remainder;
            
            // Transition back to state 0 (calculating state)
            state <= 0;
        end
    end
    
endmodule
