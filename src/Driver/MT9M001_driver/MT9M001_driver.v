module MT9M001_driver #
(
    parameter CLOCK_MAIN  =	96_000000,
    parameter CLOCK_CMOS  =	24_000000,
    parameter CLOCK_I2C   = 100_000
)
(
    input           clk_ref,
    input           clk_cmos,
    input           sys_rst_n,

	output			cmos_sclk,		//cmos i2c clock
	inout			cmos_sdat,		//cmos i2c data

	input			cmos_pclk,		//cmos pxiel clock
	output			cmos_xclk,		//cmos externl clock

	input			cmos_vsync,		//cmos vsync
	input			cmos_href,		//cmos hsync refrence

    input	[7:0]	cmos_data,		//cmos data

	output          cmos_ctl0,      //Sensor Ctrl0
	input			cmos_ctl1,		//Sensor Ctrl1
	output			cmos_ctl2,		//Sensor Ctrl2
	output			cmos_ctl3, 		//Sensor Ctrl3    

    //CMOS SYNC Data output
	output			cmos_frame_vsync,	//cmos frame data vsync valid signal
	output			cmos_frame_href,	//cmos frame data href vaild  signal
	output	[7:0]	cmos_frame_Gray,	//cmos frame RAW output	
	
	//user interface
	output	[7:0]	cmos_fps_rate		//cmos frame output rate
);

//-------------------------------------------------------
//CMOS Sensor Control port
//Configure CMOS Sensor control port
//MT9M001:	CTL0 = NC;	CTL1 = Strobe;	CTL2 = Trigger;   	CTL3 = NC
assign	cmos_ctl0 = 1'bz;	
assign	cmos_ctl2 = 1'b1;   
assign	cmos_ctl3 = 1'bZ;

//----------------------------------------------
//i2c timing controller module of 16Bit
wire	[7:0]	I2C_config_index;
wire	[23:0]	I2C_config_data;
wire	[7:0]	I2C_config_size;
wire			I2C_config_done;
wire	[15:0]	I2C_rdata;		//i2c register data
I2C_timing_ctrl_16bit
#(
	.CLK_FREQ	(CLOCK_MAIN),	//100 MHz
	.I2C_FREQ	(CLOCK_I2C)		//100 kHz(<= 400KHz)
)
u_I2C_timing_ctrl_16bit
(
	//global clock
	.clk				(clk_ref),		//100MHz
	.rst_n				(sys_rst_n),	//system reset
			
	//i2c interface
	.i2c_sclk			(cmos_sclk			),	//i2c clock
	.i2c_sdat			(cmos_sdat			),	//i2c data for bidirection

	//i2c config data
	.i2c_config_index	(I2C_config_index	),	//i2c config reg index, read 2 reg and write xx reg
	.i2c_config_data	({8'hBA, I2C_config_data}),	//i2c config data
	.i2c_config_size	(I2C_config_size	),	//i2c config data counte
	.i2c_config_done	(I2C_config_done	),	//i2c config timing complete
	.i2c_rdata			(I2C_rdata			)	//i2c register data while read i2c slave
);


//----------------------------------
//I2C Configure Data of MT9M001
I2C_MT9M001_Gray_Config u_I2C_MT9M001_Gray_Config 
(
    .LUT_INDEX  (I2C_config_index   ),
    .LUT_DATA   (I2C_config_data    ),
    .LUT_SIZE   (I2C_config_size    )
);


//--------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------
//cmos video image capture
wire			cmos_init_done = I2C_config_done;	///cmos camera init done
CMOS_Capture_RAW_Gray	
#(
	.CMOS_FRAME_WAITCNT		(4'd10),	//Wait n fps for steady(OmniVision need 10 Frame)
    .CLOCK_CMOS             (CLOCK_CMOS)
)
u_CMOS_Capture_RAW_Gray
(
	//global clock
	.clk_cmos				(clk_cmos),			//24MHz CMOS Driver clock input
	.rst_n					(sys_rst_n & cmos_init_done),	//global reset

	//CMOS Sensor Interface
	.cmos_pclk				(cmos_pclk),  		//24MHz CMOS Pixel clock input
	.cmos_xclk				(cmos_xclk),		//24MHz drive clock
	.cmos_data				(cmos_data),		//8 bits cmos data input
	.cmos_vsync				(cmos_vsync),		//L: vaild, H: invalid
	.cmos_href				(cmos_href),		//H: vaild, L: invalid
	
	//CMOS SYNC Data output
	.cmos_frame_vsync		(cmos_frame_vsync),	//cmos frame data vsync valid signal
	.cmos_frame_href		(cmos_frame_href),	//cmos frame data href vaild  signal
	.cmos_frame_data		(cmos_frame_Gray),	//cmos frame data output: 8 Bit raw data
	
	//user interface
	.cmos_fps_rate			(cmos_fps_rate)		//cmos image output rate
);

endmodule // MT9N001_driver