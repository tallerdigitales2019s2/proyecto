module MemoryManager_tb();

 logic MR_i,MW_i;
 logic[31:0] data_i,address_i,mem_data_i,uart_data_i;

 logic mem_MR_o,mem_MW_o,sm_MW_o,uart_MR_o;
 logic[31:0] data_o,mem_data_o,sm_data_o;
 logic [29:0] uart_address_o,sm_address_o,mem_address_o;

MemoryManager DUT(.*);


 always begin
 data_i=			32'hF0F0F0F0;
 mem_data_i= 	32'hCCCCCCCC;
 uart_data_i=	32'hDDDDDDDD;
 
 
 address_i=		32'h0000FFFF;
 MR_i=0;
 MW_i=0;
 #1;
 
 MR_i=1;
 MW_i=0;
 #1;
 
 MR_i=0;
 MW_i=1;
 #1;
 
 MR_i=1;
 MW_i=1;
 #1;
 
 
 address_i=		32'h8000FFFF;
 MR_i=0;
 MW_i=0;
 #1;
 
 MR_i=1;
 MW_i=0;
 #1;
 
 MR_i=0;
 MW_i=1;
 #1;
 
 MR_i=1;
 MW_i=1;
 #1;
 
 
 address_i=		32'hC000FFFF;
 MR_i=0;
 MW_i=0;
 #1;
 
 MR_i=1;
 MW_i=0;
 #1;
 
 MR_i=0;
 MW_i=1;
 #1;
 
 MR_i=1;
 MW_i=1;
 #1;
 
 
 end





endmodule