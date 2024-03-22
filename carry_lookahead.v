`timescale 1ns / 1ps
//Description: 4-bit carry lookahead adder
module carry_lookahead(sum,c_out,a,b,c_in);
input[3:0]a,b;
input c_in;
output [3:0]sum;
output c_out;
//internal wires for carry propagate and carry generate
wire g3,g2,g1,g0,p3,p2,p1,p0;
wire c3,c2,c1,c0;
//compute caryy propagate
assign p0=a[0]^b[0], 
        p1=a[1]^b[1],
        p2=a[2]^b[2],
        p3=a[3]^b[3];
//compute carry generation
assign g0=a[0]&b[0],
        g1=a[1]&b[1],
        g2=a[2]&b[2],
        g3=a[3]&b[3];
//compute the carry lookahead
assign c0=g0|p0&c_in,
        c1=g1|p1&(g0|p0&c_in),
        c2=g2|p2&(g1|p1&(g0|p0&c_in)),
        c3=g3|p3&(g2|p2&(g1|p1&(g0|p0&c_in)));
//compute sum
assign sum[0]=p0^c_in,
        sum[1]=p1^c0,
        sum[2]=p2^c1,
        sum[3]=p3^c2;
assign c_out=c3;
endmodule
