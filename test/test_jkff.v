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

reg [0:7] cnt = 0;

initial begin
	$dumpfile("test_jkff.vcd");
    $dumpvars;
end

jkff test_jkff(q, q_bar, j, k, clk, pr, cl);

always #1 begin
	clk = ~clk;

	if(cnt == 5) begin
		j <= 1'b1;
		k <= 1'b0;
	end
	else if(cnt == 10) begin
		j <= 1'b0;
		k <= 1'b0;
	end
	else if(cnt == 20) begin
		j <= 1'b0;
		k <= 1'b1;
	end
	else if(cnt == 25) begin
		cl <= 0;
	end

	cnt = cnt + 1;
end


initial #30 $finish;
endmodule


