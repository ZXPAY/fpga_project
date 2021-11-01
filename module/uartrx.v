module uartrx(rx_data, rx, clk, trigger);
output reg [0:7] rx_data;
input clk;
output reg trigger;
input rx;

reg [0:4] cnt = 0;
reg en = 1'b0;
reg start;
reg stop;

initial begin
	rx_data = 8'b00000000;
	trigger = 1'b1;
end

always @(posedge clk, negedge clk) begin
	if(cnt == 0) begin
		start = rx;
		if(start == 1'b0) begin
			en = 1'b1;
		end
	end
	if(en) begin
		if(cnt < 9) begin
			rx_data[cnt-1] <= rx;
		end
		else begin
			stop = rx;
			cnt = 0;
			en = 1'b0;
			if(stop == 1'b1) begin
				trigger <= 1'b0;
			end
		end
		// $display("rx:%h", rx);
		cnt = cnt + 1;
	end
	else begin
		cnt = 0;
	end
	trigger <= 1'b1;
end

endmodule

