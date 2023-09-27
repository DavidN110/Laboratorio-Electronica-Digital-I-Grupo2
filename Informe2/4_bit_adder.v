module \4_bit_adder  (
  input A0,
  input B0,
  input A1,
  input B1,
  input A2,
  input B2,
  input A3,
  input B3,
  input Cin,
  output C0,
  output C1,
  output C2,
  output C3,
  output COut
);
  wire s0;
  wire s1;
  wire s2;
  
  Sumador Sumador_0 (A0,B0,Cin,s0,C0);
  Sumador Sumador_1 (A1,B1,s0,s1,C1);
  Sumador Sumador_2 (A2,B2,s1,s2,C2);
  Sumador Sumador_3 (A3,B3,s2,COut,C3);
endmodule
