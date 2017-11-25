`timescale 10 ns / 100 ps
`define CLKPERIOD 100
module tb ();

reg clock, reset;
//logic [31:0] x_old, y_old, dx, dy, y_ratio, x_ratio, rows, cols, Rx, Ry;
//int i,j,m,n;
logic [9:0] rows= 100, cols=100;
logic [31:0] pixels, current_pixel;
logic [16:0] address [0:3];
logic [3:0] write_en;
logic [7:0] out_data [0:3];
logic input_valid;

initial begin 
   	clock = 1;	
			forever clock = #(`CLKPERIOD/2) ~clock;
end

buffer_control bc(
	
	clock,
	reset,
	
	rows,
	cols,
	input_valid,
	pixels,

	
	write_en,
	address [0:3],
	out_data[0:3],
	current_pixel

);

int i,j;
initial begin		 
	reset = 1;
	#(`CLKPERIOD)
	reset = 0;

	for(i = 0 ; i < 20 ; i++) begin
		#(`CLKPERIOD)
		if(i%2) begin
			input_valid = 1;
			pixels = {i,2*i, 3*i,4*i};
		end
		else begin
			pixels = 32'hFFFFFFFF;
			input_valid = 0;
		end
	end
end

endmodule

