`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/09 16:32:17
// Design Name: 
// Module Name: B3_top
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


module B3_top(
    input  wire  clk,//时钟信号
    input  wire  reset,//复位信号
    input  wire [15: 0] switch,//开关信号
    input  wire [ 3: 0] keys,//按键信号
    output wire [15: 0] led,//led信号
    output wire [ 7: 0] ca,
    output wire [ 3: 0] an
    );
    
    wire [31: 0] inst_addr;//指令存储器地址总线
    wire [31: 0] inst_data;//指令存储器数据总线

    wire         data_wen;//数据存储器写允许信号
    wire [31: 0] data_addr;//数据存储器地址总线
    wire [31: 0] data_dout;//数据存储器数据出总线
    wire [31: 0] data_din;//数据存储器数据入总线

    MIPS_Top cpu
    (
        .clk        ( clk           ),
        .rst        ( reset         ),
        .inst_addr  ( inst_addr     ),
        .inst_data  ( inst_data     ),
        .data_wen   ( data_wen      ),
        .data_addr  ( data_addr     ),
        .data_dout  ( data_dout     ),
        .data_din   ( data_din      )
    );

    irom irom//指令存储器ROM模块
    (
        .a      ( inst_addr [11:2]  ),
        .spo    ( inst_data         )
    );

    confreg ram//主存RAM模块
    (
        .clk        ( clk           ),
        .rst        ( reset         ),
        .data_wen   ( data_wen      ),
        .data_addr  ( data_addr     ),
        .data_dout  ( data_dout     ),
        .data_din   ( data_din      ),
        .switch     ( switch        ),
        .keys       ( keys          ),
        .led        ( led           ),
        .ca         ( ca            ),
        .an         ( an            )
    );
       
endmodule