module processorV1(W_addr, W_en, RA_addr, RB_addr, Clock_50,Imm,A_sel,F);
	input [1:0] W_addr;
	input W_en;
	input [1:0] RA_addr;
	input [1:0] RB_addr;
	input Clock_50;
	input [7:0] Imm;
	input A_sel;
	input [2:0] F;
	wire [7:0] RA_data;
	wire [7:0] RB_data;
	wire [7:0] alu_a;
	wire [7:0] W_data;
	
	register4x8 reg1(.W_data(W_data),.W_addr(W_addr), .W_en(W_en), .RA_addr(RA_addr), .RB_addr(RB_addr), .RA_data(RA_data), .RB_data(RB_data), .Clock_50(Clock_50));
	
	assign alu_a = A_sel ? Imm : RA_data;
	
	alu alu1(.a(alu_a),.b(RB_data),.f(F),.y(W_data));
	

endmodule