library verilog;
use verilog.vl_types.all;
entity dcfifo_dffpipe is
    generic(
        lpm_delay       : integer := 1;
        lpm_width       : integer := 64;
        delay           : vl_notype
    );
    port(
        d               : in     vl_logic_vector;
        clock           : in     vl_logic;
        aclr            : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_delay : constant is 1;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of delay : constant is 3;
end dcfifo_dffpipe;
