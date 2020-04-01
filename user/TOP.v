`timescale 1ns/1ns
module TOP #(
	parameter RAW2RG888_YUV444	= "ON",
	parameter GRAY_MEDIUM		= "ON",
	parameter GRAY_SOBEL 		= "ON",
	parameter GRAY_EROSION		= "ON",
	parameter GRAY_DILATION		= "ON",
	parameter IMG_HDISP 		= 11'd640,	//640*480
	parameter IMG_VDISP 		= 11'd480
) (
	//global clock
	input				clk,  				//cmos video pixel clock
	input				rst_n,				//global reset

	//Image data prepred to be processd
	input				per_frame_vsync,	//Prepared Image data vsync valid signal
	input				per_frame_href,		//Prepared Image data href vaild  signal
	input		[7:0]	per_img_RAW,		//Prepared Image data of YCbCr 4:2:2 {CbY} {CrY}

	//Image data has been processd
	output				post_frame_vsync,	//Processed Image data vsync valid signal
	output				post_frame_href,	//Processed Image data href vaild  signal
	output		[7:0]	post_img_Gray,		//Processed Image Gray output
	
	//user interface
	input		[7:0]	Sobel_Threshold		//Sobel Threshold for image edge detect	
);

Video_Image_Processor #(
    .RAW2RG888_YUV444 ( "ON"    ),
    .GRAY_MEDIUM      ( "ON"    ),
    .GRAY_SOBEL       ( "ON"    ),
    .GRAY_EROSION     ( "ON"    ),
    .GRAY_DILATION    ( "ON"    ),
    .IMG_HDISP        ( IMG_HDISP ),
    .IMG_VDISP        ( IMG_VDISP )
) u_Video_Image_Processor (
    .clk                     ( clk                ),
    .rst_n                   ( rst_n              ),
    .per_frame_vsync         ( per_frame_vsync    ),
    .per_frame_href          ( per_frame_href     ),
    .per_img_RAW             ( per_img_RAW        ),
    .Sobel_Threshold         ( Sobel_Threshold    ),

    .post_frame_vsync        ( post_frame_vsync   ),
    .post_frame_href         ( post_frame_href    ),
    .post_img_Gray           ( post_img_Gray      )
);

endmodule
