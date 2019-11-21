module Graphic_controller(clk,
						btn_i,btn_confirm_i,
						vga_clock , SYNC_N, v_en, R, G , B, V_SYNC, H_SYNC,
						leds,rx,rx_led);
						
						
						
input logic clk,btn_i,btn_confirm_i;
output logic vga_clock,SYNC_N,v_en,V_SYNC,H_SYNC;
output logic [7:0]R ,G,B;
output logic [7:0] leds;
input logic rx;
output logic rx_led;


logic [31:0] x_pos,y_pos;
logic MW;
logic [29:0] address;
logic [31:0] data;
logic [23:0] RGB;


logic rcv;
logic [7:0] uart_data;

assign rx_led = ~rx;

logic rstn;

//-- Inicializador
always @(posedge clk)
  rstn <= 1;


VGA_MODULE vga( 	.clk(clk), .vga_clock(vga_clock), .SYNC_N_o(SYNC_N),  
						.v_en_o(v_en),  .R_o(R),  .G_o(G) ,  .B_o(B),  .V_SYNC_o(V_SYNC),  
						.H_SYNC_o(H_SYNC),
						.x_pos_o(x_pos), .y_pos_o(y_pos),
						.RGB_i(RGB));
						
						
						
SpriteController spriteController (.processor_clk_i(clk),.MW_i(MW), .address_i(address), .data_i(data), .RGB_o(RGB), 
								.vga_clk_i(vga_clock), .vga_x_pos_i(x_pos), .vga_y_pos_i(y_pos));
						

						
parameter BAUDRATE = `B115200;

uart_rx #(BAUDRATE)
  RX0 (.clk(clk),      //-- System clock
       .rstn(rstn),    //-- Reset (Active low)
       .rx(rx),        //-- Serial input
       .rcv(rcv),      //-- Character received notification (1)
       .data(uart_data)     //-- Character received
      );

		
		
always @(posedge clk)
    if (!rstn)
      leds <= 0;

    //-- When there is data available, capture it!
    else if (rcv == 1'b1)
	 begin
      leds <= uart_data;
		MW=1;
		address=0;
		address[29:27]=3'b000;
		address[1:0]=3'b00;
		data=uart_data;
	end 
	
		
		

initial
begin
rstn=0;
MW=0;

end	
		
		
		
endmodule	
		

