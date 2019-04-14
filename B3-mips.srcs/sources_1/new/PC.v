module PC
(
    input wire clk;
    input wire rst;
    
    input wire stall;
    input wire br_flag;
    input wire [31:0] br_addr;
    output reg [31:0] pc
)

    always @(posedge clk, posedge rst) begin
        if(rst) begin
        pc <= 32'b0;// pc = 0
    end
    else begin
        if(!stall) begin // stall
            if(!br_flag)
                pc <= br_addr;
            else
                pc <= pc + 32'd4;// pc + 4
        end
    end

endmodule