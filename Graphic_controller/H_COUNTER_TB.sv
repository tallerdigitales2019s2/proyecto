module H_COUNTER_TB(input logic clk_in, output logic clk_out);
	integer count =0;
	always @(posedge clk_in) begin
		count <= count + 1;
		if(count == 1000000)
			begin
				count<=0;
				clk_out <= !clk_out;
			end
	end
	
endmodule 