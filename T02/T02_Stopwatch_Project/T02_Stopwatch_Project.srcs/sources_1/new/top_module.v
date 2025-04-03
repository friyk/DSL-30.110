`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2025 12:19:44
// Design Name: 
// Module Name: top_module
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

module top_module(
    input clk,          // 100MHz master clock
    input btnC,         // centre button, used for start/stop
    input btnU,         // up button, used for stopwatch reset
    
    output [6:0]seg,    // 7 segment display
    output dp,          // 7 segment display decimal point
    output [3:0]an      // 7 segment anode
    );
    
    // 500hz clock for driving the display
    wire clk500hz;
    clk_500hz(clk, clk500hz, 0);
    
    // Debounced buttons
    wire startstop_btn, stopwatch_rst_btn;
    debounce(clk, 0, btnC, startstop_btn);
    debounce(clk, 0, btnU, stopwatch_rst_btn);
    
    // TFF to stop the clock
    wire clock_stopper_mux;
    tff(clk500hz, startstop_btn, clock_stopper_mux);
    
    
    
    // Master clock to 1kHz downconverter, and multiplexor to switch it
    wire clk1khz, clk1khz_switched;
    clk_100M_to_1k(clk, 0, clk1khz);
    assign clk1khz_switched = clock_stopper_mux ? 0 : clk1khz;
    
    // Master miliseconds counter
    wire [31:0] miliseconds;
    ms_counter(0, clk1khz_switched, miliseconds);
    
    // Divide ms to s
    wire [15:0] seconds;
    ms_to_s(miliseconds, seconds);
    
    // Separate seconds into minutes and seconds
    wire [15:0] mm, ss;
    s_to_mmss(seconds, clk, mm, ss);
    
    // Convert mm and ss into BCD
    wire [3:0] minute_tens, minute_ones, second_tens, second_ones;
    min_to_bcd(mm, minute_ones, minute_tens);
    sec_to_bcd(ss, second_ones, second_tens);
    
    // Seven segment display
    ssd(1, clk500hz, minute_tens, minute_ones, second_tens, second_ones, an, seg);

endmodule
