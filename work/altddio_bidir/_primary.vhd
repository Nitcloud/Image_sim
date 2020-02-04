library verilog;
use verilog.vl_types.all;
entity altddio_bidir is
    generic(
        width           : integer := 1;
        power_up_high   : string  := "OFF";
        oe_reg          : string  := "UNUSED";
        extend_oe_disable: string  := "UNUSED";
        implement_input_in_lcell: string  := "UNUSED";
        invert_output   : string  := "OFF";
        intended_device_family: string  := "Stratix";
        lpm_type        : string  := "altddio_bidir";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        datain_h        : in     vl_logic_vector;
        datain_l        : in     vl_logic_vector;
        inclock         : in     vl_logic;
        inclocken       : in     vl_logic;
        outclock        : in     vl_logic;
        outclocken      : in     vl_logic;
        aset            : in     vl_logic;
        aclr            : in     vl_logic;
        sset            : in     vl_logic;
        sclr            : in     vl_logic;
        oe              : in     vl_logic;
        dataout_h       : out    vl_logic_vector;
        dataout_l       : out    vl_logic_vector;
        combout         : out    vl_logic_vector;
        oe_out          : out    vl_logic_vector;
        dqsundelayedout : out    vl_logic_vector;
        padio           : inout  vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
    attribute mti_svvh_generic_type of power_up_high : constant is 1;
    attribute mti_svvh_generic_type of oe_reg : constant is 1;
    attribute mti_svvh_generic_type of extend_oe_disable : constant is 1;
    attribute mti_svvh_generic_type of implement_input_in_lcell : constant is 1;
    attribute mti_svvh_generic_type of invert_output : constant is 1;
    attribute mti_svvh_generic_type of intended_device_family : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end altddio_bidir;
