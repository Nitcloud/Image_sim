library verilog;
use verilog.vl_types.all;
entity altera_syncram_derived_forwarding_logic is
    generic(
        dwidth          : integer := 1;
        awidth          : integer := 1;
        fwd_stage1_enabled: integer := 0;
        fwd_stage2_enabled: integer := 0
    );
    port(
        wrdata_reg      : in     vl_logic_vector;
        wren            : in     vl_logic;
        rden            : in     vl_logic;
        wraddr          : in     vl_logic_vector;
        rdaddr          : in     vl_logic_vector;
        wren_reg        : in     vl_logic;
        rden_reg        : in     vl_logic;
        wraddr_reg      : in     vl_logic_vector;
        rdaddr_reg      : in     vl_logic_vector;
        clock           : in     vl_logic;
        fwd_out         : out    vl_logic_vector;
        stage2_cmp_out  : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of dwidth : constant is 1;
    attribute mti_svvh_generic_type of awidth : constant is 1;
    attribute mti_svvh_generic_type of fwd_stage1_enabled : constant is 1;
    attribute mti_svvh_generic_type of fwd_stage2_enabled : constant is 1;
end altera_syncram_derived_forwarding_logic;
