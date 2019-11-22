module top(input logic clk, reset,
			  output logic [31:0] WriteData, DataAdr, Instr, PC, PCNext,
			  output logic MemWrite);
			  
logic [31:0] ReadData;

// instantiate processor and memories
arm arm(clk, reset, Instr, ReadData, MemWrite, PC, PCNext, DataAdr, WriteData);
		  
imemtb imem(PC, Instr);

dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);

endmodule 