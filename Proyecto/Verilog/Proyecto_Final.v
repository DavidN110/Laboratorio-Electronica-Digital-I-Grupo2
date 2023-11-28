module Proyecto_Final(
    // 50MHz clock
    input clk,
    // Input from reset button (active low)
    input audio,
    input mq3,
    input distancia,
	output reg rele = 0
    );

always@(posedge clk)
begin
	if(~distancia)
		begin
		if(audio)
			begin
			if(mq3)
				begin
				rele <= 1;
				end
			else
				begin
				rele <= 0;
				end
			end
		end
end

endmodule
