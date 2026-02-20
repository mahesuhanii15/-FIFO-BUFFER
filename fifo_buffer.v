`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2025 15:48:12
// Design Name: 
// Module Name: fifo_buffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_buffer(
        CLOCK, RESET, WR_EN, WR_DATA, RD_EN, RD_DATA, FULL, EMPTY
    );
       
    parameter DATA_WIDTH=4, DEPTH_BITS=3;
    localparam DEPTH=2**DEPTH_BITS;
    
    input CLOCK,RESET,WR_EN,RD_EN;
    output FULL, EMPTY;
    input [DATA_WIDTH-1:0] WR_DATA;
    output reg [DATA_WIDTH-1:0] RD_DATA;
    
    wire clk;
    hz1(CLOCK,clk);
    
    reg [DATA_WIDTH-1:0] FIFO[DEPTH-1:0];
    reg [DEPTH_BITS:0] WR_PTR_EXT, RD_PTR_EXT;
    wire [DEPTH_BITS-1:0] WR_PTR = WR_PTR_EXT[DEPTH_BITS-1:0];
    wire [DEPTH_BITS-1:0] RD_PTR = RD_PTR_EXT[DEPTH_BITS-1:0];
    //active low reset
    initial begin
            WR_PTR_EXT <= 0;
            RD_PTR_EXT <= 0;
            RD_DATA <=0;
        end
    
    always@(posedge clk) begin
        if(RESET==0) begin
            WR_PTR_EXT <= 0;
            RD_PTR_EXT <= 0;
            RD_DATA <=0;
        end
        else begin
        
            if(WR_EN && RD_EN ) begin //simultaneous read and write
                                   
                if (EMPTY) begin
                    RD_DATA <= WR_DATA;
                    WR_PTR_EXT <= WR_PTR_EXT+1;
                    RD_PTR_EXT <= RD_PTR_EXT+1;
                end
                else begin
                    FIFO[WR_PTR] <= WR_DATA;
                    RD_DATA <= FIFO[RD_PTR];
                    WR_PTR_EXT <= WR_PTR_EXT + 1;
                    RD_PTR_EXT <= RD_PTR_EXT + 1;
                end
            end
            
            else if(WR_EN && !FULL) begin //write
                FIFO[WR_PTR] <= WR_DATA;
                WR_PTR_EXT <= WR_PTR_EXT+1;
            end
            
            else if(RD_EN && !EMPTY) begin //read
                RD_DATA<=FIFO[RD_PTR];
                RD_PTR_EXT <= RD_PTR_EXT+1;
            end
        end
    end
    
    assign FULL = (WR_PTR_EXT[DEPTH_BITS] != RD_PTR_EXT[DEPTH_BITS]) &&
                    (WR_PTR_EXT[DEPTH_BITS-1:0] == RD_PTR_EXT[DEPTH_BITS-1:0]);
    assign EMPTY = (WR_PTR_EXT == RD_PTR_EXT);
    
    
endmodule
