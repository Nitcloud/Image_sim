//~ `New testbench
`timescale  1ns / 1ps
module testbench();

parameter DATA_WIDTH = 21;
parameter ADDR_WIDTH = 32;
parameter MAIN_FRE   = 100; //unit MHz
reg                   clk_main  = 0;
reg                   sys_rst_n = 0;
reg                   valid_out = 0;
reg [DATA_WIDTH-1:0]  data = 0;
reg [ADDR_WIDTH-1:0]  addr = 0;

always begin
    #(500/MAIN_FRE) clk_main = ~clk_main;
end

always begin
    #50 sys_rst_n = 1;
end

//addr output
always begin
    if (sys_rst_n) begin
        #10 addr = addr + 1;#10;
    end
    else begin     
        #10 addr = 0;#10;
    end
end
//data output
always begin
    if (sys_rst_n) begin
        #10 data = addr * addr + 3;#10;
    end
    else begin     
        #10 data = 0;#10;
    end
end 

// SQRT Outputs
wire  [10:0]  q;
wire  [11:0]  remainder;
Sqrt #(
	.q_port_width (11),
	.r_port_width (12),
	.width        (21)
) SQRT_u (
    .radical                 ( data       [20:0] ),
    .q                       ( q          [10:0] ),
    .remainder               ( remainder  [11:0] )
);
// initial begin
//     $finish;
// end


endmodule