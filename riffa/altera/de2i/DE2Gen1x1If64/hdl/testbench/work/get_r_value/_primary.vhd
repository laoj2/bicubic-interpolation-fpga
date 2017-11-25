library verilog;
use verilog.vl_types.all;
entity get_r_value is
    port(
        S               : in     vl_logic_vector(31 downto 0);
        R               : out    vl_logic_vector(31 downto 0)
    );
end get_r_value;
