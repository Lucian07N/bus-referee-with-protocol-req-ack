//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Neagu Lucian-Alexandru
// Data        : 27.05.2022
//---------------------------------------------------------------------------------------
// Descriere   : Client 1
//---------------------------------------------------------------------------------------

module client1_rq_ack #(
parameter REQ_DATA_WIDTH = 'd8,    				// functioneaza pe acelasi principiu ca si client0
parameter ACK_DATA_WIDTH = 'd8     
)(
input 					    	 rst_n,
input                        	 clk,
input                     	     client1_ack,
input   [ACK_DATA_WIDTH -1:0]    client1_data_ack,

output 						     client1_req,
output  [REQ_DATA_WIDTH -1:0]    client1_data_req

);


endmodule 