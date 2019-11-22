module SpriteController(processor_clk_i,MW_i, address_i, data_i, RGB_o, 
								vga_clk_i, vga_x_pos_i, vga_y_pos_i);
parameter N=5;

input logic processor_clk_i,vga_clk_i,MW_i;
input logic [31:0] data_i,vga_x_pos_i,vga_y_pos_i;

input logic [29:0] address_i;

output logic [23:0] RGB_o;



logic [N-1:0] [23:0] RGB_o_temp;
logic [N-1:0] mem_write;
logic MW_tank1,MW_tank2,MW_bullet1,MW_bullet2,MW_score,MW_walls;
logic [9:0] mem_address_tank1,mem_address_tank2;
logic [15:0] mem_address_score;
logic [15:0] mem_address_floor;

assign MW_tank1 = (address_i[29:27]==3'b000)? 1:0;
//assign MW_tank1 = (address_i[29:27]==3'b000)? MW_i:0;
assign MW_tank2 = (address_i[29:27]==3'b001)? MW_i:0;
assign MW_bullet1 = (address_i[29:27]==3'b010)? MW_i:0;
assign MW_bullet2 = (address_i[29:27]==3'b011)? MW_i:0;
assign MW_score = (address_i[29:27]==3'b100)? MW_i:0;

logic [23:0] mem_data_tank1,mem_data_tank2,mem_data_bullet1,mem_data_bullet2,mem_data_floor,mem_data_walls,mem_data_score;


FloorController floorController(	
							.x_pos_i(vga_x_pos_i),.y_pos_i(vga_y_pos_i), .RGB_o(RGB_o_temp[0] ), 
							.mem_address_o(mem_address_floor), .mem_data_i(mem_data_floor)	);
							
mem_floor floor_mem (	.clock(vga_clk_i),.address(mem_address_floor),.q(mem_data_floor)	);



WallsController wallsController (.clk(), .MW_i(),.data_i(), .address_i(),.x_pos_i(vga_x_pos_i),.y_pos_i(vga_y_pos_i),.RGB_o(RGB_o_temp[1]));					



TankController #(.N(1)) tc1(	.clk(processor_clk_i), .MW_i(MW_tank1), .address_i(address_i[1:0]), 
							.data_i(data_i), .x_pos_i(vga_x_pos_i),.y_pos_i(vga_y_pos_i), .RGB_o(RGB_o_temp[2] ), 
							.mem_address_o(mem_address_tank1), .mem_data_i(mem_data_tank1)	);
							
mem_tank1 tank1_mem (	.clock(vga_clk_i),.address(mem_address_tank1),.q(mem_data_tank1)	);

TankController #(.N(2)) tc2(	.clk(processor_clk_i), .MW_i(MW_tank2), .address_i(address_i[1:0]), 
							.data_i(data_i), .x_pos_i(vga_x_pos_i),.y_pos_i(vga_y_pos_i), .RGB_o(RGB_o_temp[3] ), 
							.mem_address_o(mem_address_tank2), .mem_data_i(mem_data_tank2)	);
							
mem_tank2 tank2_mem (	.clock(vga_clk_i),.address(mem_address_tank2),.q(mem_data_tank2)	);




ScoreController #(.N(1)) scoreController(	.clk(processor_clk_i), .MW_i(MW_score), .address_i(address_i[1:0]), 
							.data_i(data_i), .x_pos_i(vga_x_pos_i),.y_pos_i(vga_y_pos_i), .RGB_o(RGB_o_temp[4] ), 
							.mem_address_o(mem_address_score), .mem_data_i(mem_data_score)	);
							
mem_score score_mem (	.clock(vga_clk_i),.address(mem_address_score),.q(mem_data_score)	);


							
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