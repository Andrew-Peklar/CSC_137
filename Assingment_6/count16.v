// Descrip: Ripple Clock that iterates names of authors on count
// Authors: Andrew Peklar and Eric Peck

module TestMod;
   reg CLK;
   wire [0:19] Q;
   wire [0:6] C;

   always begin // this is clock wave
      CLK = 0;  // 0 for half cycle (#1)
      #1;
      CLK = 1;  // 1 for half cycle (#1)
      #1;
   end

   RippleMod my_ripple(CLK, Q);
   CoderMod my_coder(Q, C);

   initial #40 $finish;

   initial begin
      $display("-----------------------------------------------");
      $display("Last Names: Peklar and Peck");
      $display("-----------------------------------------------");
      $display("Time   CLK   Q:0123456789  C:0123456    C  ASCII");
      $display("-----------------------------------------------");
      $monitor("%0d\t%b      %b    %b    %h   %c", $time, CLK, Q, C, C, C);


   end
endmodule

module CoderMod(Q, C); //16 inputs and 4 outputs
   input  [0:19]Q;
   output [0:6]C;

//						   C
//				   hex   0 1 2 	3 4 5 6
//             ||    | | | 	| | | | 
// Q[0]	P	=	50	=	1 0 1 	0 0 0 0 
// Q[1]	e	=	65	=	1 1 0 	0 1 0 1
// Q[2]	k	=	6b	=	1 1 0 	1 0 1 1 
// Q[3]	l	=	6c	=	1 1 0 	1 1 0 0 
// Q[4]	a	=	61	=	1 1 0 	0 0 0 1
// Q[5]	r	=	72	=	1 1 1 	0 0 1 0
//     	|	 	||	 	| | | 	| | | |
// Q[6]	A	=	63	=	1 1 0 	0 0 1 1
// Q[7]	n	=	6e	=	1 1 0 	1 1 1 0  
// Q[8]	d	=	64	=	1 1 0 	0 1 0 0
// Q[9]	r	=	72	=	1 1 1 	0 0 1 0
// Q[10	e	=	65	=	1 1 0 	0 1 0 1  
// Q[11	w	=	77	=	1 1 1 	0 1 1 1
//     	|	 	||	 	| | | 	| | | |
// Q[12	P	=	50	=	1 0 1 	0 0 0 0
// Q[13	e	=	65	=	1 1 0 	0 1 0 1
// Q[14	c	=	63	=	1 1 0 	0 0 1 1
// Q[15	k	=	6b	=	1 1 0 	1 0 1 1 
//     	|	 	||	 	| | | 	| | | |  
// Q[16	E	=	45	=	1 0 0 	0 1 0 1 
// Q[17	r	=	72	=	1 1 1 	0 0 1 0
// Q[18	i	=	69	=	1 1 0 	1 0 0 1
// Q[19	c	=	63	=	1 1 0 	0 0 1 1
// 



   assign C[0] = 1; //always 1

   or(C[1], Q[1], Q[2], Q[3], Q[4],  Q[5],  Q[6],  Q[7],  Q[8],  Q[9],  Q[10], Q[11], Q[13], Q[14], Q[15], Q[17], Q[18], Q[19]);
   or(C[2], Q[0], Q[5], Q[9], Q[11], Q[12], Q[17]);
   or(C[3], Q[2], Q[3], Q[7], Q[15], Q[18]);
   or(C[4], Q[1], Q[3], Q[7], Q[8],  Q[10], Q[11], Q[13], Q[16]);
   or(C[5], Q[2], Q[5], Q[6], Q[7],  Q[9],  Q[11], Q[14], Q[15], Q[17], Q[19]);
   or(C[6], Q[1], Q[2], Q[4], Q[6],  Q[10], Q[11], Q[13], Q[14], Q[15], Q[16], Q[18] Q[19]);

   //Or gates enable bit flip for C[X] when true in the Q table
endmodule

module RippleMod(CLK, Q);
   input CLK;
   output [0:19]Q;

   reg [0:19]Q;

   always @(posedge CLK) begin
      Q[0]   <=  Q[19]; //ripple logic loop
      Q[1]   <=  Q[0];
      Q[2]   <=  Q[1];
      Q[3]   <=  Q[2];
      Q[4]   <=  Q[3];
      Q[5]   <=  Q[4];
      Q[6]   <=  Q[5];
      Q[7]   <=  Q[6];
      Q[8]   <=  Q[7];
      Q[9]   <=  Q[8];
      Q[10]  <=  Q[9];
      Q[11]  <=  Q[10];
      Q[12]  <=  Q[11];
      Q[13]  <=  Q[12];
      Q[14]  <=  Q[13];
      Q[15]  <=  Q[14];
      Q[16]  <=  Q[15];
      Q[17]  <=  Q[16];
      Q[18]  <=  Q[17];
      Q[19]  <=  Q[18];

   end

   initial begin // here we conveniently set flipflops to 1000 (binary)
      Q[0]   = 1;
      Q[1]   = 0;
      Q[2]   = 0;
      Q[3]   = 0;
      Q[4]   = 0;
      Q[5]   = 0;
      Q[6]   = 0;
      Q[7]   = 0;
      Q[8]   = 0;
      Q[9]   = 0;
      Q[10]  = 1;
      Q[11]  = 0;
      Q[12]  = 0;
      Q[13]  = 0;
      Q[14]  = 0;
      Q[15]  = 0;
      Q[16]  = 0;
      Q[17]  = 0;
      Q[18]  = 0;
      Q[19]  = 0;
 
   end
endmodule
