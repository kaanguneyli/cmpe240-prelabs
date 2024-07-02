`timescale 1ns / 1ns

module source(y, stateReg, nextStateReg, x, rst, clk);

output reg [0:0]y;
input wire x;
input wire rst;
input wire clk;
parameter 		S0 = 3'b000,
			Start = 3'b001,
			S00 = 3'b010,
			S001 = 3'b011,
			S1 = 3'b100,
			S11 = 3'b101,
			S110 = 3'b110;
		
output reg [2:0] stateReg;
output reg [2:0] nextStateReg;

always@(stateReg, x) begin
	case(stateReg)
		Start: begin
			y <= 1'b0;
			if(x == 0) begin
				nextStateReg <= S0;
			end
			else begin
				nextStateReg <= S1;
			end
		end
		S0: begin
			y <= 1'b0;
			if(x == 0) begin
				nextStateReg <= S00;
			end
			else begin
				nextStateReg <= S1;
			end
		end
		S00: begin
			y <= 1'b0;
			if(x == 0) begin
				nextStateReg <= S00;
			end
			else begin
				nextStateReg <= S001;
			end
		end
		S001: begin
			y <= 1'b1;
			if(x == 0) begin
				nextStateReg <= S0;
			end
			else begin
				nextStateReg <= S11;
			end
		end
		S1: begin
			y <= 1'b0;
			if(x == 0) begin
				nextStateReg <= S0;
			end
			else begin
				nextStateReg <= S11;
			end
		end
		S11: begin
			y <= 1'b0;
			if(x == 0) begin
				nextStateReg <= S110;
			end
			else begin
				nextStateReg <= S11;
			end
		end
		S110: begin
			y <= 1'b1;
			if(x == 0) begin
				nextStateReg <= S00;
			end
			else begin
				nextStateReg <= S1;
			end
		end
	endcase
end


always@(posedge clk) begin
	if(rst) begin
		stateReg <= Start;
	end
	else begin
		stateReg <= nextStateReg;
	end
end

endmodule
