library verilog;
use verilog.vl_types.all;
entity altstratixii_oct is
    generic(
        lpm_type        : string  := "altstratixii_oct"
    );
    port(
        terminationenable: in     vl_logic;
        terminationclock: in     vl_logic;
        rdn             : in     vl_logic;
        rup             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
end altstratixii_oct;
