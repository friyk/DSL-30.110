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
    // System-wide reset
    input wire rst,
    // System-wide clock, assumed to be 12MHz
    input wire clk,
    // The raw geiger pulse (digital only)
    input wire geiger_in,
    
    // This is the raw counter itself, which counts up sequentially until a geiger pulse resets it
    output reg [31:0] counter,
    // This output holds the previous value until it changes due to a geiger pulse
    output reg [31:0] data,
    // This output shows whether fastclk is ready to provide a new piece of random data. This will only stay high for 1 clk
    output reg ready
);

    // Rising edge detector for geiger_in so it prevents holding the counter for excessive periods of time
    wire geiger_in_posedge;
    pos_edge_det(
        .sig(geiger_in),
        .clk(clk),
        .pe(geiger_in_posedge)
    );

    // Note: this counter is intentionally allowed to overflow as overflowing does not inherently destroy the
    // entropy provided by this system

    // At 12MHz, an 8-bit counter will overflow in 21us
    // a 16-bit counter will overflow in 5461us -> 5ms
    // a 32-bit counter will overflow in 357s, which is a bit excessive for us, but would be nice for the Blake2 hash function

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 32'h0000000;
            data <= 32'h00000000; 
            ready <= 0;  
        end
        else if (~geiger_in_posedge) begin
            counter <= counter + 1'b1;
            ready <= 0;
        end
        else if (geiger_in_posedge) begin
            data <= counter;
            counter <= 32'h00000000;
            ready <= 1;
        end
    end

endmodule
