module freq_div(clk, clk_out, rst);
input clk, rst;
output reg clk_out;
reg [0:16] cnt;

parameter div_value_20ns = 4'd5 - 1; 

initial begin
	cnt = 0;
	clk_out <= 1'b1;
end

always @(posedge clk, rst) begin
	if(!rst) begin
		clk_out <= 1'b0;
	end
	else if(cnt == div_value_20ns) begin
		clk_out = ~clk_out;
		cnt = 0;
	end
	else begin
		cnt = cnt + 1;
	end
end

endmodule

