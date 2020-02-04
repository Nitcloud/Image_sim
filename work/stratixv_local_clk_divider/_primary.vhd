library verilog;
use verilog.vl_types.all;
entity stratixv_local_clk_divider is
    generic(
        clk_divide_by   : integer := 1
    );
    port(
        clkin           : in     vl_logic;
        lloaden         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of clk_divide_by : constant is 1;
end stratixv_local_clk_divider;
