module control_unit (
    
    input clock, reset,
    input signed [31:0] rows, cols,
    input input_valid,
	 input info_valid,
    input [63:0] riffa_data_in,
   // input [16:0] read_address [0:3],
    output signed [31:0] pixel_out,
    output output_valid
);

/*FIFO SIGNALS AND INSTANTIATION*/
logic signed [31:0] pixels_output_fifo;
logic signed fifo_empty;

fifo_in fifo_input (
    .data(riffa_data_in),
	 .aclr(reset),
    .rdclk(clock),
    .wrclk(clock),
    .wrreq(input_valid),
    .rdreq(~fifo_empty),
    .q(pixels_output_fifo),
    .rdempty(fifo_empty)
);


/*BUFFER CONTROL SIGNALS AND INSTANTIATION*/

//WRITE SIGNALS
logic signed [3:0] write_en;
logic signed [31:0] write_address [0:3];
logic signed [31:0] out_data [0:3];
logic signed [31:0] current_pixel;

buffer_control buffer_control_1 (
    .clock(clock),
    .reset(reset),
    .rows(rows),
    .cols(cols),
    .input_valid(~fifo_empty),
    .pixels(pixels_output_fifo),
    .write_en(write_en),
    .address(write_address),
    .out_data(out_data),
    .current_pixel(current_pixel)
);

//READ SIGNALS
logic signed [31:0] read_address [0:3];
logic [7:0] pixels_read [0:3];

filter_controller filter_p(

    .clock(clock),
    .reset(reset),
    .rows(rows), 
    .cols(cols),
    .current_pixel_RAM(current_pixel),
    .pixels_read_ram(pixels_read),
	 .info_valid(info_valid),
    .pixel_out(pixel_out),
    .read_address(read_address),
    .pixel_valid(output_valid)
);




/*BRAMs INSTANTIATION*/

buffer_image buffer_image_0 (
   .data(out_data[0]),
	.wraddress(write_address[0]),
	.clock(clock),
	.aclr(reset),
	.rdaddress(read_address[0]),	
	.wren(write_en[0]),
	.q(pixels_read[0])
);

buffer_image buffer_image_1 (
   .data(out_data[1]),
	.wraddress(write_address[1]),
	.clock(clock),
	.aclr(reset),
	.rdaddress(read_address[1]),	
	.wren(write_en[1]),
	.q(pixels_read[1])
);

buffer_image buffer_image_2 (
   .data(out_data[2]),
	.wraddress(write_address[2]),
	.clock(clock),
	.aclr(reset),
	.rdaddress(read_address[2]),
	.wren(write_en[2]),
	.q(pixels_read[2])
);

buffer_image buffer_image_3 (
   .data(out_data[3]),
	.wraddress(write_address[3]),
	.clock(clock),
	.aclr(reset),
	.rdaddress(read_address[3]),
	.wren(write_en[3]),
	.q(pixels_read[3])
);

endmodule 
