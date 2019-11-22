module TankController#(parameter N=0, HALF_SIZE=16)(clk, MW_i, address_i,data_i,x_pos_i,y_pos_i,RGB_o, 
							mem_address_o, mem_data_i);
input logic MW_i,clk;
input logic [1:0]address_i;
input logic [31:0] x_pos_i,y_pos_i;
output logic [9:0]mem_address_o;
output logic [23:0] RGB_o;
input logic [31:0] data_i;
input logic [23:0] mem_data_i;
logic [31:0] x_pos,y_pos,direction;
logic visible_flag;

assign RGB_o = (visible_flag)? mem_data_i:0;


assign mem_address_o = (visible_flag)? (x_pos_i-x_pos-HALF_SIZE)+32*(y_pos_i-y_pos+HALF_SIZE):0;

assign visible_flag = (	(x_pos_i >= x_pos-HALF_SIZE) & (x_pos_i <  x_pos+HALF_SIZE) & 
								(y_pos_i >= y_pos-HALF_SIZE) & (y_pos_i <  y_pos+HALF_SIZE) ) ? 1 : 0;


						
						
always@(posedge clk)
begin
	if(MW_i)
		begin
			case(address_i)
			2'b00: x_pos=data_i;
			2'b01: y_pos=data_i;
			2'b10: direction=data_i;
			
			default: begin end
			endcase
//			x_pos=300;
		end
	
end


initial
begin
x_pos=20+15*N;
y_pos=40+15*N;
end

endmodule