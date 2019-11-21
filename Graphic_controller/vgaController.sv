module vgaController (input logic clk,output logic hsync, vsync, sync_b, blank_b,output integer H_CURRENT_PIXEL=0, V_CURRENT_PIXEL=0);
			integer H_VISIBLE_AREA = 640;
			integer H_FRONT_PORCH=16;
			integer H_SYNC_PULSE=96;
			integer H_BACK_PORCH=48;
			integer H_WHOLE_LINE= 800;
			integer V_VISIBLE_AREA=480;
			integer V_FRONT_PORCH=11;
			integer V_SYNC_PULSE=2;
			integer V_BACK_PORCH=32;
			integer V_WHOLE_LINE=525;

 // counters for horizontal and vertical positions
	always @(posedge clk) begin
		H_CURRENT_PIXEL++;
		if (H_CURRENT_PIXEL == H_WHOLE_LINE) begin
				H_CURRENT_PIXEL = 0;
				V_CURRENT_PIXEL++;
				if (V_CURRENT_PIXEL == V_WHOLE_LINE) V_CURRENT_PIXEL = 0;
		end
	end
	// compute sync signals (active low)
	assign hsync = ~(H_CURRENT_PIXEL >= H_VISIBLE_AREA+H_FRONT_PORCH & H_CURRENT_PIXEL < H_VISIBLE_AREA+H_FRONT_PORCH+H_SYNC_PULSE);
	assign vsync = ~(V_CURRENT_PIXEL >= V_VISIBLE_AREA+V_FRONT_PORCH & V_CURRENT_PIXEL < V_VISIBLE_AREA+V_FRONT_PORCH+V_SYNC_PULSE);
	assign sync_b = hsync & vsync;
	// force outputs to black when outside display area
	assign blank_b = (H_CURRENT_PIXEL < H_VISIBLE_AREA) & (V_CURRENT_PIXEL< V_VISIBLE_AREA);
endmodule 