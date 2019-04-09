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
    input  wire  clk,//ʱ���ź�
    input  wire  reset,//��λ�ź�
    input  wire [15: 0] switch,//�����ź�
    input  wire [ 3: 0] keys,//�����ź�
    output wire [15: 0] led,//led�ź�
    output wire [ 7: 0] ca,
    output wire [ 3: 0] an
    );
    
    wire [31: 0] inst_addr;//ָ��洢����ַ����
    wire [31: 0] inst_data;//ָ��洢����������

    wire         data_wen;//���ݴ洢��д�����ź�
    wire [31: 0] data_addr;//���ݴ洢����ַ����
    wire [31: 0] data_dout;//���ݴ洢�����ݳ�����
    wire [31: 0] data_din;//���ݴ洢������������

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

    irom irom//ָ��洢��ROMģ��
    (
        .a      ( inst_addr [11:2]  ),
        .spo    ( inst_data         )
    );

    confreg ram//����RAMģ��
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