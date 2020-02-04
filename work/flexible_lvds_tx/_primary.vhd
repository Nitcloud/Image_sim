library verilog;
use verilog.vl_types.all;
entity flexible_lvds_tx is
    generic(
        number_of_channels: integer := 1;
        deserialization_factor: integer := 4;
        registered_input: string  := "ON";
        use_new_coreclk_ckt: string  := "FALSE";
        outclock_multiply_by: integer := 1;
        outclock_duty_cycle: integer := 50;
        outclock_divide_by: integer := 1;
        use_self_generated_outclock: string  := "FALSE";
        REGISTER_WIDTH  : vl_notype;
        DOUBLE_DESER    : vl_notype;
        LOAD_CNTR_MODULUS: vl_notype
    );
    port(
        tx_in           : in     vl_logic_vector;
        tx_fastclk      : in     vl_logic;
        tx_slowclk      : in     vl_logic;
        tx_regclk       : in     vl_logic;
        tx_locked       : in     vl_logic;
        pll_areset      : in     vl_logic;
        pll_outclock    : in     vl_logic;
        tx_out          : out    vl_logic_vector;
        tx_outclock     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of number_of_channels : constant is 1;
    attribute mti_svvh_generic_type of deserialization_factor : constant is 1;
    attribute mti_svvh_generic_type of registered_input : constant is 1;
    attribute mti_svvh_generic_type of use_new_coreclk_ckt : constant is 1;
    attribute mti_svvh_generic_type of outclock_multiply_by : constant is 1;
    attribute mti_svvh_generic_type of outclock_duty_cycle : constant is 1;
    attribute mti_svvh_generic_type of outclock_divide_by : constant is 1;
    attribute mti_svvh_generic_type of use_self_generated_outclock : constant is 1;
    attribute mti_svvh_generic_type of REGISTER_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of DOUBLE_DESER : constant is 3;
    attribute mti_svvh_generic_type of LOAD_CNTR_MODULUS : constant is 3;
end flexible_lvds_tx;
