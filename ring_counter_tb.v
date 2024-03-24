`timescale 1ns / 1ps
module ring_counter_tb;
wire [7:0] COUNT;
reg CLOCK,INI;
ring_counter r1(.clk(CLOCK),.initialize(INI),.count(COUNT));
initial
CLOCK = 1'B0;
always
 #5 CLOCK=~CLOCK;
initial
begin
INI = 1'B1;
#8 INI=1'B0;
#90 INI=1'B1;
#20 INI=1'B0;
#200 $finish;
end
initial
$monitor($time,"COUNT=%D,INI=%B",COUNT,INI);
endmodule
