library verilog;
use verilog.vl_types.all;
entity dcfifo_async is
    generic(
        lpm_width       : integer := 1;
        lpm_widthu      : integer := 1;
        lpm_numwords    : integer := 2;
        delay_rdusedw   : integer := 1;
        delay_wrusedw   : integer := 1;
        rdsync_delaypipe: integer := 0;
        wrsync_delaypipe: integer := 0;
        intended_device_family: string  := "Stratix";
        lpm_showahead   : string  := "OFF";
        underflow_checking: string  := "ON";
        overflow_checking: string  := "ON";
        read_aclr_synch : string  := "OFF";
        write_aclr_synch: string  := "OFF";
        use_eab         : string  := "ON";
        add_ram_output_register: string  := "OFF"
    );
    port(
        data            : in     vl_logic_vector;
        rdclk           : in     vl_logic;
        wrclk           : in     vl_logic;
        aclr            : in     vl_logic;
        rdreq           : in     vl_logic;
        wrreq           : in     vl_logic;
        rdfull          : out    vl_logic;
        wrfull          : out    vl_logic;
        rdempty         : out    vl_logic;
        wrempty         : out    vl_logic;
        rdusedw         : out    vl_logic_vector;
        wrusedw         : out    vl_logic_vector;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_widthu : constant is 1;
    attribute mti_svvh_generic_type of lpm_numwords : constant is 1;
    attribute mti_svvh_generic_type of delay_rdusedw : constant is 1;
    attribute mti_svvh_generic_type of delay_wrusedw : constant is 1;
    attribute mti_svvh_generic_type of rdsync_delaypipe : constant is 1;
    attribute mti_svvh_generic_type of wrsync_delaypipe : constant is 1;
    attribute mti_svvh_generic_type of intended_device_family : constant is 1;
    attribute mti_svvh_generic_type of lpm_showahead : constant is 1;
    attribute mti_svvh_generic_type of underflow_checking : constant is 1;
    attribute mti_svvh_generic_type of overflow_checking : constant is 1;
    attribute mti_svvh_generic_type of read_aclr_synch : constant is 1;
    attribute mti_svvh_generic_type of write_aclr_synch : constant is 1;
    attribute mti_svvh_generic_type of use_eab : constant is 1;
    attribute mti_svvh_generic_type of add_ram_output_register : constant is 1;
end dcfifo_async;
