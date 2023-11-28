module LEDs(
    // 50MHz clock
    input clk,
    // Input from reset button (active low)
    input senal_alcohol,
    input senal_sonido,
    input senal_distancia,
    //output reg mensaje,
	output reg led1 = 1,
	output reg led2 = 1,
	output reg rele = 0
    );

always@(posedge clk)
begin
	if(senal_distancia)
		begin
			if(senal_sonido)
			begin
				led1 <= 0;
				if(~senal_alcohol)
				begin
					led2 <= 0;
					rele <= 0;
				end
				else
				begin
					led2 <= 1;
					rele <= 1;
				end
			end
		end
	else
		begin
			led1 <= 1;
			led2 <= 1;
		end
end

endmodule
