module ImageComposer_aux(RGB_1_i,RGB_2_i,RGB_o);
input logic [23:0] RGB_1_i,RGB_2_i;
output logic [23:0] RGB_o;

assign RGB_o= (RGB_2_i==0)? RGB_1_i:RGB_2_i;

endmodule