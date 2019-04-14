`include "defines.v"

module include
(
    input wire [31:0] pc;
    input wire [31:0] inst;

    // 读取的RegFile的值
    input wire [31:0] r1data;
    input wire [31:0] r2data;

    // 输出到RegFile的信息
    output reg [4:0] r1addr;
    output reg [4:0] r2addr;
    output reg [31:0] opr1;
    output reg [31:0] opr2;

    output reg [3:0] aluop;
    output wire [31:0] offset;
    output reg wreg;
    output reg [4:0] wraddr;

    output reg br_flag;
    output reg br_addr;

    input wire [3:0] ex_aluop;
    input wire ex_wreg;
    input wire [4:0] ex_wraddr;
    input wire [31:0] ex_alures;

    input wire [3:0] mem_aluop;
    input wire mem_wreg;
    input wire [4:0] mem_wraddr
    input wire [31:0] mem_alures,
    input wire [31:0] mem_m_din,

    output reg stallreq;
);

    wire [5:0] opcode = inst[31:26];
    wire [4:0] rs = inst[25:21];
    wire [4:0] rt = inst[20:16];
    wire [4:0] rd = inst[15:11];
    wire [4:0] sa = inst[10:6];
    wire [5:0] funct = inst[5:0];
    wire [15:0] immediate = inst[15:0];
    wire [25:0] j_offset = inst[25:0];
    wire [2:0] sel = inst[3:0]

    wire [31:0] zero_ext = {16'b0, immediate};
    wire [31:0] sign_ext = {{16{immediate[15]}}, immediate};
    wire [31:0] lui_ext = {immediate, 16'b0};

    wire [31:0] pcp4 = pc + 32'd4;
    wire [31:0] br_target = pcp4 + (sign_ext << 2);

    reg [31:0] ext_imme;// 保存指令执行需要的立即数
    reg r1read;
    reg r2read;

    assign offset = sign_ext;

    always @(*) begin
 
    end



endmodule