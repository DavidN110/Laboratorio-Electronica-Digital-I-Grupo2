module testbech;
 reg [8:0] inputs;
  integer i;
  initial
  begin
  for (i=0; i<256; i=i+1)
  begin
  inputs = i;
  #1;
  end
  end
  
  wire [4:0] outs;
  // DEVICE/DESIGN UNDER TEST
  \4_bit_adder dut (
    .B3(inputs[8]), .A3(inputs[7]), .B2(inputs[6]), 
    .A2(inputs[5]), .B1(inputs[4]), .A1(inputs[3]), 
    .B0(inputs[2]), .A0(inputs[1]), .Cin(inputs[0]),
    .COut(outs[4]), .C3(outs[3]), .C2(outs[2]), .C1(outs[1]), .C0(outs[0])
  );

  // MONITOR
  // initial
  //   $monitor("Time: %t, a = %d, b = %d => out = %d",
  //     $time, a, b, value);

  // WAVES IN VCD TO OPEN IN GTKWAVE
  initial
  begin
    $dumpfile("suma_4_bits.vcd");
    $dumpvars(0, testbech);
  end

endmodule
