module WallsController#(parameter N=1)(clk, MW_i,data_i, address_i,x_pos_i,y_pos_i,RGB_o);
input logic MW_i,clk;
input logic [1:0]address_i;
input logic [31:0] x_pos_i,y_pos_i,data_i;
output logic [23:0] RGB_o;
logic [3:0][31:0] wall_pos;
logic visible_flag;


assign visible_flag = (	(x_pos_i >= wall_pos[0]) & (x_pos_i <  wall_pos[1]) & 
								(y_pos_i >= wall_pos[2]) & (y_pos_i <  wall_pos[3]) ) ? 1 : 0;

assign RGB_o = (visible_flag)? 24'h15688E:0;



initial
begin
wall_pos[0]=22;
wall_pos[1]=60;
wall_pos[2]=35;
wall_pos[3]=200;
end


endmodule