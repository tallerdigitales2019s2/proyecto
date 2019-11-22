module coso (input logic clk, input logic rst, output logic [31:0] result, output logic [6:0] segments);
	logic [31:0] DataAdr, Instr, PC, PCNext;
	logic 	 	 MemWrite;
	logic [3:0] test;

	top top1(.clk(clk), .reset(reset),.WriteData(result), .DataAdr(DataAdr), .Instr(Instr), .PC(PC), .PCNext(PCNext), .MemWrite(MemWrite));
	
	
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