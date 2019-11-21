module H_COUNTER(input logic CLOCK, output logic H_SYNC,output logic END_LINE, output integer CURRENT_PIXEL =0);

		integer VISIBLE_AREA = 640;
		integer FRONT_PORCH = 16;
		integer SYNC_PULSE = 96;
		integer BACK_PORCH = 48;
		integer WHOLE_LINE = 800;
		
		

		always @(posedge CLOCK) begin
			if(CURRENT_PIXEL == WHOLE_LINE) begin
				CURRENT_PIXEL <= 0;
				END_LINE<=1;
			end
			else begin
				CURRENT_PIXEL<= CURRENT_PIXEL +1;
				END_LINE<=0;
			end
		end
		assign H_SYNC =~(CURRENT_PIXEL >= VISIBLE_AREA+FRONT_PORCH& CURRENT_PIXEL < VISIBLE_AREA+FRONT_PORCH+SYNC_PULSE);
		//assign END_LINE = (CURRENT_PIXEL == WHOLE_LINE) ? 1'b1 : 1'b0 ;
endmodule 