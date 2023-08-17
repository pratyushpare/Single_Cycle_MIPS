`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2023 22:42:52
// Design Name: 
// Module Name: alu_datapath_unit
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


module alu_datapath_unit(src_op1,src_op2,res,zero_flag,carry_flag,alu_ctrl);

//-----------------------------------PORT DECLARATIONS-----------------------------------//
input [15:0]src_op1,src_op2;
input [2:0]alu_ctrl;
output reg carry_flag;
output zero_flag;
output reg [15:0]res;

//-----------------------------------ARITHMETIC AND LOGIC UNIT-----------------------------------//
always@(*)
    begin
        case(alu_ctrl)
            3'b000: {carry_flag,res} = src_op1 + src_op2;
            3'b001: {carry_flag,res} = src_op1 - src_op2;
            3'b010: res = src_op1 & src_op2;
            3'b011: res = src_op1 | src_op2;
            3'b100: if(src_op1 < src_op2) res = 16'd1; else res = 16'd0;
            default: ;
        endcase
     end
     
assign zero_flag = (res==16'd0) ? 1'b1 : 1'b0;

endmodule
