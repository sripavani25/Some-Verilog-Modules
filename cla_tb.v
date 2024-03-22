`timescale 1ns / 1ps
module cla_tb;
reg [3:0]A,B;
reg C_IN;
wire [3:0]SUM;
wire C_OUT;
//instantiation
carry_lookahead CA1(SUM,C_OUT,A,B,C_IN);
initial
    begin
       A = 4'b0101;B = 4'b0011;C_IN=0;
       #10 A = 4'b1000;B = 4'b0111;
       #10 A= 4'b1010;B=4'b0101;
       #10 A=4'b1111;B=4'b1111;
       #50 $finish;
end 
initial
$monitor($time,"A=%D,B=%D,C_IN=%B,SUM=%D,C_OUT=%B",A,B,C_IN,SUM,C_OUT);
endmodule
