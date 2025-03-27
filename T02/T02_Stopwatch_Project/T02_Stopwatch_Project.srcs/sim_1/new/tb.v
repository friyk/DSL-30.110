`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2025 12:23:33
// Design Name: 
// Module Name: tb
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

module tb;
    reg [1:0]sw;
    wire [7:0]led;

    top_module uut (sw, led);

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);

        sw[0] =  1'b0;
        sw[1] = 1'b0;
        #2
        sw[0] = 1'b1;
        #2
        sw[0] = 1'b0;
        sw[1] = 1'b1;
        #2
        sw[0] = 1'b1;
        #2 $finish;

    $dumpoff;
end

endmodule