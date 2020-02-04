library verilog;
use verilog.vl_types.all;
entity altshift_taps is
    generic(
        number_of_taps  : integer := 4;
        tap_distance    : integer := 3;
        width           : integer := 8;
        power_up_state  : string  := "CLEARED";
        lpm_type        : string  := "altshift_taps";
        intended_device_family: string  := "Stratix";
        lpm_hint        : string  := "UNUSED";
        RAM_WIDTH       : vl_notype;
        TOTAL_TAP_DISTANCE: vl_notype
    );
    port(
        shiftin         : in     vl_logic_vector;
        clock           : in     vl_logic;
        clken           : in     vl_logic;
        aclr            : in     vl_logic;
        sclr            : in     vl_logic;
        shiftout        : out    vl_logic_vector;
        taps            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of number_of_taps : constant is 1;
    attribute mti_svvh_generic_type of tap_distance : constant is 1;
    attribute mti_svvh_generic_type of width : constant is 1;
    attribute mti_svvh_generic_type of power_up_state : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of intended_device_family : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
    attribute mti_svvh_generic_type of RAM_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of TOTAL_TAP_DISTANCE : constant is 3;
end altshift_taps;
