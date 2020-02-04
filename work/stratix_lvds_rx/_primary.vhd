library verilog;
use verilog.vl_types.all;
entity stratix_lvds_rx is
    generic(
        number_of_channels: integer := 1;
        deserialization_factor: integer := 4;
        REGISTER_WIDTH  : vl_notype
    );
    port(
        rx_in           : in     vl_logic_vector;
        rx_fastclk      : in     vl_logic;
        rx_enable0      : in     vl_logic;
        rx_enable1      : in     vl_logic;
        rx_out          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of number_of_channels : constant is 1;
    attribute mti_svvh_generic_type of deserialization_factor : constant is 1;
    attribute mti_svvh_generic_type of REGISTER_WIDTH : constant is 3;
end stratix_lvds_rx;
