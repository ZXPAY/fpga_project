`include "freq_div.v"
`timescale 1ns/1ns
// frequency: 1/2ns
module test_div;

reg clk = 0;
reg rst = 1'b1;
wire clk_out;

initial begin
	$dumpfile("test_div.vcd");
        $dumpvars;
end

freq_div clk_20ns(clk, clk_out, rst);

always #1 begin
	clk = ~clk;
end


initial #100 $finish;
endmodule


