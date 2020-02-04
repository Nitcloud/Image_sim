`timescale 1ns/1ns
module	I2C_MT9M001_Gray_Config
(
	input		[7:0]	LUT_INDEX,
	output	reg	[23:0]	LUT_DATA,
	output		[7:0]	LUT_SIZE
);

//---------------------------------------------
//  LUT size
assign  LUT_SIZE = 8'd10;

//---------------------------------------------
//  Config Data LUT
always@(*)
begin
    case(LUT_INDEX)
        0   :   LUT_DATA = {24'h0D_0001};	//Reset
        1   :   LUT_DATA = {24'h0D_0000};

        2   :   LUT_DATA = {24'h01_00A4};	//Row Start, 		Default 0x000C,	12+(1024-720)/2=164
        3   :   LUT_DATA = {24'h02_0014};	//Column Start, 	Default 0x0014
        4   :   LUT_DATA = {24'h03_02CF};	//Row Width, 		Default 0x03FF,	0x02CF = 720  - 1
        5   :   LUT_DATA = {24'h04_04FF};	//Column Width, 	Default	0x04FF,	0x3FFF = 1280 - 1
        6   :   LUT_DATA = {24'h20_1104};	//Read Option1,		Defalut 0x1104,	bit[15] is for Row mirror

        7   :   LUT_DATA = {8'h09, 16'd1049};//Shutter Width, Number of rows of integration, Default 0x0419 = 1049
        8   :   LUT_DATA = {24'h0C_0000};	//Shutter Delay,	Default 0x0000
		
		9	:	LUT_DATA = {24'h35_0008};	//Global Gain,		Default 0x0008;	0x08-0x20:1-4;0x51-0x60:4.25-8;0x61-0x67:9-15
        default :   LUT_DATA = {24'h0D0000};
    endcase
end



endmodule


