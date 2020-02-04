library verilog;
use verilog.vl_types.all;
entity stratixii_lvds_rx is
    generic(
        number_of_channels: integer := 1;
        deserialization_factor: integer := 4;
        enable_dpa_mode : string  := "OFF";
        data_align_rollover: vl_notype;
        lose_lock_on_one_change: string  := "OFF";
        reset_fifo_at_first_lock: string  := "ON";
        x_on_bitslip    : string  := "ON";
        show_warning    : string  := "OFF";
        REGISTER_WIDTH  : vl_notype;
        MUX_WIDTH       : integer := 12;
        RAM_WIDTH       : integer := 6
    );
    port(
        rx_in           : in     vl_logic_vector;
        rx_reset        : in     vl_logic_vector;
        rx_fastclk      : in     vl_logic;
        rx_enable       : in     vl_logic;
        rx_locked       : in     vl_logic;
        rx_dpll_reset   : in     vl_logic_vector;
        rx_dpll_hold    : in     vl_logic_vector;
        rx_dpll_enable  : in     vl_logic_vector;
        rx_fifo_reset   : in     vl_logic_vector;
        rx_channel_data_align: in     vl_logic_vector;
        rx_cda_reset    : in     vl_logic_vector;
        rx_out          : out    vl_logic_vector;
        rx_dpa_locked   : out    vl_logic_vector;
        rx_cda_max      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of number_of_channels : constant is 1;
    attribute mti_svvh_generic_type of deserialization_factor : constant is 1;
    attribute mti_svvh_generic_type of enable_dpa_mode : constant is 1;
    attribute mti_svvh_generic_type of data_align_rollover : constant is 3;
    attribute mti_svvh_generic_type of lose_lock_on_one_change : constant is 1;
    attribute mti_svvh_generic_type of reset_fifo_at_first_lock : constant is 1;
    attribute mti_svvh_generic_type of x_on_bitslip : constant is 1;
    attribute mti_svvh_generic_type of show_warning : constant is 1;
    attribute mti_svvh_generic_type of REGISTER_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of MUX_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of RAM_WIDTH : constant is 1;
end stratixii_lvds_rx;
