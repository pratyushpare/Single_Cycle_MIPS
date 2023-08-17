`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2023 22:56:45
// Design Name: 
// Module Name: register_file
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


module register_file(clk,rst_n,reg_wr_en,reg_wr_dest,reg_wr_data,reg_rd_addr1,reg_rd_data1,reg_rd_addr2,reg_rd_data2);

//--------------------------------------------PORT DECLARATIONS------------------------------------------//
input clk,rst_n;
input reg_wr_en;
input [2:0]reg_wr_dest,reg_rd_addr1,reg_rd_addr2;
input [15:0]reg_wr_data;
output [15:0]reg_rd_data1,reg_rd_data2;

//-----------------------------------INTERMEDIATE SIGNAL DECLARATIONS-----------------------------------//
reg [15:0]reg_file[0:7];
integer i;

//-------------------------------------REGISTER FILE IMPLEMENTATION-------------------------------------//
always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                for(i=0;i<8;i=i+1)
                    reg_file[i] <= 16'd5;
            end
         else if(reg_wr_en) reg_file[reg_wr_dest] <= reg_wr_data;
    end
    
assign reg_rd_data1 = reg_file[reg_rd_addr1];
assign reg_rd_data2 = reg_file[reg_rd_addr2];
    
endmodule
