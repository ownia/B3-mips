module RegFile
(
    input wire clk;
    input wire rst;

    // 读端口
    input wire [4:0] r1addr;
    input wire [4:0] r2addr;
    output reg [31:0] r1data;
    output reg [31:0] r2data;

    // 写端口
    input wire wreg;
    input wire [4:0] wraddr;
    input wire [31:0] wrdata;
);
    // 定义32个32位寄存器
    reg [31:0] GPR [31:0];// General-Purpose Registers

    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1)
            GPR[i] = 32'b0;
    end

    // 写端口的操作
    always @(posedge clk) begin
        if(!rst) begin
            if(wreg) GPR[wraddr] <= wrdata;
    end

    // 读端口的操作
    assign r1data = r1addr == 5'b0 ? 32'b0 : (r1addr == wraddr) && wreg ? wrdata : GPR[r1addr];
    assign r2data = r2addr == 5'b0 ? 32'b0 : (r2addr == wraddr) && wreg ? wrdata : GPR[r2addr];

endmodule