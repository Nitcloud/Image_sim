`timescale 1 ns / 1 ns
module system_ctrl_pll
(
	//globol clock
	input				clk,
	input				rst_n,

	//synced signal
	output 				sys_rst_n,	//system reset
	output 				clk_c0,		//clock output	
	output 				clk_c1,		//clock output
	output 				clk_c2,		//clock output
	output				clk_c3		//clock output
//	output				clk_c4		//clock output
);

//----------------------------------
//component instantiation for system_delay
wire	delay_done;	//system init delay has done
system_init_delay
#(
	.SYS_DELAY_TOP	(24'd2500000)
//	.SYS_DELAY_TOP	(24'd256)	//Just for test
)
u_system_init_delay
(
	//global clock
	.clk		(clk),
	.rst_n		(1'b1),			//It don't depend on rst_n when power up
	//system interface
	.delay_done	(delay_done)
);
wire	pll_rst = ~delay_done;// ? ~locked : 1'b1;	//PLL reset, H valid


//-----------------------------------
//system pll module
wire	locked;
wire    clk_24M;
sys_pll	u_sys_pll 
(
	.inclk0		(clk),      //50MHz
	.areset		(pll_rst),
	.locked		(locked),
	.c0			(clk_c0),   //100MHz
	.c1			(clk_c1),   //100MHz -90deg
	.c2			(clk_c2),   //12MHz
	.c3			(clk_24M)   //24MHz
);

wire    locked2;
sys_pll2	u_sys_pll2
(
	.inclk0		(clk_24M),  //24MHz
	.areset		(pll_rst),
	.locked		(locked2),
	.c0			(clk_c3)    //74.25MHz
);
wire	clk_ref = clk_c0;
//----------------------------------------------
//rst_n sync, only controlled by the main clk
reg     rst_nr1, rst_nr2;
always @(posedge clk_ref)
begin
	if(!rst_n)
		begin
		rst_nr1 <= 1'b0;
		rst_nr2 <= 1'b0;
		end
	else
		begin
		rst_nr1 <= 1'b1;
		rst_nr2 <= rst_nr1;
		end
end
assign	sys_rst_n = rst_nr2 & locked & locked2;	//active low

endmodule

