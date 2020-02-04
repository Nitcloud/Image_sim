library verilog;
use verilog.vl_types.all;
entity parallel_add is
    generic(
        width           : integer := 4;
        size            : integer := 2;
        widthr          : integer := 4;
        shift           : integer := 0;
        msw_subtract    : string  := "NO";
        representation  : string  := "UNSIGNED";
        pipeline        : integer := 0;
        result_alignment: string  := "LSB";
        lpm_type        : string  := "parallel_add";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        data            : in     vl_logic_vector;
        clock           : in     vl_logic;
        aclr            : in     vl_logic;
        clken           : in     vl_logic;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
    attribute mti_svvh_generic_type of size : constant is 1;
    attribute mti_svvh_generic_type of widthr : constant is 1;
    attribute mti_svvh_generic_type of shift : constant is 1;
    attribute mti_svvh_generic_type of msw_subtract : constant is 1;
    attribute mti_svvh_generic_type of representation : constant is 1;
    attribute mti_svvh_generic_type of pipeline : constant is 1;
    attribute mti_svvh_generic_type of result_alignment : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end parallel_add;
