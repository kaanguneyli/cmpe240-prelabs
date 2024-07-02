`timescale 1ns / 1ns
module source(c, a, b);

input wire [1:0] a; // 2 bit
input wire [1:0] b; // 2 bit
output wire [1:0] c; // 2 bit

// Fill here for the gates

wire nota1; //p'
wire notb1; //r'
wire c0_1;
wire c0_2;
wire c0_3;
wire c1_1;
wire c1_2;
wire c1_3;

not(nota1, a[1]);
not(notb1, b[1]);

or(c0_1, nota1, b[1]);
or(c0_2, a[0], b[1]);
or(c0_3, a[1], a[0], b[0]);
and(c[0], c0_1, c0_2, c0_3);

and(c1_1, nota1, b[1], a[0]);
and(c1_2, nota1, b[1], b[0]);
and(c1_3, a[1], notb1);
or(c[1], c1_1, c1_2, c1_3);


endmodule
