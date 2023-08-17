`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2023 22:10:17
// Design Name: 
// Module Name: data_memory
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


module data_memory(clk,rst_n,mem_addr,rd_data,wr_data,rd_en,wr_en);

//-----------------------------------PORT DECLARATIONS-----------------------------------//
input clk,rst_n;
input [15:0]mem_addr;
input [15:0]wr_data;
input wr_en,rd_en;
output [15:0]rd_data;

//---------------------------INTERMEDIATE SIGNAL DECLARATIONS----------------------------//
reg [15:0]data_mem[0:1023];
integer i;

//---------------------------WRITING INTO DATA MEMORY----------------------------//
always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                for(i=0;i<1024;i=i+1)
                    data_mem[i] <= 16'd0;
            end
        else if(wr_en) data_mem[mem_addr] <= wr_data;
    end

//---------------------------READING FROM DATA MEMORY----------------------------// 
assign rd_data = (rd_en) ? data_mem[mem_addr] : 16'd0;
   
endmodule
