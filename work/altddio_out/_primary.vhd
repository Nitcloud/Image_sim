library verilog;
use verilog.vl_types.all;
entity altddio_out is
    generic(
        width           : integer := 1;
        power_up_high   : string  := "OFF";
        oe_reg          : string  := "UNUSED";
        extend_oe_disable: string  := "UNUSED";
        intended_device_family: string  := "Stratix";
        invert_output   : string  := "OFF";
        lpm_type        : string  := "altddio_out";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        datain_h        : in     vl_logic_vector;
        datain_l        : in     vl_logic_vector;
        outclock        : in     vl_logic;
        outclocken      : in     vl_logic;
        aset            : in     vl_logic;
        aclr            : in     vl_logic;
        sset            : in     vl_logic;
        sclr            : in     vl_logic;
        oe              : in     vl_logic;
        dataout         : out    vl_logic_vector;
        oe_out          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
    attribute mti_svvh_generic_type of power_up_high : constant is 1;
    attribute mti_svvh_generic_type of oe_reg : constant is 1;
    attribute mti_svvh_generic_type of extend_oe_disable : constant is 1;
    attribute mti_svvh_generic_type of intended_device_family : constant is 1;
    attribute mti_svvh_generic_type of invert_output : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end altddio_out;
