`timescale 1ns / 1ps
module mux_4to1_tb;
reg I0,I1,I2,I3;
reg S1,S0;
wire OUT;
//instantiate the multiplexer
mux_4_to_1 m1(OUT,I0,I1,I2,I3,S0,S1);
initial
begin
I0=1;I1=0;I2=0;I3=1;
S0=0;S1=0;
#50 S0=1;S1=0;
#50 S0=0;S1=1;
#50 S0=1;S1=1;
end
initial
begin 
$monitor($time,"S1 = %B,S0 = %B, OUT=%B",S1,S0,OUT);
end
endmodule
