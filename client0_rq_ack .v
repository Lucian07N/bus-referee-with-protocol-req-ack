//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Neagu Lucian-Alexandru
// Data        : 27.05.2022
//---------------------------------------------------------------------------------------
// Descriere   : Client 0
//---------------------------------------------------------------------------------------

module client0_rq_ack #(
parameter REQ_DATA_WIDTH = 'd8,  // Numar de biti ai datelor transferate simultan cu cererea
                                 //primul bit semnifica 
                                 // indexul clientului care a generat cererea
							   
parameter ACK_DATA_WIDTH = 'd8  // Numar de biti ai datelor transferate simultan cu confirmarea                        
)(
input 						          clk,           
input 						          rst_n,      
input 						      	  client0_ack,
input     [ACK_DATA_WIDTH -1:0]    	  client0_data_ack,
   
output  					     	  client0_req,
output    [REQ_DATA_WIDTH -1:0]   	  client0_data_req
);

endmodule 