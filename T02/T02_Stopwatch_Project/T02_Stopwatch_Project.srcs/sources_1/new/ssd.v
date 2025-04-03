`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 16:15:43
// Design Name: 
// Module Name: ssd
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

module ssd(
    input           rstn_i,
    input           clk_500hz,
    input   [3:0]   num3_i,
    input   [3:0]   num2_i,
    input   [3:0]   num1_i,
    input   [3:0]   num0_i,
    output  [3:0]   an_o,
    output  [7:0]   seg_o
);

reg [7:0] segment_r;
reg [3:0] cur_num_r;
reg [3:0] an_r;

initial an_r = 0;
initial segment_r = 0;

assign an_o = ~an_r;       // Anode outputs are inverted
assign seg_o = segment_r;  // Segment outputs are not inverted

// Anode rotation logic, upon every CLK the anode has to be rotated to the next digit
always @(negedge rstn_i, posedge clk_500hz) begin
    if (!rstn_i) an_r <= 4'b0000;
    else case (an_r)
        4'b0001: an_r <= 4'b0010;  // DIG3
        4'b0010: an_r <= 4'b0100;  // DIG2
        4'b0100: an_r <= 4'b1000;  // DIG1
        default: an_r <= 4'b0001;  // DIG4 (including reset state)
    endcase
end

// Mux to wire up the correct digit segments based on the current anode
always @(*) begin
    case (an_r)
        4'b0001: cur_num_r = num0_i;  // DIG4 (LSB)
        4'b0010: cur_num_r = num1_i;  // DIG3
        4'b0100: cur_num_r = num2_i;  // DIG2
        4'b1000: cur_num_r = num3_i;  // DIG1 (MSB)
        default: cur_num_r = 4'b0;    // All off
    endcase
end

// Decode number into 7-segment codes
always @(*) begin
    case (cur_num_r)
        4'h0: segment_r = 8'hC0;  // 0
        4'h1: segment_r = 8'hF9;  // 1
        4'h2: segment_r = 8'hA4;  // 2
        4'h3: segment_r = 8'hB0;  // 3
        4'h4: segment_r = 8'h99;  // 4
        4'h5: segment_r = 8'h92;  // 5
        4'h6: segment_r = 8'h82;  // 6
        4'h7: segment_r = 8'hF8;  // 7
        4'h8: segment_r = 8'h80;  // 8
        4'h9: segment_r = 8'h90;  // 9
        default: segment_r = 8'hFF; // Off
    endcase
end

endmodule


// Provides a 500Hz resettable clock from the 100MHz system clock by decimal division
module clk_500hz(
    output reg clk_out,
    input clk_in, reset
);
    reg[17:0]count;

    always@(posedge clk_in) begin
        if (reset)
            count <= 18'h000000;
        else if (count==18'h30D40) begin
            clk_out <= 1'b1; count <= 18'h000000;
        end else begin
            count <= count + 1'b1;
            clk_out <=1'b0;
        end
    end
endmodule
