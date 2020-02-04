library verilog;
use verilog.vl_types.all;
entity altserial_flash_loader is
    generic(
        lpm_hint        : string  := "UNUSED";
        enhanced_mode   : integer := 0;
        intended_device_family: string  := "Cyclone";
        enable_shared_access: string  := "OFF";
        enable_quad_spi_support: integer := 0;
        ncso_width      : integer := 1;
        lpm_type        : string  := "ALTSERIAL_FLASH_LOADER"
    );
    port(
        data_in         : in     vl_logic_vector(3 downto 0);
        noe             : in     vl_logic;
        asmi_access_granted: in     vl_logic;
        data_out        : out    vl_logic_vector(3 downto 0);
        data_oe         : in     vl_logic_vector(3 downto 0);
        sdoin           : in     vl_logic;
        asmi_access_request: out    vl_logic;
        data0out        : out    vl_logic;
        scein           : in     vl_logic_vector;
        dclkin          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
    attribute mti_svvh_generic_type of enhanced_mode : constant is 1;
    attribute mti_svvh_generic_type of intended_device_family : constant is 1;
    attribute mti_svvh_generic_type of enable_shared_access : constant is 1;
    attribute mti_svvh_generic_type of enable_quad_spi_support : constant is 1;
    attribute mti_svvh_generic_type of ncso_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
end altserial_flash_loader;
