`include "dff.v"
`timescale 1ns/1ns
// frequency: 1/2ns
module test_dff;

reg d = 1;
reg clk = 1'b1;
reg en = 1'b1;
reg rst = 1'b1;
wire q, q_bar;


reg [0:1] cnt = 2'd0;

initial begin
	$dumpfile("test_dff.vcd");
        $dumpvars;
    #1 en = 1'b1;
    #1 rst = 1'b1;
end

dff test_dff(q, q_bar, d, rst, en, clk);


always #1 begin
	clk = ~clk;
    if(cnt == 0) begin
		d = ~d;
	end
	cnt = cnt + 1;
end


initial #100 $finish;
endmodule


