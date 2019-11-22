module VGA_MODULE(clk,vga_clock, v_en_o,RGB_i, R_o, G_o ,B_o,SYNC_N_o, V_SYNC_o, H_SYNC_o,x_pos_o,y_pos_o);
	input logic clk;
	input logic [23:0] RGB_i;
	output logic vga_clock, v_en_o, V_SYNC_o, H_SYNC_o,SYNC_N_o;
	output logic [7:0] R_o,G_o,B_o;
	output logic [31:0] x_pos_o,y_pos_o;
//	logic sq_a, sq_b, sq_c, sq_d;
	assign B_o= RGB_i[23:16];
	assign G_o= RGB_i[15:8];
	assign R_o= RGB_i[7:0];
	
	CLK_DIVIDER testclk (.in_clk(clk), .out_clk(vga_clock));
	SIGNAL_SYNC sync (.CLOCK(vga_clock),.V_EN(v_en_o), .H_COUNTER(x_pos_o), .V_COUNTER(y_pos_o),
							.V_SYNC(V_SYNC_o), .H_SYNC(H_SYNC_o) );
	
	//	GameDrawer(.clk(clk), .x_i(x), .y_i(y),.board_status_i(board_status_i),.cursor_pos_i(cursor_pos_i),.current_screen_i(current_screen_i),.R_o(R),.G_o(G),.B_o(B));



	

	
endmodule 