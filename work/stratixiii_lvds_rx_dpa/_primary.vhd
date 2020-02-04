library verilog;
use verilog.vl_types.all;
entity stratixiii_lvds_rx_dpa is
    generic(
        enable_soft_cdr_mode: string  := "OFF";
        sim_dpa_is_negative_ppm_drift: string  := "OFF";
        sim_dpa_net_ppm_variation: integer := 0;
        enable_dpa_align_to_rising_edge_only: string  := "OFF";
        enable_dpa_initial_phase_selection: string  := "OFF";
        dpa_initial_phase_value: integer := 0;
        INITIAL_PHASE_SELECT: vl_notype;
        PHASE_NUM       : integer := 8
    );
    port(
        rx_in           : in     vl_logic;
        rx_fastclk      : in     vl_logic;
        rx_enable       : in     vl_logic;
        rx_dpa_reset    : in     vl_logic;
        rx_dpa_hold     : in     vl_logic;
        rx_out          : out    vl_logic;
        rx_dpa_clk      : out    vl_logic;
        rx_dpa_loaden   : out    vl_logic;
        rx_dpa_locked   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of enable_soft_cdr_mode : constant is 1;
    attribute mti_svvh_generic_type of sim_dpa_is_negative_ppm_drift : constant is 1;
    attribute mti_svvh_generic_type of sim_dpa_net_ppm_variation : constant is 1;
    attribute mti_svvh_generic_type of enable_dpa_align_to_rising_edge_only : constant is 1;
    attribute mti_svvh_generic_type of enable_dpa_initial_phase_selection : constant is 1;
    attribute mti_svvh_generic_type of dpa_initial_phase_value : constant is 1;
    attribute mti_svvh_generic_type of INITIAL_PHASE_SELECT : constant is 3;
    attribute mti_svvh_generic_type of PHASE_NUM : constant is 1;
end stratixiii_lvds_rx_dpa;
