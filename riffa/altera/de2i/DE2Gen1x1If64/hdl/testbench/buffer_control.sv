module buffer_control (
	
	input clock,
	input reset,
	
	input signed [31:0] rows,
	input signed [31:0] cols,
	input input_valid,
	input signed [31:0] pixels,

	
	output logic signed [3:0] write_en,
	output logic signed [31:0] address [0:3],
	output logic signed [31:0] out_data[0:3],
	output logic signed [31:0] current_pixel

);

always_ff @(posedge clock or posedge reset) begin
	if(reset) begin
		write_en <= 4'b0;
		current_pixel <= 32'hFFFFFFFF;
		//for(i = 0 ; i < 4 ; i ++) begin
			address[0] <= 32'hFFFFFFFF;
			address[1] <= 32'hFFFFFFFF;
			address[2] <= 32'hFFFFFFFF;
			address[3] <= 32'hFFFFFFFF;
			out_data[0] <= 8'd0;
			out_data[1] <= 8'd0;
			out_data[2] <= 8'd0;
			out_data[3] <= 8'd0;
		//end
	end
	else begin
		if(input_valid) begin //INPUT IS VALID
				current_pixel <= current_pixel + 32'd4;				
				write_en <= 4'b1111;
				
				address[0] <= address[0] + 32'd1;	
				address[1] <= address[1] + 32'd1;	
				address[2] <= address[2] + 32'd1;	
				address[3] <= address[3] + 32'd1;	
				
				out_data[0] <= pixels[7:0];
				out_data[1] <= pixels[15:8];
				out_data[2] <= pixels[23:16];
				out_data[3] <= pixels[31:24];				
		end	
		else begin // INPUT IS NOT VALID
			write_en <= 4'b0000;
		end
	end
end


endmodule

