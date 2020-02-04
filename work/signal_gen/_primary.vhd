library verilog;
use verilog.vl_types.all;
entity signal_gen is
    generic(
        sld_node_ir_width: integer := 1;
        sld_node_n_scan : integer := 0;
        sld_node_total_length: integer := 0;
        sld_node_sim_action: string  := "()"
    );
    port(
        tck             : out    vl_logic;
        tms             : out    vl_logic;
        tdi             : out    vl_logic;
        jtag_usr1       : in     vl_logic;
        tdo             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of sld_node_ir_width : constant is 1;
    attribute mti_svvh_generic_type of sld_node_n_scan : constant is 1;
    attribute mti_svvh_generic_type of sld_node_total_length : constant is 1;
    attribute mti_svvh_generic_type of sld_node_sim_action : constant is 1;
end signal_gen;
