//==================================================================================================
//  Filename      : Rate_Switch.v
//  Created On    : 2019-05-13 20:06:13
//  Last Modified : 2019-05-13 20:06:13
//  Author 		  : DUAN
//  Revision      : By sublime_3   
//					module version is 1.0
//  Description   : 传输速率转换模块
//					相关计算公式 :
//                  
//         			端口定义    ：input_clk  : 数据输入时钟   
//                  			 output_clk ：数据输出时钟
//         			         	 start_sig  ：一次传输的触发信号(上升沿有效)
//		                         piont_num  ：一次性传输数据的个数 (8~65536)
//		                         data_vaild ：数据输出的有信号(高电平有效)
//		                         data_tlast ：最后一个数据输出的有信号(脉冲信号)
//	Note          : 本代码遵循BSD开源协议			
//==================================================================================================
module Rate_Switch
(
    input                input_clk,
    input                output_clk,
    input                rst_n,
    input                start_sig,
    input  		  [15:0] piont_num,
    input  signed [11:0] din,
    output               data_vaild,
    output               data_tlast,
    output signed [11:0] dout
);

reg        input_clk_buf = 0;
reg        start_sig_buf = 0;
reg        start_sig_buf1 = 0;
reg        wr_cnt_busy = 0;
wire       wr_en;
wire       wr_done;
reg        wr_done_buf = 0;
reg        wr_done_buf1 = 0;
reg        wr_done_buf2 = 0;
reg        wr_done_buf3 = 0;
wire       rd_done;
reg        rd_cnt_busy = 0;
wire       rd_en;
reg [16:0] wr_cnt = 0;
reg [16:0] rd_cnt = 0;
wire       input_clk_pose = ~input_clk_buf & input_clk;
wire       start_sig_pose = ~start_sig_buf1 & start_sig_buf;

always@(posedge output_clk)
begin
    input_clk_buf <= input_clk;
end

always@(posedge output_clk)
begin
    if(input_clk_pose)
        start_sig_buf <= start_sig;
end

always@(posedge output_clk)
begin
    start_sig_buf1 <= start_sig_buf;
end
/*wr_en && wr_cnt     control*/
always@(posedge output_clk)
begin
    if(!rst_n)
        wr_cnt_busy <= 1'b0;
    else if(start_sig_pose)
        wr_cnt_busy <= 1'b1;
    else if(wr_cnt == piont_num+1 && input_clk_pose)
        wr_cnt_busy <= 1'b0;
end

always@(posedge output_clk)
begin
    if(!rst_n)
        wr_cnt <= 14'd0;
    else if(wr_cnt == piont_num+1 && input_clk_pose)
        wr_cnt <= 14'd0;
    else if(wr_cnt_busy && input_clk_pose)
        wr_cnt <= wr_cnt + 14'd1;
end

assign wr_en = (wr_cnt >=1 && wr_cnt <=piont_num+1) ? 1'b1 : 1'b0;
assign wr_done = (wr_cnt == piont_num+1  && input_clk_pose) ? 1'b1 : 1'b0;
/*rd_en && rd_cnt     control*/
always@(posedge output_clk)
begin
    wr_done_buf <= wr_done;
    wr_done_buf1 <= wr_done_buf;
    wr_done_buf2 <= wr_done_buf1;
    wr_done_buf3 <= wr_done_buf2;
end

always@(posedge output_clk)
begin
    if(!rst_n)
        rd_cnt_busy <= 1'b0;
    else if(wr_done_buf3)
        rd_cnt_busy <= 1'b1;
    else if(rd_cnt == piont_num+1)
        rd_cnt_busy <= 1'b0;
end

always@(posedge output_clk)
begin
    if(!rst_n)
        rd_cnt <= 14'd0;
    else if(rd_cnt == piont_num+1)
        rd_cnt <= 14'd0;
    else if(rd_cnt_busy)
        rd_cnt <= rd_cnt + 14'd1;
end

assign rd_en = (rd_cnt>=1 && rd_cnt<=piont_num+1) ? 1'b1 : 1'b0;
assign rd_done = (rd_cnt == piont_num+1) ? 1'b1 : 1'b0;
assign data_vaild = (rd_cnt >= 2 && rd_cnt <= piont_num+1) ? 1'b1 : 1'b0;
assign data_tlast = rd_done;

ram_0 ram_0_inst
(
    .clka(input_clk),
    .ena(wr_en),
    .wea(1'b1),
    .addra(wr_cnt),
    .dina(din),
    .clkb(output_clk),
    .enb(rd_en),
    .addrb(rd_cnt),
    .doutb(dout)
);
endmodule
