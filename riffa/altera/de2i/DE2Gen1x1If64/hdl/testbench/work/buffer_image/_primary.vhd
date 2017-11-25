library verilog;
use verilog.vl_types.all;
entity buffer_image is
    port(
        aclr            : in     vl_logic;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        rdaddress       : in     vl_logic_vector(16 downto 0);
        wraddress       : in     vl_logic_vector(16 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end buffer_image;
