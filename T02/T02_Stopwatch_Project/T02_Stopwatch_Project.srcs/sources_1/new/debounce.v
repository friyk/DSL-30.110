`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2025 12:55:38
// Design Name: 
// Module Name: debounce
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

module debounce (
    input wire clk,        // System clock (e.g., 100 MHz on Basys 3)
    input wire reset,      // Reset signal
    input wire button_in,  // Raw button input
    output reg button_out  // Debounced button output
);

    reg [19:0] count;      // 20-bit counter for debouncing
    reg button_prev;        // Previous state of the button

    always @(posedge clk or posedge reset) begin
        // Reset counter and button statuses if reset pin asserted
        if (reset) begin
            count <= 20'b0;
            button_prev <= 1'b0;
            button_out <= 1'b0;
        end else begin
            button_prev <= button_in;
            // Set counter to 0 when button state changes
            if (button_prev != button_in) begin
                count <= 20'b0;
            // If counter hits maximum, set button output to previous button state
            end else if (count == 20'h0000F) begin
                button_out <= button_prev;
            // Increment counter
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule