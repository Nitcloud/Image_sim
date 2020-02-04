library verilog;
use verilog.vl_types.all;
entity altfp_mult is
    generic(
        width_exp       : integer := 8;
        width_man       : integer := 23;
        dedicated_multiplier_circuitry: string  := "AUTO";
        reduced_functionality: string  := "NO";
        pipeline        : integer := 5;
        denormal_support: string  := "YES";
        exception_handling: string  := "YES";
        lpm_hint        : string  := "UNUSED";
        lpm_type        : string  := "altfp_mult";
        LATENCY         : vl_notype;
        WIDTH_MAN_EXP   : vl_notype
    );
    port(
        clock           : in     vl_logic;
        clk_en          : in     vl_logic;
        aclr            : in     vl_logic;
        dataa           : in     vl_logic_vector;
        datab           : in     vl_logic_vector;
        result          : out    vl_logic_vector;
        overflow        : out    vl_logic;
        underflow       : out    vl_logic;
        zero            : out    vl_logic;
        denormal        : out    vl_logic;
        indefinite      : out    vl_logic;
        nan             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width_exp : constant is 1;
    attribute mti_svvh_generic_type of width_man : constant is 1;
    attribute mti_svvh_generic_type of dedicated_multiplier_circuitry : constant is 1;
    attribute mti_svvh_generic_type of reduced_functionality : constant is 1;
    attribute mti_svvh_generic_type of pipeline : constant is 1;
    attribute mti_svvh_generic_type of denormal_support : constant is 1;
    attribute mti_svvh_generic_type of exception_handling : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of LATENCY : constant is 3;
    attribute mti_svvh_generic_type of WIDTH_MAN_EXP : constant is 3;
end altfp_mult;
