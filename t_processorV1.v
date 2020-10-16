`timescale 1ps/1ps
module t_processorV1();
	reg [1:0] W_addr;
	reg W_en;
	reg [1:0] RA_addr;
	reg [1:0] RB_addr;
	reg Clock_50;
	reg [7:0] Imm;
	reg A_sel;
	reg [2:0] F;
	
	processorV1 proc(.W_addr(W_addr), .W_en(W_en), .RA_addr(RA_addr), .RB_addr(RB_addr), .Clock_50(Clock_50),.Imm(Imm),.A_sel(A_sel),.F(F));
	
	initial begin
		Clock_50 <= 0;
		W_addr<=0;
		W_en<=0;
		RA_addr<=0;
		RB_addr<=0;
		Imm<=0;
		A_sel<=0;
		F<=0;

	end
	
	always @(*)
		#10 Clock_50 <= ~Clock_50;
		
	initial begin
		// set all registers to zero
		#20 Imm <= 0;
		F <= 3'b100;
		A_sel <= 1'b1;
		W_en <= 1'b1;
		#20 W_addr <= 1;
		#20 W_addr <= 2;
		#20 W_addr <= 3;
		#20 W_en <= 0;
		A_sel <= 0;
		F<= 0;
		
		//Go through procedure
		#20
		W_addr <= 0;
		W_en <= 1;
		Imm <= 8'h55;
		F<= 3'b101;
		A_sel <= 1;
		#40
		W_addr <= 1;
		RB_addr <= 0;
		W_en <= 1;
		Imm <= 8'h25;
		F <= 3'b000;
		A_sel <= 1;
		#40
		W_addr <= 2;
		RB_addr <= 1;
		W_en <= 1;
		Imm <= 8'h0f;
		F <= 3'b100;
		A_sel <= 1;
		#40
		W_addr <= 3;
		RB_addr <= 2;
		W_en <= 1;
		Imm <= 8'hb0;
		F <= 3'b101;
		A_sel <= 1;
	end
endmodule
		
		
		
		
		