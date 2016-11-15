// complete this code first
// then expand it to count 0~15, and name it as count16.v
// use only arrays for all registers and wires (except CLK)
// Author: Andrew Peklar 

module TestMod;
   reg CLK;
   wire [0:15] Q;
   wire [0:3] C;

   always begin // this is clock wave
      CLK = 0;  // 0 for half cycle (#1)
      #1;
      CLK = 1;  // 1 for half cycle (#1)
      #1;
   end

   RippleMod my_ripple(CLK, Q);
   CoderMod my_coder(Q, C);

   initial #36 $finish;

   initial begin
      $display("-----------------------------------------------");
      $display("Time   CLK   Q:0123456789ABCDEF  C:0123     C");
      $display("-----------------------------------------------");
      $monitor("%0d\t%b      %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b    %b    %d", $time, CLK, Q[0],  Q[1],  Q[2],  Q[3],  Q[4], 
                                                                                        Q[5],  Q[6],  Q[7],  Q[8],  Q[9], 
                                                                                        Q[10], Q[11], Q[12], Q[13], Q[14], 
                                                                                        Q[15], C, C);
   end
endmodule

module CoderMod(Q, C); //16 inputs and 4 outputs
   input  [0:15]Q;
   output [0:3]C;

   //sets binary digit values
   or(C[0], Q[8], Q[9], Q[10], Q[11], Q[12], Q[13], Q[14], Q[15]); 	//c0
   or(C[1], Q[4], Q[5], Q[6] , Q[7],  Q[12], Q[13], Q[14], Q[15]); 	//c1
   or(C[2], Q[2], Q[3], Q[6] , Q[7],  Q[10], Q[11], Q[14], Q[15]); 	//c2
   or(C[3], Q[1], Q[3], Q[5] , Q[7],  Q[9] , Q[11], Q[13], Q[15]); 	//c3
   //Or gates enable bit flip for C[X] when true in the Q table
   //logic gate statement to define an output from input
   // logic gate statement to define an output from input
endmodule

module RippleMod(CLK, Q);
   input CLK;
   output [0:15]Q;

   reg [0:15]Q;

   always @(posedge CLK) begin
      Q[0]  <=  Q[15]; //ripple logic loop
      Q[1]  <=  Q[0];
      Q[2]  <=  Q[1];
      Q[3]  <=  Q[2];
      Q[4]  <=  Q[3];
      Q[5]  <=  Q[4];
      Q[6]  <=  Q[5];
      Q[7]  <=  Q[6];
      Q[8]  <=  Q[7];
      Q[9]  <=  Q[8];
      Q[10] <=  Q[9];
      Q[11] <=  Q[10];
      Q[12] <=  Q[11];
      Q[13] <=  Q[12];
      Q[14] <=  Q[13];
      Q[15] <=  Q[14];
   end

   initial begin // here we conveniently set flipflops to 1000 (binary)
      Q[0]  = 1;
      Q[1]  = 0;
      Q[2]  = 0;
      Q[3]  = 0;
      Q[4]  = 0;
      Q[5]  = 0;
      Q[6]  = 0;
      Q[7]  = 0;
      Q[8]  = 0;
      Q[9]  = 0;
      Q[10] = 0;
      Q[11] = 0;
      Q[12] = 0;
      Q[13] = 0;
      Q[14] = 0;
      Q[15] = 0;
   end
endmodule
