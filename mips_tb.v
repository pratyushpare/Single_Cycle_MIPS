`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2023 10:40:55
// Design Name: 
// Module Name: mips_tb
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


module mips_tb();

//--------------------------------------------INPUT DECLARATIONS------------------------------------------//
reg clk;  
reg rst_n;  

//--------------------------------------------OUTPUT DECLARATIONS------------------------------------------//  
wire [15:0] pc_out;  
wire [15:0] alu_result;  
     
//--------------------------------------------MODULE INSTANTIATION------------------------------------------// 
mips_top uut(  
           .clk(clk),   
           .rst_n(rst_n),   
           .pc_out(pc_out),   
           .alu_result(alu_result)    
           );  
//--------------------------------------------INITIAL BLOCK------------------------------------------//            
initial 
    begin  
        clk = 0;  
        forever #10 clk = ~clk;  
    end  
    
initial 
    begin    
        rst_n = 0;   
        #100;  
        rst_n = 1;    
    end    
endmodule
