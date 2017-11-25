`timescale 10 ns / 100 ps
`define CLKPERIOD 100
module tb_c_unit ();

reg clock, reset;
//logic [31:0] x_old, y_old, dx, dy, y_ratio, x_ratio, rows, cols, Rx, Ry;
//int i,j,m,n;
logic signed [31:0] rows= 96, cols=103;
logic signed [31:0]  current_pixel;
logic signed [63:0] riffa_data_in;
//logic [16:0] address [0:3];
//logic [3:0] write_en;
//logic [7:0] pixels_read [0:3];
logic input_valid;
logic signed [31:0] pixel_out;
logic output_valid;

int  file_in = $fopen("image_in.txt", "r");
int file_out = $fopen("image_out.txt", "w");


initial begin 
   	clock = 1;	
    forever clock = #(`CLKPERIOD/2) ~clock;
end

control_unit c_unit(	
	clock,
	reset,	
	rows,
	cols,
	input_valid,
	!reset,
	riffa_data_in,
    pixel_out,
    output_valid
);

int i,j, count_end;
logic [7:0] base, adder;
initial begin	
  reset = 0;
  #(`CLKPERIOD)
	reset = 1;
	base = 1 ;
	adder = 1;
	input_valid = 0;
//	count_end = 0;
	riffa_data_in = 0;
//	read_address[0] = 0;
//	read_address[1] = 0;
//	read_address[2] = 0;
//	read_address[3] = 0;
	#(`CLKPERIOD)
	reset = 0;

	for(i = 0 ; i < rows*cols/8 ; i++) begin
		#(`CLKPERIOD)
		$fscanf(file_in, "%d %d %d %d %d %d %d %d ", riffa_data_in[7:0], riffa_data_in[15:8], riffa_data_in[23:16], riffa_data_in[31:24], riffa_data_in[39:32], riffa_data_in[47:40], riffa_data_in[55:48], riffa_data_in[63:56] );
		input_valid = 1;

	
	end

end




always_ff @(posedge clock or posedge reset) begin
	if(reset) begin
		count_end <= 0;
	end
	else begin
		if(output_valid) begin
			$fwrite(file_out, "%d\n", pixel_out);
			count_end++;
		end		
		if(count_end == 128*128) $stop;
	end

	

end

endmodule