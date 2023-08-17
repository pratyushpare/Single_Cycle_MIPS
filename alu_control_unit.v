`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2023 22:32:05
// Design Name: 
// Module Name: alu_control_unit
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


module alu_control_unit(alu_op,alu_funct,alu_ctrl);

//-----------------------------------PORT DECLARATIONS-----------------------------------//
input [1:0]alu_op;
input [2:0]alu_funct;
output reg [2:0]alu_ctrl;

//-----------------------------------CONTROL SIGNALS GENERATION-----------------------------------//
always@(*)
    begin
        case(alu_op)
            2'b00: alu_ctrl <= alu_funct;
            2'b01: alu_ctrl <= 3'b001;
            2'b10: alu_ctrl <= 3'b100;
            2'b11: alu_ctrl <= 3'b000;
            default: alu_ctrl <= 3'b000;
        endcase
    end
endmodule
