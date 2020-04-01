module RAM # (
	parameter 	TOTAL_RAM_Length = 2048,
	parameter   DATA_WIDTH       = 12
) (
	input                          wea,

	input                          clka,
	input                          ena,
	input  [DATA_WIDTH - 1 : 0]    addra,
	input  [DATA_WIDTH - 1 : 0]    wr_dataa,

	input                          clkb,
	input                          enb,
	input  [DATA_WIDTH - 1 : 0]    addrb,
	output [DATA_WIDTH - 1 : 0]    rd_datab
);








endmodule  //RAM		