`timescale 1ns / 1ps
module dff_sync_set_reset(q,qbar,d,set,reset,clock);
input set,reset,d,clock;
output q,qbar;
reg q;
assign qbar = ~q;
always@(posedge clock)
begin
if(reset==0)
q<=0;
else if(set==0)
q<=1;
else q<=d;
end
endmodule
