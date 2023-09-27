module Com_to_2 (
  input A0,
  input A1,
  input A2,
  input A3,
  input Sin,
  output \-A0 ,
  output \-A1 ,
  output \-A2 ,
  output \-A3 
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  assign s0 = (Sin ^ A0);
  assign s2 = (Sin ^ A1);
  assign s4 = (Sin ^ A2);
  
  Semisumador Semisumador_0 (Sin,s0,\-A0 ,s1);
  Semisumador Semisumador_1 (s1,s2,\-A1 ,s3);
  Semisumador Semisumador_2 (s3,s4,\-A2 ,s5);
  assign \-A3  = (s5 ^ (Sin ^ A3));
endmodule
