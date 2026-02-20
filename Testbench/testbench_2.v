`timescale 1ns / 1ps
module testbench();
    reg clk,reset,wr_en,rd_en;
    reg [3:0] wr_data;
    wire [3:0] rd_data;
    wire full,empty;
   
    defparam fifo.DEPTH_BITS=3,fifo.DATA_WIDTH=4;
    fifo_buffer   fifo(clk,reset,wr_en,wr_data,rd_en,rd_data,full,empty);
    
    initial clk=1'b0;
    always #5 clk=~clk; //T=#10
    
    initial begin
    wr_en<=0;rd_en<=0;wr_data<=4'b0000;
    
    end
    
    initial begin
        reset=0; //active low
        #20 reset=1;
        //write 16'b11111111
        wr_data=4'b1111;
        wr_en=1;
        #10 wr_data=4'b0100;
        #10 rd_en=1;
        #10 rd_en=0;
        #10 wr_en=0; reset=0;
        #10 reset=1; rd_en=1;
        #10 $finish;
    end
    
endmodule
