module V_COUNTER_TB();
	logic REF_CLOCK;
	logic V_SYNC_FLAG;
	logic H_SYNC_FLAG;
	
	
	CLOCK_DIVIDER clk1 (.VGA_clk(REF_CLOCK));
	V_COUNTER uut (H_SYNC_FLAG,REF_CLOCK,V_SYNC_FLAG);
	
	initial begin
		
	end
	
	
endmodule 