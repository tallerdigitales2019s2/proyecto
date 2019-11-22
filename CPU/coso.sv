module coso (	clk,  rst,  segments,
					clk_50Mhz,R ,G,B,SYNC_N,v_en,V_SYNC,H_SYNC,vga_clk,address_tail);
input logic clk,rst,clk_50Mhz;
//output logic [31:0] result;
output logic [6:0] segments;
output logic [7:0]R ,G,B;
output logic vga_clk,SYNC_N,v_en,V_SYNC,H_SYNC;
output logic[9:0] address_tail;



logic [31:0] result;

assign address_tail= Instr[9:0];


logic [31:0] DataAdr, Instr, PC, PCNext;
logic 	 	 MemWrite;
logic [3:0] test;
logic reset;

	top top1(	.clk(clk), .reset(reset),.WriteData(result), .DataAdr(DataAdr), .Instr(Instr), .PC(PC), .PCNext(PCNext), .MemWrite(MemWrite),
					.clk_50Mhz(clk_50Mhz),.R(R) ,.G(G),.B(B),.SYNC_N(SYNC_N),.v_en(v_en),.V_SYNC(V_SYNC),.H_SYNC(H_SYNC), .vga_clk(vga_clk)
					);
	
	
	always @ (posedge clk) begin
		if(result[3:0] == 4'b0101) begin
			test = result[3:0];
		end
		else begin
			test = 4'b0011;
		end
	end
	seven_segments seven(.data(DataAdr[3:0]), .segments(segments));
	
	
	
	
endmodule 