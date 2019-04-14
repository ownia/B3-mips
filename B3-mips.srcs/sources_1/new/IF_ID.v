module IF_ID
(
    input wire clk,
    input wire rst,

    input wire stall,
    input wire [31:0] if_pc,// 取指阶段指令地址
    input wire [31:0] if_inst,// 取指阶段指令

    output reg [31:0] id_pc,// 译码阶段指令对应地址
    output reg [31:0] id_inst// 译码阶段指令
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            id_pc <= 32'b0;// 复位时候pc为0
            id_inst <= 32'b0;// 复位时候指令为0，即空指令
        end
        else if (!stall) begin
            id_pc <= if_pc;// 其余时刻向下传递取值阶段的值
            id_inst <= if_inst;
        end
    end

endmodule