module ImageComposer_aux_tb();
logic [23:0] RGB_1_i,RGB_2_i,RGB_o;

ImageComposer_aux DUT(.*);
initial begin
RGB_1_i=24'hFF00220;
RGB_2_i=24'h0000000;
#1;
RGB_1_i=24'h0000000;
RGB_2_i=24'h0000000;
#1;
RGB_1_i=24'h0000000;
RGB_2_i=24'hFF00220;
#1;
RGB_1_i=24'hFFFFFFF;
RGB_2_i=24'h1111111;
#1;

 
end

endmodule