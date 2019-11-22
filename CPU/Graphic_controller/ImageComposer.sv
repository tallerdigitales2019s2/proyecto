module ImageComposer#(parameter N=8)(RGB_i, RGB_o);
input logic [N-1:0]  [23:0] RGB_i;
output logic [23:0]RGB_o;



logic [N-1:0]  [23:0] RGB_temp;
assign RGB_temp[0]=RGB_i[0];

assign RGB_o=RGB_temp[N-1];

genvar i;
    generate
        for (i=1; i < N; i++) begin: generate_submodules
            ImageComposer_aux ic_aux(.RGB_1_i(RGB_temp[i-1]),.RGB_2_i(RGB_i[i]),.RGB_o(RGB_temp[i]));
				
        end
    endgenerate

endmodule


//ImageComposer_aux(.RGB_1_i(),.RGB_2_i(),.RGB_o())