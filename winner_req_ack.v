//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Neagu Lucian-Alexandru
// Data        : 27.05.2022
//---------------------------------------------------------------------------------------
// Descriere   : Winner
//---------------------------------------------------------------------------------------
 
 module winner_req_ack #(

parameter REQ_DATA_WIDTH = 'd8,
                               
                               
parameter ACK_DATA_WIDTH = 'd8 
                               
                              
)(

input 					    	       rst_n,
input                        	       clk,
input 					               winner_req,
input         [REQ_DATA_WIDTH :0]      winner_data_req,

output 	reg						       winner_ack,
output 	reg   [ACK_DATA_WIDTH -1:0]    winner_data_ack
);

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		winner_ack <= 'b0;
		winner_data_ack <='b0; 
	end else
	if (winner_req == 1) begin 		
		if(winner_ack == 1) begin
			winner_ack <= 'b0;  	   
			winner_data_ack <= 'b0;
		end
		else
		winner_ack <= 'b1;
		winner_data_ack <= winner_data_req + 1;
	end
end
	
endmodule 