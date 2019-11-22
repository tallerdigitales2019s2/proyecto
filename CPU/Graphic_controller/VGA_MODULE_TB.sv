`timescale 1 ps / 1 ps
module VGA_MODULE_TB();
	logic clk;
	logic vga_clk;
	logic v_sync;
	logic h_sync;
	logic write_en;
	logic [7:0] R = 8'b00000000;
	logic [7:0] G= 8'b00000000;
	logic [7:0] B= 8'b00000000;
//	CLK_DIVIDER testclk (.in_clk(clk), .out_clk(vga_clk));
	VGA_MODULE uut (.clk(vga_clk),.R_o(R),.B_o(B),.G_o(G), .V_SYNC_o(v_sync), .H_SYNC_o(h_sync));
	initial
		clk = 1'b0;
	always
		#1 clk = ~clk;
	initial	
		begin
		
		end

	
endmodule 