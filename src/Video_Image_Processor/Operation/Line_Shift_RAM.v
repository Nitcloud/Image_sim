module Line_Shift_RAM 
#(
	parameter [10:0] RAM_Length = 11'd640,	//640*480
    parameter        DATA_WIDTH = 8
)
(
	input	                   clken,
	input	                   clock,
	input	[DATA_WIDTH-1:0]   shiftin,
	output	[DATA_WIDTH-1:0]   shiftout,
	output	[DATA_WIDTH-1:0]   taps0x,
	output	[DATA_WIDTH-1:0]   taps1x
);

Line_Shift_RAM #(
	.Delay_Length (RAM_Length),
	.INPUT_WIDTH (DATA_WIDTH)
)
Line_Shift_RAM_u1
(
	.clken(clken), 
	.clock(clock),
	.shiftin(shiftin),
	.shiftout(taps0x)
);

wire [7:0] shiftout_2;

Line_Shift_RAM #(
	.Delay_Length (RAM_Length),
	.INPUT_WIDTH (DATA_WIDTH)
)
Line_Shift_RAM_u2
(
	.clken(clken), 
	.clock(clock),
	.shiftin(taps0x),
	.shiftout(taps1x)
);
assign shiftout = taps1x;
endmodule