`include "uarttx.v"
`include "uartrx.v"
module test_uartrx;

reg clk = 1'b0;
wire trigger_rx;
reg trigger_tx;
reg rx_in;
wire tx_out;
reg [0:7] testSend;
wire [0:7] testRec;
reg [0:4] cnt = 0;

initial begin
	$dumpfile("test_uart.vcd");
        $dumpvars;
	testSend = 8'b10111010;
	rx_in = 1'b1;
	trigger_tx = 1'b1;
end

uarttx uart1tx(testSend, tx_out, clk, trigger_tx);
uartrx uart1rx(testRec, tx_out, clk, trigger_rx);

always @(negedge trigger_rx) begin
	$display("data:%h", testRec[0]);
	$display("data:%h", testRec[1]);
	$display("data:%h", testRec[2]);
	$display("data:%h", testRec[3]);
	$display("data:%h", testRec[4]);
	$display("data:%h", testRec[5]);
	$display("data:%h", testRec[6]);
	$display("data:%h", testRec[7]);
end

always #1 begin
	clk = ~clk;
	trigger_tx = 1'b0;
end


initial #15 $finish;
endmodule
