`timescale 1 ps / 1 ps
// synopsys translate_on
module read_fifo1 (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	wrusedw);

	input	  aclr;
	input	[15:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[7:0]  q;
	output	[9:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [7:0] sub_wire0;
	wire [9:0] sub_wire1;
	wire [7:0] q = sub_wire0[7:0];
	wire [9:0] wrusedw = sub_wire1[9:0];

	dcfifo_mixed_widths	dcfifo_mixed_widths_component (
				.aclr (aclr),
				.data (data),
				.rdclk (rdclk),
				.rdreq (rdreq),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.q (sub_wire0),
				.wrusedw (sub_wire1),
				.rdempty (),
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrfull ());
	defparam
		dcfifo_mixed_widths_component.intended_device_family = "Cyclone IV E",
		dcfifo_mixed_widths_component.lpm_numwords = 1024,
		dcfifo_mixed_widths_component.lpm_showahead = "OFF",
		dcfifo_mixed_widths_component.lpm_type = "dcfifo_mixed_widths",
		dcfifo_mixed_widths_component.lpm_width = 16,
		dcfifo_mixed_widths_component.lpm_widthu = 10,
		dcfifo_mixed_widths_component.lpm_widthu_r = 11,
		dcfifo_mixed_widths_component.lpm_width_r = 8,
		dcfifo_mixed_widths_component.overflow_checking = "ON",
		dcfifo_mixed_widths_component.rdsync_delaypipe = 3,
		dcfifo_mixed_widths_component.read_aclr_synch = "OFF",
		dcfifo_mixed_widths_component.underflow_checking = "ON",
		dcfifo_mixed_widths_component.use_eab = "ON",
		dcfifo_mixed_widths_component.write_aclr_synch = "OFF",
		dcfifo_mixed_widths_component.wrsync_delaypipe = 3;


endmodule

