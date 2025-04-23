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
    output reg [31:0] data
);

    // Note: this counter is intentionally allowed to overflow as overflowing does not inherently destroy the
    // entropy provided by this system

    // At 12MHz, an 8-bit counter will overflow in 21us
    // a 16-bit counter will overflow in 5461us -> 5ms
    // a 32-bit counter will overflow in 357s, which is a bit excessive for us, but would be nice for the Blake2 hash function
    // Rising edge detector for geiger_in so it prevents holding the counter for excessive periods of time
    wire geiger_in_negedge;
    neg_edge_det ned(
        .sig(geiger_in),
        .clk(clk),
        .pe(geiger_in_negedge)
    );
    
    always @(clk or posedge rst) begin
        if (rst) begin
            counter <= 32'h0000000;
            data <= 32'h00000000;   
        end
        
        else if (clk & ~geiger_in_negedge)
            counter <= counter + 1'b1;
        else if (geiger_in_negedge) begin
            data = counter;
            counter = 32'h00000000;
        end
    end

endmodule
