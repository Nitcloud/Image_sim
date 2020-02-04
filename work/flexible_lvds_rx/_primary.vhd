library verilog;
use verilog.vl_types.all;
entity flexible_lvds_rx is
    generic(
        number_of_channels: integer := 1;
        deserialization_factor: integer := 4;
        use_extra_ddio_register: string  := "YES";
        use_extra_pll_clk: string  := "NO";
        buffer_implementation: string  := "RAM";
        registered_data_align_input: string  := "OFF";
        use_external_pll: string  := "OFF";
        registered_output: string  := "ON";
        add_latency     : string  := "YES";
        REGISTER_WIDTH  : vl_notype;
        LATENCY         : vl_notype;
        NUM_OF_SYNC_STAGES: vl_notype
    );
    port(
        rx_in           : in     vl_logic_vector;
        rx_fastclk      : in     vl_logic;
        rx_slowclk      : in     vl_logic;
        rx_syncclk      : in     vl_logic;
        pll_areset      : in     vl_logic;
        rx_data_align   : in     vl_logic_vector;
        rx_cda_reset    : in     vl_logic_vector;
        rx_locked       : in     vl_logic;
        rx_out          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of number_of_channels : constant is 1;
    attribute mti_svvh_generic_type of deserialization_factor : constant is 1;
    attribute mti_svvh_generic_type of use_extra_ddio_register : constant is 1;
    attribute mti_svvh_generic_type of use_extra_pll_clk : constant is 1;
    attribute mti_svvh_generic_type of buffer_implementation : constant is 1;
    attribute mti_svvh_generic_type of registered_data_align_input : constant is 1;
    attribute mti_svvh_generic_type of use_external_pll : constant is 1;
    attribute mti_svvh_generic_type of registered_output : constant is 1;
    attribute mti_svvh_generic_type of add_latency : constant is 1;
    attribute mti_svvh_generic_type of REGISTER_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of LATENCY : constant is 3;
    attribute mti_svvh_generic_type of NUM_OF_SYNC_STAGES : constant is 3;
end flexible_lvds_rx;
