
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 15:25:14
// Design Name: 
// Module Name: fastclk_tb
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


module fastclk_tb;
    
    reg clk;
    reg valid_neotrng_output;
    reg [7:0] neotrng_data_wire;
    
    reg [7:0] neotrng_data_reg;
    
/*always @(posedge clk) begin
    if (valid_neotrng_output)
        neotrng_data_reg <= neotrng_data_wire;
end*/

    always @(valid_neotrng_output) begin
        if (valid_neotrng_output)
            neotrng_data_reg = neotrng_data_wire;
        else
            neotrng_data_reg = neotrng_data_reg;
    end

always begin
    #1 clk = ~clk;
end

initial begin
    clk = 1;
    valid_neotrng_output = 0;
    neotrng_data_wire = 0;
    
    #2 neotrng_data_wire = 1;
    #2 neotrng_data_wire = 2; valid_neotrng_output = 1;
    #2 neotrng_data_wire = 3; valid_neotrng_output = 0;
    #2 neotrng_data_wire = 4;
    
    #2 $finish;     // t=28
    
end
endmodule
