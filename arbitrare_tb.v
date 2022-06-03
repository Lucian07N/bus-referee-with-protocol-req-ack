//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Neagu Lucian-Alexandru
// Data        : 27.05.2022
//---------------------------------------------------------------------------------------
// Descriere   : Arbitrare testbench
//---------------------------------------------------------------------------------------

module arbitrare_tb #(

parameter REQ_DATA_WIDTH = 'd8,
                               
                               
parameter ACK_DATA_WIDTH = 'd8 
                               
                              
)(
output reg 					    	 rst_n,
output reg                      	 clk,
output reg 					         client0_req,
output reg [REQ_DATA_WIDTH -1:0]     client0_data_req,
output reg						     client1_req,
output reg [REQ_DATA_WIDTH -1:0]     client1_data_req,

input                     	    	 client1_ack,
input 						    	 client0_ack
);

initial begin 
	clk					<=1'b0;
	client0_req			<=1'b0;
	client0_data_req	<='b0;
	client1_req			<=1'b0;
	client1_data_req	<='b0;
	forever #5 clk = ~clk;
end

initial begin
	rst_n <= 1'b1;
	@(posedge clk);
	rst_n <= 1'b0;
	@(posedge clk);
	rst_n <= 1'b1;
	@(posedge clk);
	client0_req <= 1'b1;
	client0_data_req = 'd21;
	@(posedge clk);
	@(posedge clk);	
	@(posedge clk);
	@(posedge clk);
	client1_req <= 1'b1;
	client1_data_req = 'd7;
	@(negedge client1_ack);
	@(posedge clk);
	client1_req <= 1'b1;
	client1_data_req = 'd5;
	client0_req <= 1'b1;
	client0_data_req = 'd3;
	$stop;
end

always @ (negedge client0_ack )
begin
	client0_req <= 1'b0;
end

always @ (negedge client1_ack )
begin
    client1_req <= 1'b0;
end
	
endmodule
