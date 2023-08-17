`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2023 00:35:17
// Design Name: 
// Module Name: mips_top
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


module mips_top(clk,rst_n,pc_out,alu_result);

//--------------------------------------------PORT DECLARATIONS------------------------------------------//
input clk,rst_n;
output [15:0]pc_out,alu_result;

//--------------------------------------------INTERMEDIATE SIGNAL DECLARATIONS------------------------------------------//
reg [15:0]pc_current;
wire signed [15:0]pc_2,pc_next;
wire [15:0]instruction;
wire [14:0]jump_shift_1;
wire [1:0]reg_dest,mem_to_reg,alu_op;
wire jump,branch,mem_rd,mem_wr,alu_src,reg_wr,sign_or_zero;
wire [15:0]reg_wr_data,reg_rd_data1,reg_rd_data2;
wire [2:0]reg_wr_dest;
wire [2:0]alu_ctrl;
wire zero_flag,carry_flag;
wire [15:0]src_op2,res;
wire [15:0]rd_data;
wire [15:0]zero_ext_imm,sign_ext_imm;
wire jr_ctrl;
wire [15:0]imm_ext,no_sign_ext;
wire signed[15:0]im_shift_1,PC_j,PC_beq,PC_4beq,PC_4beqj,PC_jr;
wire beq_control;

//--------------------------------------------PROGRAM COUNTER LOGIC------------------------------------------//
always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n) pc_current <= 16'd0;
        else pc_current <= pc_next;
    end
    
assign pc_2 = pc_current + 16'd2;

//--------------------------------------------INSTRUCTION MEMORY INSTANTIATION------------------------------------------//    
instruction_memory inst1(pc_current,instruction);

assign jump_shift_1 = {instruction[13:0],1'b0};

//--------------------------------------------CONTROL UNIT INSTANTIATION------------------------------------------// 
control_unit inst2(instruction[15:13],reg_dest,mem_to_reg,alu_op,jump,branch,mem_rd,mem_wr,alu_src,reg_wr,sign_or_zero);

assign reg_wr_dest = (reg_dest[1]) ? 3'b111 : ( reg_dest[0] ? instruction[6:4] : instruction[9:7]);

//--------------------------------------------REGISTER FILE INSTANTIATION------------------------------------------// 
register_file inst3(clk,rst_n,reg_wr,reg_wr_dest,reg_wr_data,instruction[12:10],reg_rd_data1,instruction[9:7],reg_rd_data2);

//--------------------------------------------ALU CONTROL UNIT INSTANTIATION------------------------------------------//
alu_control_unit inst4(alu_op,instruction[2:0],alu_ctrl);

assign zero_ext_imm = {{9{1'b0}},instruction[6:0]};
assign sign_ext_imm = {{9{instruction[6]}},instruction[6:0]};
assign imm_ext = (sign_or_zero) ? sign_ext_imm : zero_ext_imm;

assign jr_ctrl = ((alu_op==2'b00) && (instruction[3:0]==4'b1000)) ? 1'b1 : 1'b0;

assign src_op2 = (alu_src) ? imm_ext : reg_rd_data2;

//--------------------------------------------ALU DATAPATH UNIT INSTANTIATION------------------------------------------//
alu_datapath_unit inst5(reg_rd_data1,src_op2,res,zero_flag,carry_flag,alu_ctrl);

assign im_shift_1 = {imm_ext[14:0],1'b0};
assign no_sign_ext = ~(im_shift_1) + 1'b1;
assign PC_beq = (im_shift_1[15] == 1'b1) ? (pc_2 - no_sign_ext): (pc_2 +im_shift_1);
assign beq_control = branch & zero_flag; 
assign PC_4beq = (beq_control) ? PC_beq : pc_2;
assign PC_j = {pc_2[15],jump_shift_1};
assign PC_4beqj = jump ? PC_j : PC_4beq;
assign PC_jr = reg_rd_data1;
assign pc_next = jr_ctrl ? PC_jr : PC_4beqj;

//--------------------------------------------DATA MEMORY INSTANTIATION------------------------------------------//
data_memory inst6(clk,rst_n,res,rd_data,reg_rd_data2,mem_rd,mem_wr);

assign reg_wr_data = (mem_to_reg[1]) ? pc_2 : ( mem_to_reg[0] ? rd_data : res);

assign pc_out = pc_current;
assign alu_result = res;
endmodule
