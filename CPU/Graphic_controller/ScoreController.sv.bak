module ScoreController#(parameter N=0)(clk, MW_i, address_i,data_i,x_pos_i,y_pos_i,RGB_o, 
							mem_address_o, mem_data_i);
input logic MW_i,clk;
input logic [1:0]address_i;
input logic [31:0] x_pos_i,y_pos_i;
output logic [15:0]mem_address_o;
output logic [23:0] RGB_o;
input logic [31:0] data_i;
input logic [23:0] mem_data_i;
logic [31:0] score1,score2,x_pos_s1,y_pos_s1,x_pos_s2,y_pos_s2;
logic [15:0]mem_address_s1,mem_address_s2;



logic visible_flag_s1,visible_flag_s2;

//assign RGB_o = (visible_flag_s1|visible_flag_s2)? mem_data_i:0;
//assign RGB_o = (visible_flag1)? 24'hFF0000:0;
assign RGB_o = (visible_flag_s1|mem_address_s2)? mem_data_i:0;


//assign mem_address_o = (visible_flag)? (x_pos_i-(x_pos) )+32*(y_pos_i-(y_pos))+(N<<10):0;
//
assign visible_flag_s1 = (	(x_pos_i >= x_pos_s1) & (x_pos_i <  x_pos_s1+32) & 
								(y_pos_i >= y_pos_s1) & (y_pos_i <  y_pos_s1+32) ) ;

assign visible_flag_s2 = (	(x_pos_i >= x_pos_s2) & (x_pos_i <  x_pos_s2+32) & 
								(y_pos_i >= y_pos_s2) & (y_pos_i <  y_pos_s2+32) );

//assign visible_flag =( (x_pos_i >= x_pos_s1) & (x_pos_i <  x_pos_s1+32) & 
//								(y_pos_i >= y_pos_s1) & (y_pos_i <  y_pos_s1+32) );
								
assign mem_address_s1 = (visible_flag_s1)? (x_pos_i-(x_pos_s1) )+32*(y_pos_i-(y_pos_s1))+(score1<<10):0;
assign mem_address_s2 = (visible_flag_s2)? (x_pos_i-(x_pos_s2) )+32*(y_pos_i-(y_pos_s2))+(score2<<10):0;

assign mem_address_o = (mem_address_s1|mem_address_s2);
				
						
always@(negedge clk)
begin
	if(MW_i)
		begin
			case(address_i)
			2'b00: score1=data_i;
			2'b01: score2=data_i;
			default: begin end
			endcase
		end
	
end
//posx
//posy
//dir

initial
begin
x_pos_s1=300;
y_pos_s1=40;

x_pos_s2=400;
y_pos_s2=40;

score1=3;
score2=0;
end

endmodule