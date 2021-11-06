module dff(q, q_bar, d, rst, en, clk);
input clk, d, en, rst;
output reg q, q_bar;

initial begin
	q = 1'b1;
	q_bar = 1'b0;
end

always @(!rst) begin
	q <= 1'b0;
	q_bar <= 1'b1;
end

always @(posedge clk, !rst) begin
	if(!rst) begin
		q <= 1'b0;
		q_bar <= 1'b1;
	end
	else if(en) begin
		q <= d;
		q_bar <= ~d;
	end
end

endmodule
