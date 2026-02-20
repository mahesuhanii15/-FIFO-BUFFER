`timescale 1ns / 1ps

module hz1(
    input clk,
    output reg divclk
    );
    integer d=0;
    always @(posedge clk)begin
        if(d==99999999)begin
            d<=0;
        end else begin
            d<=d+1;
        end
        divclk<=(d>=50000000);
    end
endmodule