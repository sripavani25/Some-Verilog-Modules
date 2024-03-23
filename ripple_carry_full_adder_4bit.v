`timescale 1ns / 1ps
// Design Name: 4 bit ripple carry adder
module ripple_carry_full_adder_4bit(output[3:0]sum,
                                    output c_out,
                                    input[3:0] a,b,
                                    input c_in);
 wire c1,c2,c3;
 //instantiate four 1-bit full adders
 fulladd fa0(sum[0],c1,a[0],b[0],c_in);
 fulladd fa1(sum[1],c2,a[1],b[1],c1);
 fulladd fa2(sum[2],c3,a[2],b[2],c2);
 fulladd fa3(sum[3],c_out,a[3],b[3],c3);
endmodule
//define a 1-bit full adder
module fulladd(sum,c_out,a,b,c_in);
output sum,c_out;
input a,b,c_in;
assign sum = a^b^c_in;
assign c_out = (a&b)|(b&c_in)|(c_in&a);
endmodule
