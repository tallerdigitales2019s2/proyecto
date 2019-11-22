module FloorController(x_pos_i,y_pos_i,RGB_o, 
							mem_address_o, mem_data_i);
input logic [31:0] x_pos_i,y_pos_i;
output logic [15:0]mem_address_o;
output logic [23:0] RGB_o;
input logic [23:0] mem_data_i;

assign RGB_o = mem_data_i;


assign mem_address_o = (x_pos_i[7:0])+((y_pos_i[7:0])<<8);


endmodule