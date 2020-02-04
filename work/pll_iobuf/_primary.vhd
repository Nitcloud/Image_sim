library verilog;
use verilog.vl_types.all;
entity pll_iobuf is
    port(
        i               : in     vl_logic;
        oe              : in     vl_logic;
        io              : inout  vl_logic;
        o               : out    vl_logic
    );
end pll_iobuf;
