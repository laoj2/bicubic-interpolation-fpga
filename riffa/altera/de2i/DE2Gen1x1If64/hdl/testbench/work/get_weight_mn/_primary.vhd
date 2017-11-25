library verilog;
use verilog.vl_types.all;
entity get_weight_mn is
    generic(
        SHIFT_AMOUNT    : integer := 8;
        FP128           : integer := 7
    );
    port(
        i               : in     integer;
        j               : in     integer;
        m               : in     integer;
        n               : in     integer;
        x_ratio         : in     vl_logic_vector(31 downto 0);
        y_ratio         : in     vl_logic_vector(31 downto 0);
        x_old           : in     vl_logic_vector(31 downto 0);
        y_old           : in     vl_logic_vector(31 downto 0);
        dx              : out    vl_logic_vector(31 downto 0);
        dy              : out    vl_logic_vector(31 downto 0);
        Rx              : out    vl_logic_vector(31 downto 0);
        Ry              : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SHIFT_AMOUNT : constant is 1;
    attribute mti_svvh_generic_type of FP128 : constant is 1;
end get_weight_mn;
