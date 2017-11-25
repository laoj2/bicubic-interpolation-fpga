library verilog;
use verilog.vl_types.all;
entity buffer_control is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        rows            : in     vl_logic_vector(31 downto 0);
        cols            : in     vl_logic_vector(31 downto 0);
        input_valid     : in     vl_logic;
        pixels          : in     vl_logic_vector(31 downto 0);
        write_en        : out    vl_logic_vector(3 downto 0);
        address         : out    vl_logic;
        out_data        : out    vl_logic;
        current_pixel   : out    vl_logic_vector(31 downto 0)
    );
end buffer_control;
