module uarttx(tx_data, tx, clk, trigger);
input [0:7] tx_data;
input clk;
input trigger;
output tx;

reg tx;
reg [0:4] cnt = 0;
reg en = 1'b0;

initial begin
	tx <= 1'b1;
end

always @(negedge trigger) begin
	en = 1'b1;
end

always @(posedge clk, negedge clk) begin
	if(en) begin
		if(cnt == 0) begin
			tx <= 1'b0;
		end
		else if(cnt < 9) begin
			tx <= tx_data[cnt-1];
		end
		else begin
			tx <= 1'b1;
			cnt = 0;
			en = 0;
		end
		// $display("%h, %h, %h", cnt, tx, en);
		cnt = cnt + 1;
		end
	else begin
		cnt = 0;
	end
end


endmodule

