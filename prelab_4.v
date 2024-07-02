`timescale 1ns / 1ns

module source(memory, instruction, r1, r2, r3, clk);

input wire [15:0] instruction;
input wire clk;
parameter 	S0 = 4'b0000,  //r3 = instruction[11:4]
			S1 = 4'b0001,  //r3 = r1 == r2
			S2 = 4'b0010,  //r3 = r1 < r2
			S3 = 4'b0011,  //r3 = r1 <= r2
			S4 = 4'b0100,  //r3 = r1 | r2 (or)
			S5 = 4'b0101,  //r3 = r1 < r2
			S6 = 4'b0110,  //r3 = r1 <= r2
			S7 = 4'b0111,  //r3 = r1 | r2 (or)
			S8 = 4'b1000,  //r3 = r1 & r2 (and)
			S9 = 4'b1001,  //r3 = r1 ^ r2 (xor) 
			S10 = 4'b1010, //r3 = ~r1 (r2 is unused)
			S11 = 4'b1011, //r3 = r1 + r2
			S12 = 4'b1100, //r3 = r1 - r2
			S13 = 4'b1101, //r3 = r1 * r2
			S14 = 4'b1110, //r3 = r1 / r2 
			S15 = 4'b1111; //r3 = r1 % r2
integer i;
integer s;
		
output reg [127:0] memory;
output reg [7:0]r1;
output reg [7:0]r2;
output reg [7:0]r3;

initial begin
	memory = 0;
	r1 = 0;
	r2 = 0;
	r3 = 0;
end

always@(posedge clk) begin
	// Read the first operand from the memory.
	s = 0;
	for (i = instruction[11:8] * 8; i < (instruction[11:8] * 8) + 8; i++) begin
		r1[s] = memory[i];
		s = s + 1;
	end
	// Read the second operand from the memory.
	s = 0;
	for (i = instruction[7:4] * 8; i < (instruction[7:4] * 8) + 8; i++) begin
		r2[s] = memory[i];
		s = s + 1;
	end
	case(instruction[15:12])
		S0: begin
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = instruction[11:4] >> s;
				s = s + 1;
			end 
		end
		S1: begin
			r3 <= (r1 == r2);
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S2: begin
			r3 <= (r1 < r2);
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S3: begin
			r3 <= (r1 <= r2);
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end
		end
		S4: begin
			r3 = r1 | r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end
		end
		S5: begin
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = instruction[11:4] >> s;
				s = s + 1;
			end 
		end
		S6: begin
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = instruction[11:4] >> s;
				s = s + 1;
			end 
		end
		S7: begin
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = instruction[11:4] >> s;
				s = s + 1;
			end 
		end
		S8: begin
			r3 = r1 & r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S9: begin
		$display(r1);
			r3 = r1 ^ r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end
		end
		S10: begin
			r3 = ~r1;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end
		end
		S11: begin
			r3 = r1 + r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end
		end
		S12: begin
			r3 = r1 - r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end
		end
		S13: begin
			r3 = r1 * r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end
		end
		S14: begin
			r3 = r1 / r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end
		end
		S15: begin
			r3 = r1 % r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end
		end
	endcase
end

endmodule
