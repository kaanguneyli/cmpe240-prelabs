`timescale 1ns / 1ns

module encoder(y, x);
// Implement here
input wire [6:0] x;
output reg [2:0] y;

integer i;
always @* begin
y=0;
for (i = 0; i<7; i++) begin
	if (x[i] == 1 ) begin
		y=y+1;
		end
	end
end

endmodule


module mux(z, y, s);

// Implement here
input wire [2:0] y;
input wire [1:0] s;
output reg z;

always @* begin
z=0;
if (s==0 && y==0) begin
    z<=1;
end
else if (s==1) begin
    if (y==1 || y==2 || y==4) begin
        z <= 1;
    end
end
else if (s==2)begin
    if (y==3 || y==5 || y==6)begin
        z<=1;
    end
end
else if (s==3 && y==7) begin
        z<=1;
end
else begin 
    z<=0;
end
end
endmodule