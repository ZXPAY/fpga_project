module jkff(q, q_bar, j, k, clk, pr, cl);
// pr: preset, active low
// cl: clear, active low
input clk, j, k, pr, cl;
output q, q_bar;

reg q, q_bar;
initial begin q=1'b0; q_bar=1'b1; end
always @(posedge clk) begin
	if(pr && cl) begin
		case({j, k})
			{1'b0, 1'b0}:begin q<=q; q_bar<=q_bar;   end
			{1'b0, 1'b1}:begin q<=1'b0; q_bar<=1'b1; end
			{1'b1, 1'b0}:begin q<=1'b1; q_bar<=1'b0; end
			{1'b1, 1'b1}:begin q<=~q; q_bar<=~q_bar; end
		endcase	
	end
	else if(!cl) begin
		q <= 1'b0;
		q_bar <= 1'b1;
	end
	else if(!pr) begin
		q <= 1'b1;
		q_bar <= 1'b0;
	end
end

endmodule
