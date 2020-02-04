`timescale 1ns/1ns
module Video_Image_Processor_TB;

//------------------------------------------
//Generate 24MHz driver clock
reg	clk; 
localparam PERIOD2 = 41;		//24MHz
initial	
begin
	clk = 0;
	forever	#(PERIOD2/2)	
	clk = ~clk;
end

//------------------------------------------
//Generate global reset
reg	rst_n;
task task_reset;
begin
	rst_n = 0;
	repeat(2) @(negedge clk);
	rst_n = 1;
end
endtask
wire	clk_cmos = clk;		//24MHz
wire	sys_rst_n = rst_n;	

localparam	[9:0]	IMG_HDISP = 10'd16;	
localparam	[9:0]	IMG_VDISP = 10'd4;
//-----------------------------------------
//CMOS Camera interface and data output simulation
wire			cmos_xclk;				//24MHz drive clock
wire			cmos_pclk;				//24MHz CMOS Pixel clock input
wire			cmos_vsync;				//L: vaild, H: invalid
wire			cmos_href;				//H: vaild, L: invalid
wire	[7:0]	cmos_data;				//8 bits cmos data input
Video_Image_Simulate_CMOS	
#(
	.CMOS_VSYNC_VALID	(1'b1), //VSYNC = 1
	.IMG_HDISP	(IMG_HDISP),	//640*480
	.IMG_VDISP	(IMG_VDISP)
)
u_Video_Image_Simulate_CMOS
(
	//global reset
	.rst_n				(sys_rst_n),	
	
	//CMOS Camera interface and data output simulation
	.cmos_xclk			(clk_cmos),			//25MHz cmos clock
	.cmos_pclk			(cmos_pclk),		//25MHz when rgb output
	.cmos_vsync			(cmos_vsync),		//L: vaild, H: invalid
	.cmos_href			(cmos_href),		//H: vaild, L: invalid
	.cmos_data			(cmos_data)			//8 bits cmos data input
);

wire				matrix_frame_vsync;	//Prepared Image data vsync valid signal
wire				matrix_frame_href;	//Prepared Image data href vaild  signal	
wire		[7:0]	matrix_p11, matrix_p12, matrix_p13;	//3X3 Matrix output
wire		[7:0]	matrix_p21, matrix_p22, matrix_p23;
wire		[7:0]	matrix_p31, matrix_p32, matrix_p33;
Matrix_Generate_3X3_8Bit #(
	.IMG_HDISP	(IMG_HDISP),	//640*480
	.IMG_VDISP	(IMG_VDISP)
)
Matrix_Generate_3X3_8Bit_u
(
	//global clock
	.clk					(cmos_pclk),  				//cmos video pixel clock
	.rst_n					(sys_rst_n),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync		(cmos_vsync),		//Prepared Image data vsync valid signal
	.per_frame_href			(cmos_href),		//Prepared Image data href vaild  signal
	.per_img_Gray			(cmos_data),			//Prepared Image brightness input

	//Image data has been processd
	.matrix_frame_vsync		(matrix_frame_vsync),	//Processed Image data vsync valid signal
	.matrix_frame_href		(matrix_frame_href),	//Processed Image data href vaild  signal
	.matrix_p11(matrix_p11),	.matrix_p12(matrix_p12), 	.matrix_p13(matrix_p13),	//3X3 Matrix output
	.matrix_p21(matrix_p21), 	.matrix_p22(matrix_p22), 	.matrix_p23(matrix_p23),
	.matrix_p31(matrix_p31), 	.matrix_p32(matrix_p32), 	.matrix_p33(matrix_p33)
);

//---------------------------------------------
//testbench of the RTL
task task_sysinit;
begin
end
endtask

//----------------------------------------------
initial
begin
	task_sysinit;
	task_reset;

end

endmodule

