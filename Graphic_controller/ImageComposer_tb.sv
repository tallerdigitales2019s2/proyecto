module ImageComposer_tb();
 parameter N=3;
 logic [N-1:0] [23:0] RGB_i;
 logic [23:0]RGB_o;
 ImageComposer #(.N(N))  DUT(.*);

 initial 
 begin
 RGB_i[0]=24'h2222222;
 RGB_i[1]=24'h0000000;
 RGB_i[2]=24'h0000000;
 #1;
 RGB_i[0]=24'h2222222;
 RGB_i[1]=24'h3333333;
 RGB_i[2]=24'h0000000;
 #1;
 RGB_i[0]=24'h2222222;
 RGB_i[1]=24'h3333333;
 RGB_i[2]=24'h4444444;
 #1;
 RGB_i[0]=24'h0000000;
 RGB_i[1]=24'h0000000;
 RGB_i[2]=24'h5555555;
 #1;
 RGB_i[0]=24'h0000000;
 RGB_i[1]=24'h4444444;
 RGB_i[2]=24'h5555555;
 #1;
 RGB_i[0]=24'h0000000;
 RGB_i[1]=24'h0000000;
 RGB_i[2]=24'h0000000;
 #1;
 end

endmodule