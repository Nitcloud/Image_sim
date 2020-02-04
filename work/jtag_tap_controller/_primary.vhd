library verilog;
use verilog.vl_types.all;
entity jtag_tap_controller is
    generic(
        ir_register_width: integer := 16
    );
    port(
        tck             : in     vl_logic;
        tms             : in     vl_logic;
        tdi             : in     vl_logic;
        jtag_tdo        : in     vl_logic;
        tdo             : out    vl_logic;
        jtag_tck        : out    vl_logic;
        jtag_tms        : out    vl_logic;
        jtag_tdi        : out    vl_logic;
        jtag_state_tlr  : out    vl_logic;
        jtag_state_rti  : out    vl_logic;
        jtag_state_drs  : out    vl_logic;
        jtag_state_cdr  : out    vl_logic;
        jtag_state_sdr  : out    vl_logic;
        jtag_state_e1dr : out    vl_logic;
        jtag_state_pdr  : out    vl_logic;
        jtag_state_e2dr : out    vl_logic;
        jtag_state_udr  : out    vl_logic;
        jtag_state_irs  : out    vl_logic;
        jtag_state_cir  : out    vl_logic;
        jtag_state_sir  : out    vl_logic;
        jtag_state_e1ir : out    vl_logic;
        jtag_state_pir  : out    vl_logic;
        jtag_state_e2ir : out    vl_logic;
        jtag_state_uir  : out    vl_logic;
        jtag_usr1       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ir_register_width : constant is 1;
end jtag_tap_controller;
