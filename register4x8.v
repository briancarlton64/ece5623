module register4x8 (W_data,W_addr, W_en, RA_addr, RB_addr, RA_data, RB_data, Clock_50);
	input [7:0] W_data;
	input [1:0] W_addr;
	input W_en;
	input [1:0] RA_addr;
	
	input [1:0] RB_addr;
	
	input Clock_50;
	output  [7:0] RA_data;
	output  [7:0] RB_data;
	
	
	reg [7:0] reg0;
	reg [7:0] reg1;
	reg [7:0] reg2;
	reg [7:0] reg3;
	
	
	assign RA_data = RA_addr[1] ? (RA_addr[0] ? reg3 : reg2) :
                            (RA_addr[0] ? reg1 : reg0);
	assign RB_data = RB_addr[1] ? (RB_addr[0] ? reg3 : reg2) :
                            (RB_addr[0] ? reg1 : reg0);
	
	always @(posedge Clock_50) begin
		if(W_en) begin
			case(W_addr)
				2'b00:
					reg0 = W_data;
				2'b01:
					reg1 = W_data;
				2'b10:
					reg2 = W_data;
				2'b11:
					reg3 = W_data;
			endcase
		end
	end
	
endmodule
	
		
	