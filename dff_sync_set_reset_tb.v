`timescale 1ns / 1ps
module dff_sync_set_reset_tb;
wire q,qbar;
reg clk,rst,set,d;
dff_sync_set_reset d1(.q(q),.qbar(qbar),.clock(clk),.set(set),.reset(rst));
initial 
clk=1'b0;
always
#5 clk=~clk;
initial
begin
set=0;rst=1;d=0;
#10 set=0;rst=0;d=0;
#10 set=0;rst=0;d=1;
#10 set=0;rst=1;d=0;
#10 set=0;rst=1;d=1;
#10 set=1;rst=0;d=0;
#10 set=1;rst=0;d=1;
#10 set=1;rst=1;d=0;
#10 set=1;rst=1;d=1;
#10 rst =1;
#10 set=1;
#10 rst=1;
#5 $finish;
end
always@(posedge clk)
begin
$monitor ("time=%D,d=%b,q=%b,qbar=%b,set=%b,rst=%b,clk=%b",$time,d,q,qbar,set,rst,clk);
end
endmodule
