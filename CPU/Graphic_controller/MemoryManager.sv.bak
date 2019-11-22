module MemoryManager(MR_i,MW_i,data_i,address_i,data_o, 
							mem_address_o, mem_data_i,mem_data_o, mem_MR_o, mem_MW_o,
							sm_address_o, sm_data_o, sm_MW_o,
							uart_address_o, uart_data_i, uart_MR_o
							);
							
input logic MR_i,MW_i;
input logic[31:0] data_i,address_i,mem_data_i,uart_data_i;

output logic mem_MR_o,mem_MW_o,sm_MW_o,uart_MR_o;
output logic[31:0] data_o,mem_data_o,sm_data_o;
output logic [29:0] uart_address_o,sm_address_o,mem_address_o;

logic [1:0] selector;
assign selector =  address_i[31:30];


//00 mem
//01 
//10 sprite manager
//11 uart
assign mem_MR_o = (selector == 2'b00) ? MR_i:0;
assign mem_MW_o = (selector == 2'b00) ? MW_i:0;
assign mem_address_o = (selector == 2'b00) ? address_i[29:0]:0;
assign mem_data_o = (selector == 2'b00) ? data_i:0;



assign sm_MW_o = (selector == 2'b10) ? MW_i:0;
assign sm_address_o = (selector == 2'b10) ? address_i[29:0]:0;
assign sm_data_o = (selector == 2'b10) ? data_i:0;




assign uart_MR_o = (selector == 2'b11) ? MR_i:0;
assign uart_address_o = (selector == 2'b11) ? address_i[29:0]:0;


assign data_o = (selector == 2'b00) ? mem_data_i:uart_data_i;

endmodule