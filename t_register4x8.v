`timescale 1ps / 1ps

module testbench ( );

	wire [7:0] RA_data;
	wire [7:0] RB_data;
	reg Clock_50;
	reg W_en;
	reg RA_en;
	reg RB_en;
	reg [1:0] W_addr;
	reg [1:0] RA_addr;
	reg [1:0] RB_addr;
	reg [7:0] W_data;
	

	register4x8 dut (.Clock_50(Clock_50), .W_en(W_en), .RA_en(RA_en), .RB_en(RB_en), .W_addr(W_addr), .W_data(W_data), .RA_addr(RA_addr), .RA_data(RA_data), .RB_addr(RB_addr), .RB_data(RB_data));

	initial begin
		
		Clock_50 <= 1'b0;
	end
	
	always 
		#10 Clock_50 = !Clock_50;
	
	
	initial begin
		W_en <= 0; 
		RA_en <= 0; 
		RB_en <= 0; 
		W_addr <= 0; 
		RA_addr <= 0; 
		RB_addr <= 0; 
		W_data <= 0;
		
		
		
		//reg 0
		#20 W_data <= 8'hab; 
		#20 W_en <= 1; 
		#20 W_en <= 0;
		RA_en <= 1; 

		#20 RA_en <= 0;
		
		//reg 1
		#20 W_data <= 8'hef; 
		W_addr <= 1; 
		RA_addr <= 1; 
		#20 W_en <= 1; 
		#20 W_en <= 0; 
		RA_en <= 1; 
		RB_en <= 1;
		
		#20 RA_en <= 0; 
		RB_en <= 0;
		
		//reg 2
		#20 W_data <= 8'h7c; 
		W_addr <= 2; 
		RB_addr <= 2;
		#20 W_en <= 1;
		#20 W_en <= 0; 
		RA_en <= 1; 
		RB_en <= 1;
		
		#20 RA_en <= 0; 
		RB_en <= 0;
		
		//reg 3
		#20 W_data <= 8'ha8; 
		W_addr <= 3; 
		RA_addr <= 3; 
		#20 W_en <= 1;
		#20 W_en <= 0; 
		RA_en <= 1; 
		RB_en <= 1;
		
		#20 RA_en <= 0; 
		RB_en <= 0;
		
		
		//Address change
		#20 RA_en <= 1; 
		RB_en <= 1; 
		#20 RA_addr <= 0; 
		RB_addr <= 1; 
		
		
		//Write while read enabled
		#20 W_data <= 8'h9b; 
		W_addr <= 0;
		#20 W_en <= 1;
		
		//Change write address while write enabled
		#20 W_addr <= 1;
		
		#20 W_en <= 0; 
		#20 RA_en <= 0; 
		RB_en <= 0;
		
		
	end



endmodule
