module mux2_1(x, y, s, m);
input x, y, s;
output m;

assign m = (~s&x)|(s&y);

endmodule

