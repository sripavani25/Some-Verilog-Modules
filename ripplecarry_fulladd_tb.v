`timescale 1ns / 1ps
module ripplecarry_fulladd_tb;
reg [3:0]A,B;
reg C_IN;
wire [3:0] SUM;
wire C_OUT;
//instantiate the 4-bit full adder
ripple_carry_full_adder_4bit FA4(.sum(SUM),.c_out(C_OUT),.a(A),.b(B),.c_in(C_IN));
initial begin
$monitor($time,"A=%b,B=%b,C_IN=%b,C_OUT=%b,SUM=%b",A,B,C_IN,C_OUT,SUM);
end 
initial 
begin
A=4'd0;B=4'd0;C_IN=1'b0;
#5 A=4'd3;B=4'd4;
#5 A=4'd2;B=4'd5;
#5 A=4'd3;B=4'd6;
#5 A=4'd9;B=4'd2;
#5 A=4'd9;B=4'd9;
#5 A=4'd10;B=4'd9;
#5 A=4'd10;B=4'd15;
#5 A=4'd15;B=4'd15;C_IN=1'b1;
#50 $finish;
end
endmodule
