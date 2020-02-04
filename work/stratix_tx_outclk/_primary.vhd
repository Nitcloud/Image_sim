library verilog;
use verilog.vl_types.all;
entity stratix_tx_outclk is
    generic(
        deserialization_factor: integer := 4;
        bypass_serializer: string  := "FALSE";
        invert_clock    : string  := "FALSE";
        use_falling_clock_edge: string  := "FALSE"
    );
    port(
        tx_in           : in     vl_logic_vector(9 downto 0);
        tx_fastclk      : in     vl_logic;
        tx_enable       : in     vl_logic;
        tx_out          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of deserialization_factor : constant is 1;
    attribute mti_svvh_generic_type of bypass_serializer : constant is 1;
    attribute mti_svvh_generic_type of invert_clock : constant is 1;
    attribute mti_svvh_generic_type of use_falling_clock_edge : constant is 1;
end stratix_tx_outclk;
