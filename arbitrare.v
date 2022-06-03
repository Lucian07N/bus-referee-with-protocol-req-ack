//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Neagu Lucian-Alexandru
// Data        : 27.05.2022
//---------------------------------------------------------------------------------------
// Descriere   : Arbitrare 
//---------------------------------------------------------------------------------------

module arbitrare #(
	parameter REQ_DATA_WIDTH  = 'd8,  
	parameter ACK_DATA_WIDTH  = 'd8  
)(
    input      						  clk,                                         
    input        					  rst_n,                                       
    input      						  client0_req,                  // request de la primul client
    input      [REQ_DATA_WIDTH  -1:0] client0_data_req,             //Date trimise de primul client impreuna cu request ul
    input      						  winner_ack,                   // acknowledge, trimis  ca si confirmare catre un client
    input      [ACK_DATA_WIDTH  -1:0] winner_data_ack,              //Datele trimise de destinatar catre client 
    input      						  client1_req,                  // request de la al doilea client
    input      [REQ_DATA_WIDTH  -1:0] client1_data_req,             //Date trimise de al doilea client impreuna cu request ul
	
	output reg 						  client0_ack,                  // acknowledge catre primul client
    output reg [ACK_DATA_WIDTH  -1:0] client0_data_ack,             //Date primite de primul client de la destinatar impreuna cu semnalul de winner_ack
    output reg                        client1_ack,                  // acknowledge catre al doilea client
    output reg [ACK_DATA_WIDTH  -1:0] client1_data_ack,             //Date primite de al doilea client de la destinatar impreuna cu semnalul de winner_ack
    output reg                        winner_req,                   // request primit de destinatar
    output reg [REQ_DATA_WIDTH  :0]   winner_data_req               //Data primita de destinatar la request

);
reg client_servit;

always @(posedge clk or negedge rst_n)  
	if(~rst_n) begin
		client0_ack <= 'b0;
		client1_ack <= 'b0;
		winner_req  <= 'b0;
		client0_data_ack [ACK_DATA_WIDTH -1:0] <= 'b0;
		client1_data_ack [ACK_DATA_WIDTH -1:0] <= 'b0;
		winner_data_req  [ACK_DATA_WIDTH :0] <= 'b0;
		client_servit <= 'b0;
	end else
	if(~client_servit) begin 
		if(client0_req) begin  								//verific daca este request pentru client 0
			if(client0_ack) begin								// verific daca este acknowledge pentru client 0
				client0_ack <= 'b0;									// cobor acknowledge dupa un tact
				client0_data_ack <= 'b0;
				client_servit <= 'b1;
			end
			else
			begin 													
			if(winner_ack) begin								// verific daca a primit destinatarul request
				winner_req <= 'b0;
				client0_ack <= 'b1;
				client0_data_ack <= winner_data_ack; 				//atribui datele primite de la destinatar la client 0
			end
			else
			begin
				winner_req <= 'b1;
				winner_data_req[7:0] <= client0_data_req;			//datele de la client vor fi trimise la destinatar
				winner_data_req[8] <= 0;
			end
			end
		end
		else
		client_servit <= 'b1; 										//daca nu avem request pentru client 0, clientul servit va fi clientul 1
		end
		else
		begin
		if(client1_req) begin									//verific daca este request pentru client 1;
			if(client1_ack) begin
				client1_ack  <= 'b0;
				client1_data_ack <= 'b0;
				client_servit <= 'b0;
			end
			else
			begin
			if(winner_ack ) begin
				winner_req <= 'b0;
				client1_ack <= 'b1;									// client 1 primeste acknowledge
				client1_data_ack <= winner_data_ack;				// client 1 primeste datele
			end
			else
			begin
				winner_req <= 'b1;									// face request pentru destinatar
				winner_data_req[7:0] <= client1_data_req;			// datele de la client ajung la destinatar
				winner_data_req[8] <= 1;
			end
			end 
		end
		else
		client_servit <= 0 ;										// daca nu exista request pentru client 1 ne intoarcem la client 0
end

endmodule