module duty(
	input clk_in,
	input switch,
	output reg [23:0] duty=24'd0
);

always@(posedge clk_in)
begin
  if(switch == 1'b0)
  begin
    duty <= 24'd25000; /*minDuty=50Mhz/2000hz"(500us)"*/
  end
  else
  begin
    duty <=24'd120020;  /*maxDuty=50Mhz/416.6hz"(2400us)"*/
  end
end    
endmodule
