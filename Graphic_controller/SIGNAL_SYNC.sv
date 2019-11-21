module SIGNAL_SYNC (input logic CLOCK,output logic V_EN, output integer H_COUNTER = 0, V_COUNTER =0, output logic V_SYNC, H_SYNC);
//	logic CLk;
	logic V_CLK;

	integer H_SPACE = 640;
	integer V_SPACE = 480;
	
	H_COUNTER h_signal (.CLOCK(CLOCK),.H_SYNC(H_SYNC),.END_LINE(V_CLK), .CURRENT_PIXEL(H_COUNTER));
	V_COUNTER v_signal (.CLOCK(CLOCK), .H_FLAG(V_CLK), .V_SYNC(V_SYNC),.CURRENT_PIXEL(V_COUNTER));
	
	
	assign V_EN = (H_COUNTER < H_SPACE & V_COUNTER < V_SPACE) ? 1'b1 : 1'b0;
	
	
endmodule 