`timescale 1ns / 1ps
module ring_counter(clk,initialize,count);
input clk,initialize;
output reg [7:0] count;
always@(posedge clk)
begin
    if(initialize) count = 8'b10000000;
    else 
    count<={count[6:0],count[7]};
end
endmodule
