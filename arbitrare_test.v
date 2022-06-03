//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Neagu Lucian-Alexandru
// Data        : 27.05.2022
//---------------------------------------------------------------------------------------
// Descriere   : Arbitrare test
//---------------------------------------------------------------------------------------

module arbitrare_test;

parameter REQ_DATA_WIDTH  = 'd8;
parameter ACK_DATA_WIDTH  = 'd8;

wire      						clk;                                         
wire        					rst_n;                                       
wire      						client0_req;                  
wire  [REQ_DATA_WIDTH  -1:0] 	client0_data_req;             
wire      						winner_ack;                   
wire  [ACK_DATA_WIDTH  -1:0] 	winner_data_ack;              
wire      						client1_req;                  
wire  [REQ_DATA_WIDTH  -1:0] 	client1_data_req;             
wire  						    client0_ack;                  
wire  [ACK_DATA_WIDTH  -1:0] 	client0_data_ack;             
wire                         	client1_ack;                  
wire  [ACK_DATA_WIDTH  -1:0] 	client1_data_ack;             
wire                         	winner_req;                   
wire  [REQ_DATA_WIDTH  :0]   	winner_data_req;              



arbitrare #(
.REQ_DATA_WIDTH         (REQ_DATA_WIDTH     ),
.ACK_DATA_WIDTH         (ACK_DATA_WIDTH     )
) arbitrare_dut ( 
.clk                  (clk ),
.rst_n                (rst_n ),
.client0_req          (client0_req ),
.client0_data_req     (client0_data_req),
.client1_req          (client1_req    ),
.client1_data_req     (client1_data_req),
.winner_ack           (winner_ack      ),
.winner_data_ack      (winner_data_ack ),
.client0_ack          (client0_ack     ),
.client0_data_ack     (client0_data_ack),
.client1_ack          (client1_ack     ),
.client1_data_ack     (client1_data_ack),
.winner_req           (winner_req ),
.winner_data_req      (winner_data_req)
);

arbitrare_tb 
i_arbitrare_tb (
.clk                  (clk              ),   
.rst_n                (rst_n            ),  
.client0_req          (client0_req      ),
.client0_data_req     (client0_data_req ),
.client1_req          (client1_req      ),
.client1_data_req     (client1_data_req ),
.client0_ack          (client0_ack      ),
.client1_ack          (client1_ack      )
);

winner_req_ack
winner_req_ack_DUT(
.clk                  (clk              ),
.rst_n                (rst_n            ),
.winner_req           (winner_req       ),
.winner_data_req      (winner_data_req  ),
.winner_ack           (winner_ack       ),
.winner_data_ack      (winner_data_ack  )

);

endmodule