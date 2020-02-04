library verilog;
use verilog.vl_types.all;
entity sld_virtual_jtag is
    generic(
        lpm_type        : string  := "SLD_VIRTUAL_JTAG";
        lpm_hint        : string  := "SLD_VIRTUAL_JTAG";
        sld_auto_instance_index: string  := "NO";
        sld_instance_index: integer := 0;
        sld_ir_width    : integer := 1;
        sld_sim_n_scan  : integer := 0;
        sld_sim_total_length: integer := 0;
        sld_sim_action  : string  := ""
    );
    port(
        tdo             : in     vl_logic;
        ir_out          : in     vl_logic_vector;
        tck             : out    vl_logic;
        tdi             : out    vl_logic;
        ir_in           : out    vl_logic_vector;
        virtual_state_cdr: out    vl_logic;
        virtual_state_sdr: out    vl_logic;
        virtual_state_e1dr: out    vl_logic;
        virtual_state_pdr: out    vl_logic;
        virtual_state_e2dr: out    vl_logic;
        virtual_state_udr: out    vl_logic;
        virtual_state_cir: out    vl_logic;
        virtual_state_uir: out    vl_logic;
        jtag_state_tlr  : out    vl_logic;
        jtag_state_rti  : out    vl_logic;
        jtag_state_sdrs : out    vl_logic;
        jtag_state_cdr  : out    vl_logic;
        jtag_state_sdr  : out    vl_logic;
        jtag_state_e1dr : out    vl_logic;
        jtag_state_pdr  : out    vl_logic;
        jtag_state_e2dr : out    vl_logic;
        jtag_state_udr  : out    vl_logic;
        jtag_state_sirs : out    vl_logic;
        jtag_state_cir  : out    vl_logic;
        jtag_state_sir  : out    vl_logic;
        jtag_state_e1ir : out    vl_logic;
        jtag_state_pir  : out    vl_logic;
        jtag_state_e2ir : out    vl_logic;
        jtag_state_uir  : out    vl_logic;
        tms             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
    attribute mti_svvh_generic_type of sld_auto_instance_index : constant is 1;
    attribute mti_svvh_generic_type of sld_instance_index : constant is 1;
    attribute mti_svvh_generic_type of sld_ir_width : constant is 1;
    attribute mti_svvh_generic_type of sld_sim_n_scan : constant is 1;
    attribute mti_svvh_generic_type of sld_sim_total_length : constant is 1;
    attribute mti_svvh_generic_type of sld_sim_action : constant is 1;
end sld_virtual_jtag;
