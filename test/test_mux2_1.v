`include "mux2_1.v"
module test_mux2_1;

reg x, y, s;
wire m;

mux2_1 u1(x, y, s, m);

initial begin
    x <= 1'b1;
    y <= 1'b0;

    s <= 1'b1;
    #1 $display("%g, x: %h, y: %h, s: %h", $time, x, y, s);
    #1 $display("%g, output: %h", $time, m);
    s <= 1'b0;
    #1 $display("%g, x: %h, y: %h, s: %h", $time, x, y, s);
    #1 $display("%g, output: %h", $time, m);
end

initial #4 $finish;

endmodule
