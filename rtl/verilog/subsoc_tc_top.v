//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Xess Traffic Cop                                            ////
////                                                              ////
////  This file is part of the OR1K test application              ////
////  http://www.opencores.org/cores/or1k/                        ////
////                                                              ////
////  Description                                                 ////
////  This block connectes the RISC and peripheral controller     ////
////  cores together.                                             ////
////                                                              ////
////  To Do:                                                      ////
////   - nothing really                                           ////
////                                                              ////
////  Author(s):                                                  ////
////      - Damjan Lampret, lampret@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002 OpenCores                                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: tc_top.v,v $
// Revision 1.4  2004/04/05 08:44:34  lampret
// Merged branch_qmem into main tree.
//
// Revision 1.2  2002/03/29 20:57:30  lampret
// Removed unused ports wb_clki and wb_rst_i
//
// Revision 1.1.1.1  2002/03/21 16:55:44  lampret
// First import of the "new" XESS XSV environment.
//
//
//

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on

`include "tc_defines.v"

//
// Traffic Cop Top
//
module subsoc_tc_top (
	wb_clk_i,
	wb_rst_i,

	i4_wb_cyc_i,
	i4_wb_stb_i,
	i4_wb_adr_i,
	i4_wb_sel_i,
	i4_wb_we_i,
	i4_wb_dat_i,
	i4_wb_dat_o,
	i4_wb_ack_o,
	i4_wb_err_o,

	i5_wb_cyc_i,
	i5_wb_stb_i,
	i5_wb_adr_i,
	i5_wb_sel_i,
	i5_wb_we_i,
	i5_wb_dat_i,
	i5_wb_dat_o,
	i5_wb_ack_o,
	i5_wb_err_o,

	t0_wb_cyc_o,
	t0_wb_stb_o,
	t0_wb_adr_o,
	t0_wb_sel_o,
	t0_wb_we_o,
	t0_wb_dat_o,
	t0_wb_dat_i,
	t0_wb_ack_i,
	t0_wb_err_i,

	t1_wb_cyc_o,
	t1_wb_stb_o,
	t1_wb_adr_o,
	t1_wb_sel_o,
	t1_wb_we_o,
	t1_wb_dat_o,
	t1_wb_dat_i,
	t1_wb_ack_i,
	t1_wb_err_i,

	t2_wb_cyc_o,
	t2_wb_stb_o,
	t2_wb_adr_o,
	t2_wb_sel_o,
	t2_wb_we_o,
	t2_wb_dat_o,
	t2_wb_dat_i,
	t2_wb_ack_i,
	t2_wb_err_i,

	t3_wb_cyc_o,
	t3_wb_stb_o,
	t3_wb_adr_o,
	t3_wb_sel_o,
	t3_wb_we_o,
	t3_wb_dat_o,
	t3_wb_dat_i,
	t3_wb_ack_i,
	t3_wb_err_i,

	t4_wb_cyc_o,
	t4_wb_stb_o,
	t4_wb_adr_o,
	t4_wb_sel_o,
	t4_wb_we_o,
	t4_wb_dat_o,
	t4_wb_dat_i,
	t4_wb_ack_i,
	t4_wb_err_i,

	t5_wb_cyc_o,
	t5_wb_stb_o,
	t5_wb_adr_o,
	t5_wb_sel_o,
	t5_wb_we_o,
	t5_wb_dat_o,
	t5_wb_dat_i,
	t5_wb_ack_i,
	t5_wb_err_i,

	t6_wb_cyc_o,
	t6_wb_stb_o,
	t6_wb_adr_o,
	t6_wb_sel_o,
	t6_wb_we_o,
	t6_wb_dat_o,
	t6_wb_dat_i,
	t6_wb_ack_i,
	t6_wb_err_i,

	t7_wb_cyc_o,
	t7_wb_stb_o,
	t7_wb_adr_o,
	t7_wb_sel_o,
	t7_wb_we_o,
	t7_wb_dat_o,
	t7_wb_dat_i,
	t7_wb_ack_i,
	t7_wb_err_i,

	t8_wb_cyc_o,
	t8_wb_stb_o,
	t8_wb_adr_o,
	t8_wb_sel_o,
	t8_wb_we_o,
	t8_wb_dat_o,
	t8_wb_dat_i,
	t8_wb_ack_i,
	t8_wb_err_i

);

//
// Parameters
//
parameter		t0_addr_w = 4;
parameter		t0_addr = 4'd8;
parameter		t1_addr_w = 4;
parameter		t1_addr = 4'd0;
parameter		t28c_addr_w = 4;
parameter		t28_addr = 4'd0;
parameter		t28i_addr_w = 4;
parameter		t2_addr = 4'd1;
parameter		t3_addr = 4'd2;
parameter		t4_addr = 4'd3;
parameter		t5_addr = 4'd4;
parameter		t6_addr = 4'd5;
parameter		t7_addr = 4'd6;
parameter		t8_addr = 4'd7;

//
// I/O Ports
//
input			wb_clk_i;
input			wb_rst_i;


//
// WB slave i/f connecting initiator 4
//
input			i4_wb_cyc_i;
input			i4_wb_stb_i;
input	[`TC_AW-1:0]	i4_wb_adr_i;
input	[`TC_BSW-1:0]	i4_wb_sel_i;
input			i4_wb_we_i;
input	[`TC_DW-1:0]	i4_wb_dat_i;
output	[`TC_DW-1:0]	i4_wb_dat_o;
output			i4_wb_ack_o;
output			i4_wb_err_o;

//
// WB slave i/f connecting initiator 5
//
input			i5_wb_cyc_i;
input			i5_wb_stb_i;
input	[`TC_AW-1:0]	i5_wb_adr_i;
input	[`TC_BSW-1:0]	i5_wb_sel_i;
input			i5_wb_we_i;
input	[`TC_DW-1:0]	i5_wb_dat_i;
output	[`TC_DW-1:0]	i5_wb_dat_o;
output			i5_wb_ack_o;
output			i5_wb_err_o;


//
// WB master i/f connecting target 0
//
output			t0_wb_cyc_o;
output			t0_wb_stb_o;
output	[`TC_AW-1:0]	t0_wb_adr_o;
output	[`TC_BSW-1:0]	t0_wb_sel_o;
output			t0_wb_we_o;
output	[`TC_DW-1:0]	t0_wb_dat_o;
input	[`TC_DW-1:0]	t0_wb_dat_i;
input			t0_wb_ack_i;
input			t0_wb_err_i;

//
// WB master i/f connecting target 1
//
output			t1_wb_cyc_o;
output			t1_wb_stb_o;
output	[`TC_AW-1:0]	t1_wb_adr_o;
output	[`TC_BSW-1:0]	t1_wb_sel_o;
output			t1_wb_we_o;
output	[`TC_DW-1:0]	t1_wb_dat_o;
input	[`TC_DW-1:0]	t1_wb_dat_i;
input			t1_wb_ack_i;
input			t1_wb_err_i;

//
// WB master i/f connecting target 2
//
output			t2_wb_cyc_o;
output			t2_wb_stb_o;
output	[`TC_AW-1:0]	t2_wb_adr_o;
output	[`TC_BSW-1:0]	t2_wb_sel_o;
output			t2_wb_we_o;
output	[`TC_DW-1:0]	t2_wb_dat_o;
input	[`TC_DW-1:0]	t2_wb_dat_i;
input			t2_wb_ack_i;
input			t2_wb_err_i;

//
// WB master i/f connecting target 3
//
output			t3_wb_cyc_o;
output			t3_wb_stb_o;
output	[`TC_AW-1:0]	t3_wb_adr_o;
output	[`TC_BSW-1:0]	t3_wb_sel_o;
output			t3_wb_we_o;
output	[`TC_DW-1:0]	t3_wb_dat_o;
input	[`TC_DW-1:0]	t3_wb_dat_i;
input			t3_wb_ack_i;
input			t3_wb_err_i;

//
// WB master i/f connecting target 4
//
output			t4_wb_cyc_o;
output			t4_wb_stb_o;
output	[`TC_AW-1:0]	t4_wb_adr_o;
output	[`TC_BSW-1:0]	t4_wb_sel_o;
output			t4_wb_we_o;
output	[`TC_DW-1:0]	t4_wb_dat_o;
input	[`TC_DW-1:0]	t4_wb_dat_i;
input			t4_wb_ack_i;
input			t4_wb_err_i;

//
// WB master i/f connecting target 5
//
output			t5_wb_cyc_o;
output			t5_wb_stb_o;
output	[`TC_AW-1:0]	t5_wb_adr_o;
output	[`TC_BSW-1:0]	t5_wb_sel_o;
output			t5_wb_we_o;
output	[`TC_DW-1:0]	t5_wb_dat_o;
input	[`TC_DW-1:0]	t5_wb_dat_i;
input			t5_wb_ack_i;
input			t5_wb_err_i;

//
// WB master i/f connecting target 6
//
output			t6_wb_cyc_o;
output			t6_wb_stb_o;
output	[`TC_AW-1:0]	t6_wb_adr_o;
output	[`TC_BSW-1:0]	t6_wb_sel_o;
output			t6_wb_we_o;
output	[`TC_DW-1:0]	t6_wb_dat_o;
input	[`TC_DW-1:0]	t6_wb_dat_i;
input			t6_wb_ack_i;
input			t6_wb_err_i;

//
// WB master i/f connecting target 7
//
output			t7_wb_cyc_o;
output			t7_wb_stb_o;
output	[`TC_AW-1:0]	t7_wb_adr_o;
output	[`TC_BSW-1:0]	t7_wb_sel_o;
output			t7_wb_we_o;
output	[`TC_DW-1:0]	t7_wb_dat_o;
input	[`TC_DW-1:0]	t7_wb_dat_i;
input			t7_wb_ack_i;
input			t7_wb_err_i;

//
// WB master i/f connecting target 8
//
output			t8_wb_cyc_o;
output			t8_wb_stb_o;
output	[`TC_AW-1:0]	t8_wb_adr_o;
output	[`TC_BSW-1:0]	t8_wb_sel_o;
output			t8_wb_we_o;
output	[`TC_DW-1:0]	t8_wb_dat_o;
input	[`TC_DW-1:0]	t8_wb_dat_i;
input			t8_wb_ack_i;
input			t8_wb_err_i;

//
// Internal wires & registers
//

//
// Outputs for initiators from both mi_to_st blocks
//
wire	[`TC_DW-1:0]	xi4_wb_dat_o;
wire			xi4_wb_ack_o;
wire			xi4_wb_err_o;
wire	[`TC_DW-1:0]	xi5_wb_dat_o;
wire			xi5_wb_ack_o;
wire			xi5_wb_err_o;
wire	[`TC_DW-1:0]	yi4_wb_dat_o;
wire			yi4_wb_ack_o;
wire			yi4_wb_err_o;
wire	[`TC_DW-1:0]	yi5_wb_dat_o;
wire			yi5_wb_ack_o;
wire			yi5_wb_err_o;

//
// Intermediate signals connecting peripheral channel's
// mi_to_st and si_to_mt blocks.
//
wire			z_wb_cyc_i;
wire			z_wb_stb_i;
wire	[`TC_AW-1:0]	z_wb_adr_i;
wire	[`TC_BSW-1:0]	z_wb_sel_i;
wire			z_wb_we_i;
wire	[`TC_DW-1:0]	z_wb_dat_i;
wire	[`TC_DW-1:0]	z_wb_dat_t;
wire			z_wb_ack_t;
wire			z_wb_err_t;

//
// Outputs for initiators are ORed from both mi_to_st blocks
//
assign i4_wb_dat_o = xi4_wb_dat_o | yi4_wb_dat_o;
assign i4_wb_ack_o = xi4_wb_ack_o | yi4_wb_ack_o;
assign i4_wb_err_o = xi4_wb_err_o | yi4_wb_err_o;
assign i5_wb_dat_o = xi5_wb_dat_o | yi5_wb_dat_o;
assign i5_wb_ack_o = xi5_wb_ack_o | yi5_wb_ack_o;
assign i5_wb_err_o = xi5_wb_err_o | yi5_wb_err_o;

//
// From initiators to target 0
//
tc_mi_to_st #(t0_addr_w, t0_addr,
	0, t0_addr_w, t0_addr) t0_ch(
	.wb_clk_i(wb_clk_i),
	.wb_rst_i(wb_rst_i),

	.i4_wb_cyc_i(i4_wb_cyc_i),
	.i4_wb_stb_i(i4_wb_stb_i),
	.i4_wb_adr_i(i4_wb_adr_i),
	.i4_wb_sel_i(i4_wb_sel_i),
	.i4_wb_we_i(i4_wb_we_i),
	.i4_wb_dat_i(i4_wb_dat_i),
	.i4_wb_dat_o(xi4_wb_dat_o),
	.i4_wb_ack_o(xi4_wb_ack_o),
	.i4_wb_err_o(xi4_wb_err_o),

	.i5_wb_cyc_i(i5_wb_cyc_i),
	.i5_wb_stb_i(i5_wb_stb_i),
	.i5_wb_adr_i(i5_wb_adr_i),
	.i5_wb_sel_i(i5_wb_sel_i),
	.i5_wb_we_i(i5_wb_we_i),
	.i5_wb_dat_i(i5_wb_dat_i),
	.i5_wb_dat_o(xi5_wb_dat_o),
	.i5_wb_ack_o(xi5_wb_ack_o),
	.i5_wb_err_o(xi5_wb_err_o),

	.t0_wb_cyc_o(t0_wb_cyc_o),
	.t0_wb_stb_o(t0_wb_stb_o),
	.t0_wb_adr_o(t0_wb_adr_o),
	.t0_wb_sel_o(t0_wb_sel_o),
	.t0_wb_we_o(t0_wb_we_o),
	.t0_wb_dat_o(t0_wb_dat_o),
	.t0_wb_dat_i(t0_wb_dat_i),
	.t0_wb_ack_i(t0_wb_ack_i),
	.t0_wb_err_i(t0_wb_err_i)

);

//
// From initiators to targets 1-8 (upper part)
//
tc_mi_to_st #(t1_addr_w, t1_addr,
	1, t28c_addr_w, t28_addr) t18_ch_upper(
	.wb_clk_i(wb_clk_i),
	.wb_rst_i(wb_rst_i),

	.i4_wb_cyc_i(i4_wb_cyc_i),
	.i4_wb_stb_i(i4_wb_stb_i),
	.i4_wb_adr_i(i4_wb_adr_i),
	.i4_wb_sel_i(i4_wb_sel_i),
	.i4_wb_we_i(i4_wb_we_i),
	.i4_wb_dat_i(i4_wb_dat_i),
	.i4_wb_dat_o(yi4_wb_dat_o),
	.i4_wb_ack_o(yi4_wb_ack_o),
	.i4_wb_err_o(yi4_wb_err_o),

	.i5_wb_cyc_i(i5_wb_cyc_i),
	.i5_wb_stb_i(i5_wb_stb_i),
	.i5_wb_adr_i(i5_wb_adr_i),
	.i5_wb_sel_i(i5_wb_sel_i),
	.i5_wb_we_i(i5_wb_we_i),
	.i5_wb_dat_i(i5_wb_dat_i),
	.i5_wb_dat_o(yi5_wb_dat_o),
	.i5_wb_ack_o(yi5_wb_ack_o),
	.i5_wb_err_o(yi5_wb_err_o),

	.t0_wb_cyc_o(z_wb_cyc_i),
	.t0_wb_stb_o(z_wb_stb_i),
	.t0_wb_adr_o(z_wb_adr_i),
	.t0_wb_sel_o(z_wb_sel_i),
	.t0_wb_we_o(z_wb_we_i),
	.t0_wb_dat_o(z_wb_dat_i),
	.t0_wb_dat_i(z_wb_dat_t),
	.t0_wb_ack_i(z_wb_ack_t),
	.t0_wb_err_i(z_wb_err_t)

);

//
// From initiators to targets 1-8 (lower part)
//
tc_si_to_mt #(t1_addr_w, t1_addr, t28i_addr_w, t2_addr, t3_addr,
	t4_addr, t5_addr, t6_addr, t7_addr, t8_addr) t18_ch_lower(

	.i0_wb_cyc_i(z_wb_cyc_i),
	.i0_wb_stb_i(z_wb_stb_i),
	.i0_wb_adr_i(z_wb_adr_i),
	.i0_wb_sel_i(z_wb_sel_i),
	.i0_wb_we_i(z_wb_we_i),
	.i0_wb_dat_i(z_wb_dat_i),
	.i0_wb_dat_o(z_wb_dat_t),
	.i0_wb_ack_o(z_wb_ack_t),
	.i0_wb_err_o(z_wb_err_t),

	.t0_wb_cyc_o(t1_wb_cyc_o),
	.t0_wb_stb_o(t1_wb_stb_o),
	.t0_wb_adr_o(t1_wb_adr_o),
	.t0_wb_sel_o(t1_wb_sel_o),
	.t0_wb_we_o(t1_wb_we_o),
	.t0_wb_dat_o(t1_wb_dat_o),
	.t0_wb_dat_i(t1_wb_dat_i),
	.t0_wb_ack_i(t1_wb_ack_i),
	.t0_wb_err_i(t1_wb_err_i),

	.t1_wb_cyc_o(t2_wb_cyc_o),
	.t1_wb_stb_o(t2_wb_stb_o),
	.t1_wb_adr_o(t2_wb_adr_o),
	.t1_wb_sel_o(t2_wb_sel_o),
	.t1_wb_we_o(t2_wb_we_o),
	.t1_wb_dat_o(t2_wb_dat_o),
	.t1_wb_dat_i(t2_wb_dat_i),
	.t1_wb_ack_i(t2_wb_ack_i),
	.t1_wb_err_i(t2_wb_err_i),

	.t2_wb_cyc_o(t3_wb_cyc_o),
	.t2_wb_stb_o(t3_wb_stb_o),
	.t2_wb_adr_o(t3_wb_adr_o),
	.t2_wb_sel_o(t3_wb_sel_o),
	.t2_wb_we_o(t3_wb_we_o),
	.t2_wb_dat_o(t3_wb_dat_o),
	.t2_wb_dat_i(t3_wb_dat_i),
	.t2_wb_ack_i(t3_wb_ack_i),
	.t2_wb_err_i(t3_wb_err_i),

	.t3_wb_cyc_o(t4_wb_cyc_o),
	.t3_wb_stb_o(t4_wb_stb_o),
	.t3_wb_adr_o(t4_wb_adr_o),
	.t3_wb_sel_o(t4_wb_sel_o),
	.t3_wb_we_o(t4_wb_we_o),
	.t3_wb_dat_o(t4_wb_dat_o),
	.t3_wb_dat_i(t4_wb_dat_i),
	.t3_wb_ack_i(t4_wb_ack_i),
	.t3_wb_err_i(t4_wb_err_i),

	.t4_wb_cyc_o(t5_wb_cyc_o),
	.t4_wb_stb_o(t5_wb_stb_o),
	.t4_wb_adr_o(t5_wb_adr_o),
	.t4_wb_sel_o(t5_wb_sel_o),
	.t4_wb_we_o(t5_wb_we_o),
	.t4_wb_dat_o(t5_wb_dat_o),
	.t4_wb_dat_i(t5_wb_dat_i),
	.t4_wb_ack_i(t5_wb_ack_i),
	.t4_wb_err_i(t5_wb_err_i),

	.t5_wb_cyc_o(t6_wb_cyc_o),
	.t5_wb_stb_o(t6_wb_stb_o),
	.t5_wb_adr_o(t6_wb_adr_o),
	.t5_wb_sel_o(t6_wb_sel_o),
	.t5_wb_we_o(t6_wb_we_o),
	.t5_wb_dat_o(t6_wb_dat_o),
	.t5_wb_dat_i(t6_wb_dat_i),
	.t5_wb_ack_i(t6_wb_ack_i),
	.t5_wb_err_i(t6_wb_err_i),

	.t6_wb_cyc_o(t7_wb_cyc_o),
	.t6_wb_stb_o(t7_wb_stb_o),
	.t6_wb_adr_o(t7_wb_adr_o),
	.t6_wb_sel_o(t7_wb_sel_o),
	.t6_wb_we_o(t7_wb_we_o),
	.t6_wb_dat_o(t7_wb_dat_o),
	.t6_wb_dat_i(t7_wb_dat_i),
	.t6_wb_ack_i(t7_wb_ack_i),
	.t6_wb_err_i(t7_wb_err_i),

	.t7_wb_cyc_o(t8_wb_cyc_o),
	.t7_wb_stb_o(t8_wb_stb_o),
	.t7_wb_adr_o(t8_wb_adr_o),
	.t7_wb_sel_o(t8_wb_sel_o),
	.t7_wb_we_o(t8_wb_we_o),
	.t7_wb_dat_o(t8_wb_dat_o),
	.t7_wb_dat_i(t8_wb_dat_i),
	.t7_wb_ack_i(t8_wb_ack_i),
	.t7_wb_err_i(t8_wb_err_i)

);

endmodule

