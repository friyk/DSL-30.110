`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 17:54:07
// Design Name: 
// Module Name: neg_edge_det
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: https://www.chipverify.com/verilog/verilog-positive-edge-detector
// 
// Dependencies: s
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module neg_edge_det ( input wire sig,            // Input signal for which positive edge has to be detected
                      input wire clk,            // Input signal for clock
                      output wire pe);           // Output signal that gives a pulse when a positive edge occurs

    reg   sig_dly;                          // Internal signal to store the delayed version of signal

    // This always block ensures that sig_dly is exactly 1 clock behind sig
	always @ (posedge clk) begin
		sig_dly <= sig;
	end

    // Combinational logic where sig is AND with delayed, inverted version of sig
    // Assign statement assigns the evaluated expression in the RHS to the internal net pe
	assign pe = ~sig & sig_dly;
endmodule