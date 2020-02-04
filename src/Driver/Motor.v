module Motor
(
	input up_down_en,
	input CLK_50M,
	input RST_N,
	output A,
	output B,
	output C,
	output D
);

wire state;
reg A,B,C,D;
reg clk;
reg clk1;
reg clk_c;
reg [20:0] count;
reg [20:0] ccount;
reg [15:0] count1;

//分频
always@(posedge CLK_50M or negedge RST_N) begin
	if(RST_N==1'b0) begin
		clk<=1'b0;
		count<=8'b0;
	end
	else if(count==25'd80000) begin  //500HZ 
		count<=1'b0;
		clk=~clk;
	end
	else begin
		count<=count+1'd1;
		clk<=clk;
	end
end

 
 
 always@(posedge clk or negedge RST_N)
 begin
  if(RST_N==1'b0)
   begin
	 ccount<=1'b0;
	 clk_c<=1'b0;
	end
  else
    if(ccount<=25'd2000)
     begin
	    ccount<=ccount+1'd1;
	    clk_c<=1'b1;
	  end
     else clk_c<=1'b0;

 
 end
 
assign state = up_down_en;

parameter S0=3'd0,S1=3'd1,S2=3'd2,S3=3'd3,S4=3'd4,S5=3'd5,S6=3'd6,S7=3'd7;

reg[2:0]current_state,next_state;

always@(posedge clk or negedge RST_N)
begin
 if(RST_N==1'b0)
    current_state<=S0;
 else
    current_state<=next_state;
end

always@(*)
begin
 case(current_state)
  S0:
   next_state=S1;
  S1:
   next_state=S2;
  S2:
   next_state=S3;
  S3:
   next_state=S4;
  S4:
   next_state=S5;
  S5:
   next_state=S6;
  S6:
   next_state=S7;
  S7:
   next_state=S0;
	default : ;
 endcase
end

always@(posedge clk or negedge RST_N or negedge clk_c)  //正转
 if(RST_N==1'b0||clk_c==1'b0)
  begin
   A<=1'b0;
	B<=1'b0;
	C<=1'b0;
	D<=1'b0;
  end
 else if(state==1)
  begin
			if(current_state==S0)
			 begin
				A<=1'b1;
				B<=1'b0;
				C<=1'b0;
				D<=1'b0;
			 end
			 
			else if(current_state==S1)
			 begin
				A<=1'b1;
				B<=1'b1;
				C<=1'b0;
				D<=1'b0;	 
			 end
			 
			else if(current_state==S2)
			 begin
				A<=1'b0;
				B<=1'b1;
				C<=1'b0;
				D<=1'b0;	 
			 end
			 
			else if(current_state==S3)
			 begin
				A<=1'b0;
				B<=1'b1;
				C<=1'b1;
				D<=1'b0;	 
			 end
			 
			else if(current_state==S4)
			 begin
				A<=1'b0;
				B<=1'b0;
				C<=1'b1;
				D<=1'b0;	 
			 end
			 
			else if(current_state==S5)
			 begin
				A<=1'b0;
				B<=1'b0;
				C<=1'b1;
				D<=1'b1;	 
			 end
			 
			else if(current_state==S6)
			 begin
				A<=1'b0;
				B<=1'b0;
				C<=1'b0;
				D<=1'b1;	 
			 end
			 
			else if(current_state==S7)
			 begin
				A<=1'b1;
				B<=1'b0;
				C<=1'b0;
				D<=1'b1;	 
			 end
			 
			 else;
			 
  end
 else if(state==0)
  begin
			if(current_state==S7)
			 begin
				A<=1'b1;
				B<=1'b0;
				C<=1'b0;
				D<=1'b0;
			 end
			 
			else if(current_state==S6)
			 begin
				A<=1'b1;
				B<=1'b1;
				C<=1'b0;
				D<=1'b0;	 
			 end
			 
			else if(current_state==S5)
			 begin
				A<=1'b0;
				B<=1'b1;
				C<=1'b0;
				D<=1'b0;	 
			 end
			 
			else if(current_state==S4)
			 begin
				A<=1'b0;
				B<=1'b1;
				C<=1'b1;
				D<=1'b0;	 
			 end
			 
			else if(current_state==S3)
			 begin
				A<=1'b0;
				B<=1'b0;
				C<=1'b1;
				D<=1'b0;	 
			 end
			 
			else if(current_state==S2)
			 begin
				A<=1'b0;
				B<=1'b0;
				C<=1'b1;
				D<=1'b1;	 
			 end
			 
			else if(current_state==S1)
			 begin
				A<=1'b0;
				B<=1'b0;
				C<=1'b0;
				D<=1'b1;	 
			 end
			 
			else if(current_state==S0)
			 begin
				A<=1'b1;
				B<=1'b0;
				C<=1'b0;
				D<=1'b1;	 
			 end
			 
			 else;
			 
  end



endmodule								