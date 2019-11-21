module CLK_DIVIDER(input logic in_clk, output logic out_clk=1'b0);
	logic q = 1'b0;

	always @(posedge in_clk)
	begin
		q = ~q; 
		out_clk = q;
	end
endmodule 