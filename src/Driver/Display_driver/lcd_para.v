`timescale 1ns/1ns

//-----------------------------------------------------------------------
//Define the color parameter RGB--8|8|8
//define colors RGB--8|8|8
`define RED		24'hFF0000   /*11111111,00000000,00000000	*/
`define GREEN	24'h00FF00   /*00000000,11111111,00000000	*/
`define BLUE  	24'h0000FF   /*00000000,00000000,11111111	*/
`define WHITE 	24'hFFFFFF   /*11111111,11111111,11111111	*/
`define BLACK 	24'h000000   /*00000000,00000000,00000000	*/
`define YELLOW	24'hFFFF00   /*11111111,11111111,00000000	*/
`define CYAN  	24'hFF00FF   /*11111111,00000000,11111111	*/
`define ROYAL 	24'h00FFFF   /*00000000,11111111,11111111	*/ 

//---------------------------------
`define	SYNC_POLARITY 1'b0

//------------------------------------
//vga parameter define


`define	VGA_1024_600_60FPS_50MHz
//`define	VGA_800_480_60FPS_30MHz
//`define	VGA_800_480_60FPS_40MHz		//LCD800*480 Timing
//`define	VGA_640_480_60FPS_25MHz
//`define	VGA_800_600_72FPS_50MHz
//`define	VGA_1024_768_60FPS_65MHz 
//`define	VGA_1280_1024_60FPS_105MHz

//---------------------------------
//	1024 * 600
`ifdef	VGA_1024_600_60FPS_50MHz
`define	H_FRONT	11'd100
`define	H_SYNC 	11'd38
`define	H_BACK 	11'd150
`define	H_DISP	11'd1024
`define	H_TOTAL	11'd1312
 					
`define	V_FRONT	11'd8  
`define	V_SYNC 	11'd3   
`define	V_BACK 	11'd24 
`define	V_DISP 	11'd600   
`define	V_TOTAL	11'd635
`endif


//---------------------------------
//	800 * 480
`ifdef	VGA_800_480_60FPS_30MHz
`define	H_FRONT	11'd16
`define	H_SYNC 	11'd1 
`define	H_BACK 	11'd46  
`define	H_DISP	11'd800
`define	H_TOTAL	11'd863
 					
`define	V_FRONT	11'd7  
`define	V_SYNC 	11'd1   
`define	V_BACK 	11'd23 
`define	V_DISP 	11'd480   
`define	V_TOTAL	11'd511
`endif


//---------------------------------
//	800 * 480
`ifdef	VGA_800_480_60FPS_40MHz			//LCD800*480 Timing
`define	H_FRONT	11'd40
`define	H_SYNC 	11'd128 
`define	H_BACK 	11'd88  
`define	H_DISP	11'd800
`define	H_TOTAL	11'd1056
 					
`define	V_FRONT	11'd8
`define	V_SYNC 	11'd2   
`define	V_BACK 	11'd35
`define	V_DISP 	11'd480   
`define	V_TOTAL	11'd525
`endif

//---------------------------------
//	640 * 480
`ifdef	VGA_640_480_60FPS_25MHz
`define	H_FRONT	11'd16
`define	H_SYNC 	11'd96  
`define	H_BACK 	11'd48  
`define	H_DISP	11'd640 
`define	H_TOTAL	11'd800 	
 					
`define	V_FRONT	11'd10  
`define	V_SYNC 	11'd2   
`define	V_BACK 	11'd33 
`define	V_DISP 	11'd480   
`define	V_TOTAL	11'd525
`endif

//---------------------------------
//	800 * 600
`ifdef VGA_800_600_72FPS_50MHz 
`define	H_FRONT	11'd56 
`define	H_SYNC 	11'd120  
`define	H_BACK 	11'd64  
`define	H_DISP 	11'd800
`define	H_TOTAL	11'd1040 
					
`define	V_FRONT	11'd37  
`define	V_SYNC 	11'd6   
`define	V_BACK 	11'd23  
`define	V_DISP 	11'd600  
`define	V_TOTAL	11'd666
`endif

//---------------------------------
//	1024 * 768	
`ifdef	VGA_1024_768_60FPS_65MHz
`define H_FRONT	11'd24	 
`define H_SYNC 	11'd136  
`define H_BACK 	11'd160 
`define H_DISP 	11'd1024  
`define H_TOTAL	11'd1344 
 					
`define V_FRONT	11'd3 
`define V_SYNC 	11'd6    
`define V_BACK 	11'd29   
`define V_DISP 	11'd768
`define V_TOTAL	11'd806
`endif


//---------------------------------
//	1280 * 1024
`ifdef	VGA_1280_1024_60FPS_105MHz
`define	H_FRONT	11'd48
`define	H_SYNC 	11'd112
`define	H_BACK 	11'd248
`define	H_DISP	11'd1280
`define	H_TOTAL	11'd1688
 					
`define	V_FRONT	11'd1
`define	V_SYNC 	11'd3   
`define	V_BACK 	11'd38 
`define	V_DISP 	11'd1024   
`define	V_TOTAL	11'd1066
`endif
