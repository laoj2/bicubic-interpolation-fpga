library verilog;
use verilog.vl_types.all;
entity control_unit is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        rows            : in     vl_logic_vector(31 downto 0);
        cols            : in     vl_logic_vector(31 downto 0);
        input_valid     : in     vl_logic;
        info_valid      : in     vl_logic;
        riffa_data_in   : in     vl_logic_vector(63 downto 0);
        pixel_out       : out    vl_logic_vector(31 downto 0);
        output_valid    : out    vl_logic
    );
end control_unit;
