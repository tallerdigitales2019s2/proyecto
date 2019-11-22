module top(clk,clk_50Mhz, reset,
			  WriteData, DataAdr, Instr, PC, PCNext,
			  MemWrite,
			  R ,G,B,SYNC_N,v_en,V_SYNC,H_SYNC,vga_clk,
			  rx,rx_led
			  
			  );
			
input logic clk, reset,clk_50Mhz;
output logic [31:0] WriteData, DataAdr, Instr, PC, PCNext;
output logic MemWrite;
output logic [7:0]R ,G,B;
output logic vga_clk,SYNC_N,v_en,V_SYNC,H_SYNC;
input logic rx;
output logic rx_led;


	
logic [31:0] ReadData;
// instantiate processor and memories
arm arm(clk, reset, Instr, ReadData, MemWrite, PC, PCNext, DataAdr, WriteData);
		  
imemtb imem(PC, Instr);


logic MR_i,MW_i;
logic[31:0] data_i,address_i,mem_data_i,uart_data_i;

logic mem_MR,mem_MW,sm_MW,uart_MR;
logic[31:0] data_o,mem_data_o,sm_data_o;
logic [9:0] uart_address,sm_address,mem_address;
logic MemRead=1;

//dmem dmem_1(clk, MemWrite, DataAdr, WriteData, ReadData);

//dmem dmem_1(.clk(clk), .we(mem_MW), .a(mem_address), .wd(mem_data_o), .rd(mem_data_i));
dmem dmem_1(.clk(clk), .we(MemWrite), .a(DataAdr), .wd(WriteData), .rd(ReadData));



//
//MemoryManager memoryManager(.MR_i(MemRead),.MW_i(MemWrite),.data_i(WriteData),.address_i(DataAdr),.data_o(ReadData), 
//							.mem_address_o(mem_address), .mem_data_i(mem_data_i),.mem_data_o(mem_data_o), .mem_MR_o(), .mem_MW_o(mem_MW),
//							.sm_address_o(sm_address), .sm_data_o(sm_data_o), .sm_MW_o(sm_MW),
//							.uart_address_o(), .uart_data_i(), .uart_MR_o()
//							);
//
//														
logic [31:0] x_pos,y_pos;
logic [23:0] RGB;
VGA_MODULE vga( 	.clk(clk_50Mhz), .vga_clock(vga_clk), .SYNC_N_o(SYNC_N),  
						.v_en_o(v_en),  .R_o(R),  .G_o(G) ,  .B_o(B),  .V_SYNC_o(V_SYNC),  
						.H_SYNC_o(H_SYNC),
						.x_pos_o(x_pos), .y_pos_o(y_pos),
						.RGB_i(RGB));
						
						
//assign RGB = 24'hFF0000;
//SpriteController spriteController (.processor_clk_i(clk),.MW_i(sm_MW), .address_i(sm_address), .data_i(sm_data_o), .RGB_o(RGB), 
//								.vga_clk_i(vga_clk), .vga_x_pos_i(x_pos), .vga_y_pos_i(y_pos));
//						
SpriteController spriteController (.processor_clk_i(clk),.MW_i(MemWrite), .address_i(DataAdr[9:0]), .data_i(WriteData), .RGB_o(RGB), 
								.vga_clk_i(vga_clk), .vga_x_pos_i(x_pos), .vga_y_pos_i(y_pos));
						


endmodule 