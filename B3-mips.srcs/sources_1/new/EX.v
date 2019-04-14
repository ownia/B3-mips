`include "defines.v"

module EX
(
    // 译码阶段到执行阶段的信息
    input wire [31:0] pc,
    input wire [3:0] aluop,
    input wire [31:0] opr1,
    input wire [31:0] opr2,
    input wire [31:0] offset,
    output reg [31:0] alures,

    // 执行结果
    output reg m_wen,
    output reg [31:0] m_addr,
    output reg [31:0] m_dout
);

    wire opr1_s = opr1[31];
    wire opr2_s = opr2[31];
    wire res_s = alures[31];

    wire [31:0] abs_opr1 = opr1_s ? ~opr1 + 32'd1 : opr1;
    wire [31:0] abs_opr2 = opr2_s ? ~opr2 + 32'd1 : opr2;

    // 根据aluop指示的运算子类型进行运算
    always @(*) begin
        case (aluop)

        endcase
    end

    // Memory Data Prepare
    wire [31:0] sl_addr = opr1 + offset;

    always @(*) begin
        m_wen <= 1'b0;
        m_addr <= 32'b0;
        m_dout <= 32'b0;

        case(aluop)
            `ALU_LW: begin
                m_addr <= sl_addr;
            end
            ~ALU_SW: begin
                m_addr <= sl_addr;
                m_dout <= opr2;
                m_wen <= 1'b1;
            end
        endcase
    end

endmodule