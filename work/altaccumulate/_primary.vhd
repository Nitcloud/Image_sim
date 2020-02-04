library verilog;
use verilog.vl_types.all;
entity altaccumulate is
    generic(
        width_in        : integer := 4;
        width_out       : integer := 8;
        lpm_representation: string  := "UNSIGNED";
        extra_latency   : integer := 0;
        use_wys         : string  := "ON";
        lpm_hint        : string  := "UNUSED";
        lpm_type        : string  := "altaccumulate"
    );
    port(
        cin             : in     vl_logic;
        data            : in     vl_logic_vector;
        add_sub         : in     vl_logic;
        clock           : in     vl_logic;
        sload           : in     vl_logic;
        clken           : in     vl_logic;
        sign_data       : in     vl_logic;
        aclr            : in     vl_logic;
        result          : out    vl_logic_vector;
        cout            : out    vl_logic;
        overflow        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width_in : constant is 1;
    attribute mti_svvh_generic_type of width_out : constant is 1;
    attribute mti_svvh_generic_type of lpm_representation : constant is 1;
    attribute mti_svvh_generic_type of extra_latency : constant is 1;
    attribute mti_svvh_generic_type of use_wys : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
end altaccumulate;
