library verilog;
use verilog.vl_types.all;
entity filter_controller is
    generic(
        SHIFT_AMOUNT    : integer := 8;
        FP128           : integer := 7
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        rows            : in     vl_logic_vector(31 downto 0);
        cols            : in     vl_logic_vector(31 downto 0);
        info_valid      : in     vl_logic;
        current_pixel_RAM: in     vl_logic_vector(31 downto 0);
        pixels_read_ram : in     vl_logic;
        pixel_out       : out    vl_logic_vector(31 downto 0);
        read_address    : out    vl_logic;
        pixel_valid     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SHIFT_AMOUNT : constant is 1;
    attribute mti_svvh_generic_type of FP128 : constant is 1;
end filter_controller;
