`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2023 23:47:46
// Design Name: 
// Module Name: control_unit
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


module control_unit(opcode,reg_dest,mem_to_reg,alu_op,jump,branch,mem_rd,mem_wr,alu_src,reg_wr,sign_or_zero);

//--------------------------------------------PORT DECLARATIONS------------------------------------------//
input [2:0]opcode;
output reg [1:0]reg_dest,mem_to_reg,alu_op;
output reg jump,branch,mem_rd,mem_wr,alu_src,reg_wr,sign_or_zero;

//--------------------------------------------CONTROL SIGNALS GENERATION------------------------------------------//
always@(*)
    begin
        case(opcode)
            3'b000: begin
                        reg_dest = 2'b01;
                        mem_to_reg = 2'b00;
                        alu_op = 2'b00;
                        jump = 1'b0;
                        branch = 1'b0;
                        mem_rd = 1'b0;
                        mem_wr = 1'b0;
                        alu_src = 1'b0;
                        reg_wr = 1'b1;
                        sign_or_zero = 1'b1;
                     end
             3'b001: begin
                        reg_dest = 2'b00;
                        mem_to_reg = 2'b00;
                        alu_op = 2'b10;
                        jump = 1'b0;
                        branch = 1'b0;
                        mem_rd = 1'b0;
                        mem_wr = 1'b0;
                        alu_src = 1'b1;
                        reg_wr = 1'b1;
                        sign_or_zero = 1'b0;
                     end
            3'b010: begin
                        reg_dest = 2'b00;
                        mem_to_reg = 2'b00;
                        alu_op = 2'b00;
                        jump = 1'b1;
                        branch = 1'b0;
                        mem_rd = 1'b0;
                        mem_wr = 1'b0;
                        alu_src = 1'b0;
                        reg_wr = 1'b0;
                        sign_or_zero = 1'b1;
                     end
            3'b011: begin
                        reg_dest = 2'b10;
                        mem_to_reg = 2'b10;
                        alu_op = 2'b00;
                        jump = 1'b1;
                        branch = 1'b0;
                        mem_rd = 1'b0;
                        mem_wr = 1'b0;
                        alu_src = 1'b0;
                        reg_wr = 1'b1;
                        sign_or_zero = 1'b1;
                     end
            3'b100: begin
                        reg_dest = 2'b00;
                        mem_to_reg = 2'b01;
                        alu_op = 2'b11;
                        jump = 1'b0;
                        branch = 1'b0;
                        mem_rd = 1'b1;
                        mem_wr = 1'b0;
                        alu_src = 1'b1;
                        reg_wr = 1'b1;
                        sign_or_zero = 1'b1;
                     end
             3'b101: begin
                        reg_dest = 2'b00;
                        mem_to_reg = 2'b00;
                        alu_op = 2'b11;
                        jump = 1'b0;
                        branch = 1'b0;
                        mem_rd = 1'b0;
                        mem_wr = 1'b1;
                        alu_src = 1'b1;
                        reg_wr = 1'b0;
                        sign_or_zero = 1'b1;
                     end
             3'b110: begin
                        reg_dest = 2'b00;
                        mem_to_reg = 2'b00;
                        alu_op = 2'b01;
                        jump = 1'b0;
                        branch = 1'b1;
                        mem_rd = 1'b0;
                        mem_wr = 1'b0;
                        alu_src = 1'b0;
                        reg_wr = 1'b0;
                        sign_or_zero = 1'b1;
                     end
             3'b111: begin
                        reg_dest = 2'b00;
                        mem_to_reg = 2'b00;
                        alu_op = 2'b11;
                        jump = 1'b0;
                        branch = 1'b0;
                        mem_rd = 1'b0;
                        mem_wr = 1'b0;
                        alu_src = 1'b1;
                        reg_wr = 1'b1;
                        sign_or_zero = 1'b1;
                     end
            default: begin
                        reg_dest = 2'b00;
                        mem_to_reg = 2'b00;
                        alu_op = 2'b00;
                        jump = 1'b0;
                        branch = 1'b0;
                        mem_rd = 1'b0;
                        mem_wr = 1'b0;
                        alu_src = 1'b0;
                        reg_wr = 1'b0;
                        sign_or_zero = 1'b1;
                     end
       endcase                                                                                                                                                                       
    end
endmodule
