`timescale 1ns/1ns
module lcd_driver_zoom
#(
    parameter   X_START	= 11'd192,
    parameter   Y_START = 11'd60,
    parameter	X_ZOOM	= 11'd640,
    parameter   Y_ZOOM  = 11'd480
)
(  	
	//global clock
	input			clk,			//system clock
	input			rst_n,     		//sync reset
	
	//lcd interface
	output			lcd_dclk,   	//lcd pixel clock
	output			lcd_blank,		//lcd blank
	output			lcd_sync,		//lcd sync
	output			lcd_hs,	    	//lcd horizontal sync
	output			lcd_vs,	    	//lcd vertical sync
	output			lcd_en,			//lcd display enable
	output	[23:0]	lcd_rgb,		//lcd display data

	//user interface
	output			lcd_request,	//lcd data request
	output	[10:0]	lcd_xpos,		//lcd horizontal coordinate
	output	[10:0]	lcd_ypos,		//lcd vertical coordinate
	input	[23:0]	lcd_data		//lcd data
);	 
`include "lcd_para.v"  

/*******************************************
		SYNC--BACK--DISP--FRONT
*******************************************/
//------------------------------------------
//h_sync counter & generator
reg [10:0] hcnt; 
always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		hcnt <= 11'd0;
	else
		begin
        if(hcnt < `H_TOTAL - 1'b1)		//line over			
            hcnt <= hcnt + 1'b1;
        else
            hcnt <= 11'd0;
		end
end 
assign	lcd_hs = (hcnt <= `H_SYNC - 1'b1) ? 1'b0 : 1'b1;

//------------------------------------------
//v_sync counter & generator
reg [10:0] vcnt;
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		vcnt <= 11'b0;
	else if(hcnt == `H_TOTAL - 1'b1)		//line over
		begin
		if(vcnt < `V_TOTAL - 1'b1)		//frame over
			vcnt <= vcnt + 1'b1;
		else
			vcnt <= 11'd0;
		end
end
assign	lcd_vs = (vcnt <= `V_SYNC - 1'b1) ? 1'b0 : 1'b1;

//------------------------------------------
//LCELL	LCELL(.in(clk),.out(lcd_dclk));
assign	lcd_dclk = clk;
assign	lcd_blank = lcd_hs & lcd_vs;		
assign	lcd_sync = 1'b0;

//-----------------------------------------
assign	lcd_en		=	(hcnt >= `H_SYNC + `H_BACK  && hcnt < `H_SYNC + `H_BACK + `H_DISP) &&
						(vcnt >= `V_SYNC + `V_BACK  && vcnt < `V_SYNC + `V_BACK + `V_DISP) 
						? 1'b1 : 1'b0;

						
assign	lcd_rgb 	= 	lcd_request ? lcd_data : 24'd0;

//------------------------------------------
//ahead x clock
localparam	H_AHEAD = 	2'd1;
assign	lcd_request	=	(hcnt >= `H_SYNC + `H_BACK + X_START - H_AHEAD  && hcnt < `H_SYNC + `H_BACK + X_START + X_ZOOM - H_AHEAD) &&
						(vcnt >= `V_SYNC + `V_BACK + Y_START && vcnt < `V_SYNC + `V_BACK + Y_START + Y_ZOOM) 
						? 1'b1 : 1'b0;
//-----------------------------------------
//lcd xpos & ypos
assign	lcd_xpos	= 	lcd_request ? (hcnt - (`H_SYNC + `H_BACK - 1'b1) - X_START) : 11'd0;
assign	lcd_ypos	= 	lcd_request ? (vcnt - (`V_SYNC + `V_BACK - 1'b1)) : 11'd0;

endmodule
