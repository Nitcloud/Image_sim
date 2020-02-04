library verilog;
use verilog.vl_types.all;
entity cycloneiiigl_post_divider is
    generic(
        dpa_divider     : integer := 1
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        cout            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of dpa_divider : constant is 1;
end cycloneiiigl_post_divider;
