`include "jkff.v"
`timescale 1ns/1ns
// frequency: 1/2ns
module test_div;

reg clk = 0;
reg j = 1;
reg k = 1;
reg pr = 1;
reg cl = 1;
wire q, q_bar;

initial begin
	$dumpfile("test_jkff.vcd");
    $dumpvars;
end

jkff test_jkff(q, q_bar, j, k, clk, pr, cl);

always #1 begin
	clk = ~clk;
end


initial #100 $finish;
endmodule


