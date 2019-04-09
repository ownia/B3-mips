`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/09 16:40:35
// Design Name: 
// Module Name: MIPS_Top
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
`include "defines.v"

module MIPS_Top(
    input  wire         clk,
    input  wire         rst,

    output wire [31: 0] inst_addr,
    input  wire [31: 0] inst_data,

    output wire         data_wen,
    output wire [31: 0] data_addr,
    output wire [31: 0] data_dout,
    input  wire [31: 0] data_din
    );

    //IF
    wire [31:0] if_pc;
    wire [31:0] if_inst;

    //ID
    wire [31:0] id_pc;
    wire [31:0] id_inst;
    wire        br_flag;
    wire [31:0] br_addr;

    wire [ 4:0] r1addr;
    wire [31:0] r1data;
    wire [ 4:0] r2addr;
    wire [31:0] r2data;
    wire [31:0] id_opr1;
    wire [31:0] id_opr2;
    wire [31:0] id_offset;
    wire [ 3:0] id_aluop;
    wire        id_wreg;
    wire [ 4:0] id_wraddr;

    //EX
    wire [31:0] ex_pc;
    wire [ 3:0] ex_aluop;
    wire [31:0] ex_opr1;
    wire [31:0] ex_opr2;
    wire [31:0] ex_offset;
    wire        ex_wreg;
    wire [ 4:0] ex_wraddr;
    wire [31:0] ex_alures;
    wire        ex_m_wen;
    wire [31:0] ex_m_addr;
    wire [31:0] ex_m_dout;

    //MEM
    wire [ 3:0] mem_aluop;
    wire [31:0] mem_alures;
    wire        mem_wreg;
    wire [ 4:0] mem_wraddr;
    wire        mem_m_wen;
    wire [31:0] mem_m_addr;
    wire [31:0] mem_m_dout;
    wire [31:0] mem_m_din_o;
    wire [ 3:0] mem_aluop_o;
    wire [31:0] mem_alures_o;
    wire        mem_wreg_o;
    wire [ 4:0] mem_wraddr_o;

    //WB
    wire [ 3:0] wb_aluop;
    wire [31:0] wb_alures;
    wire [31:0] wb_m_din;
    wire        wb_wreg;
    wire [ 4:0] wb_wraddr;
    wire [31:0] wb_wrdata;
    wire        wb_wreg_o;
    wire [ 4:0] wb_wraddr_o;

    //IF Stage   
    PC pc (
        
    );

    assign inst_addr = if_pc;
    assign if_inst = inst_data;

    //IF_ID
    IF_ID if_id (
        
    );

    //ID Stage
    ID id (

    );

    RegFile rf (

    );

    //ID_EX
    ID_EX id_ex (

    );

    //EX_MEM
    EX_MEM ex_mem (

    );

    //MEM Stage
    MEM mem (

    );

    //MEM_WB
    MEM_WB mem_wb (

    );

    //WB Stage
    WB wb (

    );



    
endmodule
