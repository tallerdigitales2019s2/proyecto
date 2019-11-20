module SpriteController(clk, RGB_o);
parameter N=6;

logic [N-1:0] [23:0] RGB_o_temp;
logic [N-1:0] mem_write;


ImageComposer #(.N(N))  imageComposer(.RGB_i(RGB_o_temp),.RGB_o(RGB_o));

endmodule

//module SpriteController(address_i, data_i, processor_clk_i,vga_x_i, vga_y_i, vga_ckl_i, RGB_o);
//
//
//
//
//
//
//
//
//
//
//TankController tc1(	.clk(processor_clk_i), .MW_i(), .address_i(), .data_i(),.x_pos_i(),.y_pos_i(),
//							.rgb_data_o(), .mem_address_o(), .mem_data_i()	);
//							
//							
//mem_tanque1 tank1_mem (	.clock(clk),.address(address),.q(q)	);
//
////TankController tc1(clk, MW_i, address_i,data_i,x_pos_i,y_pos_i,rgb_data_o, mem_address_o, mem_data_i);
//
//
//
//
//
//
//endmodule