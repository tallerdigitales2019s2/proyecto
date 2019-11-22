module CLOCK_DIVIDER(master_clk, VGA_clk);

	input master_clk; //50MHz clock
	output logic VGA_clk; //25MHz clock
	reg q;

	always@(posedge master_clk)
	begin
		q <= ~q; 
		VGA_clk <= q;
	end
endmodule 