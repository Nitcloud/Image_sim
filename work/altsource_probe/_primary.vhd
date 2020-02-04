library verilog;
use verilog.vl_types.all;
entity altsource_probe is
    generic(
        lpm_hint        : string  := "UNUSED";
        sld_instance_index: integer := 0;
        source_initial_value: string  := "0";
        sld_ir_width    : integer := 4;
        probe_width     : integer := 1;
        source_width    : integer := 1;
        instance_id     : string  := "UNUSED";
        lpm_type        : string  := "altsource_probe";
        sld_auto_instance_index: string  := "YES";
        SLD_NODE_INFO   : integer := 4746752;
        enable_metastability: string  := "NO"
    );
    port(
        jtag_state_sdr  : in     vl_logic;
        ir_in           : in     vl_logic_vector;
        jtag_state_cir  : in     vl_logic;
        jtag_state_udr  : in     vl_logic;
        jtag_state_e1dr : in     vl_logic;
        source_clk      : in     vl_logic;
        clr             : in     vl_logic;
        probe           : in     vl_logic_vector;
        source          : out    vl_logic_vector;
        ir_out          : out    vl_logic_vector;
        jtag_state_cdr  : in     vl_logic;
        jtag_state_tlr  : in     vl_logic;
        tdi             : in     vl_logic;
        jtag_state_uir  : in     vl_logic;
        source_ena      : in     vl_logic;
        tdo             : out    vl_logic;
        raw_tck         : in     vl_logic;
        usr1            : in     vl_logic;
        ena             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
    attribute mti_svvh_generic_type of sld_instance_index : constant is 1;
    attribute mti_svvh_generic_type of source_initial_value : constant is 1;
    attribute mti_svvh_generic_type of sld_ir_width : constant is 1;
    attribute mti_svvh_generic_type of probe_width : constant is 1;
    attribute mti_svvh_generic_type of source_width : constant is 1;
    attribute mti_svvh_generic_type of instance_id : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of sld_auto_instance_index : constant is 1;
    attribute mti_svvh_generic_type of SLD_NODE_INFO : constant is 1;
    attribute mti_svvh_generic_type of enable_metastability : constant is 1;
end altsource_probe;
