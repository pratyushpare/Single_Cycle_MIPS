`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2023 00:26:37
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(pc,instruction);

//--------------------------------------------PORT DECLARATIONS------------------------------------------//
input [15:0]pc;
output [15:0]instruction;

//--------------------------------------------INTERMEDIATE SIGNAL DECLARATIONS------------------------------------------//
reg [15:0]instr_mem[0:(1<<16)];

//--------------------------------------------INSTRUCTION MEMORY ENCODING------------------------------------------//
initial  
      begin  
                instr_mem[0]  = 16'b1000000110000000;  
                instr_mem[1]  = 16'b0010110010110010;  
                instr_mem[2]  = 16'b1101110001100111;  
                instr_mem[3]  = 16'b1101110111011001;  
                instr_mem[4]  = 16'b1111110110110001;  
                instr_mem[5]  = 16'b1100000001111011; 
                instr_mem[6]  = 16'b0000000000000000;  
                instr_mem[7]  = 16'b0000000000000000;  
                instr_mem[8]  = 16'b0000000000000000;  
                instr_mem[9]  = 16'b0000000000000000;  
                instr_mem[10] = 16'b0000000000000000;  
                instr_mem[11] = 16'b0000000000000000;  
                instr_mem[12] = 16'b0000000000000000;  
                instr_mem[13] = 16'b0000000000000000;  
                instr_mem[14] = 16'b0000000000000000;  
                instr_mem[15] = 16'b0000000000000000;  
      end 
      
assign instruction = (pc < 16) ? instr_mem[pc] : 16'd0;       
endmodule
