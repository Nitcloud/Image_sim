library verilog;
use verilog.vl_types.all;
entity stratixgx_dpa_lvds_rx is
    generic(
        number_of_channels: integer := 1;
        deserialization_factor: integer := 4;
        use_coreclock_input: string  := "OFF";
        enable_dpa_fifo : string  := "ON";
        registered_output: string  := "ON";
        REGISTER_WIDTH  : vl_notype
    );
    port(
        rx_in           : in     vl_logic_vector;
        rx_fastclk      : in     vl_logic;
        rx_slowclk      : in     vl_logic;
        rx_locked       : in     vl_logic;
        rx_coreclk      : in     vl_logic_vector;
        rx_reset        : in     vl_logic_vector;
        rx_dpll_reset   : in     vl_logic_vector;
        rx_channel_data_align: in     vl_logic_vector;
        rx_out          : out    vl_logic_vector;
        rx_dpa_locked   : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of number_of_channels : constant is 1;
    attribute mti_svvh_generic_type of deserialization_factor : constant is 1;
    attribute mti_svvh_generic_type of use_coreclock_input : constant is 1;
    attribute mti_svvh_generic_type of enable_dpa_fifo : constant is 1;
    attribute mti_svvh_generic_type of registered_output : constant is 1;
    attribute mti_svvh_generic_type of REGISTER_WIDTH : constant is 3;
end stratixgx_dpa_lvds_rx;
