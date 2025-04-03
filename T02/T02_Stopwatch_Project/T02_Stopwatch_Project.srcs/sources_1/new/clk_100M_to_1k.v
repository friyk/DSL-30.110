`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 16:45:16
// Design Name: 
// Module Name: clk_100M_to_1k
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

module clk_100M_to_1k(
    input clk_100M,     // Input clock from the FPGA's master clock
    input rst,          // Active high reset
    output reg clk_1k   // Output clock
    );
    
    reg [16:0] counter;
    
    initial clk_1k = 0;
    initial counter = 0;
    
    always @(posedge rst, posedge clk_100M) begin
        if (rst) begin
            counter <= 0;
            clk_1k <= 0;
        end
        else begin
            if (counter == 17'd50000) begin // For actual d100000/2=d50000, after this number of clock cycles the 1kHz clock transitions
//            if (counter == 17'd9) begin // For testbench purposes
                counter <= 0;
                clk_1k <= ~clk_1k;
            end else
                counter <= counter + 1;
        end
    end
endmodule
