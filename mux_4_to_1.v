`timescale 1ns / 1ps
module mux_4_to_1(out,i0,i1,i2,i3,s0,s1);
output out;
input i0,i1,i2,i3;
input s0,s1;
wire s0n,s1n;
wire y0,y1,y2,y3;
not (s1n,s1);
not (s0n,s0);
and a0(y0,i0,s0n,s1n);
and a1(y1,i1,s0,s1n);
and a2(y2,i2,s0n,s1);
and a3(y3,i3,s0,s1);
or o1(out,y0,y1,y2,y3);
endmodule
