module MiniALU (
  input A0,
  input A1,
  input A2,
  input A3,
  input SA,
  input B0,
  input B1,
  input B2,
  input B3,
  input SB,
  input Cin,
  output C0,
  output C1,
  output C2,
  output C3,
  output SC,
  output Cout
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  wire s10;
  wire s11;
  wire s12;
  wire SC_temp;
  wire s13;
  wire s14;
  wire s15;
  wire s16;
  wire s17;
  Com_to_2 Com_to_2_0 (A0,A1,A2,A3,SA,s0,s1,s2,s3);
  Com_to_2 Com_to_2_1 (B0,B1,B2,B3,SB,s4,s5,s6,s7);
  assign s13 = (SB | SA);
  assign s14 = (SB & SA);
  \4_bit_adder  \4_bit_adder_2 (s0,s4,s1,s5,s2,s6,s3,s7,Cin,s8,s9,s10,s11,s12);
  assign s15 = (s12 & s13);
  Sumador Sumador_3 (s13,s14,s15,s16,s17);
  assign SC_temp = ((~ s14 & s17) | (s16 & s14));
  Com_to_2 Com_to_2_4 (s8,s9,s10,s11,SC_temp,C0,C1,C2,C3);
  assign Cout = (((s12 & ~ (s13 & ~ s14)) ^ SC_temp) & ~ (~ s14 & s13));
  assign SC = SC_temp;
endmodule
