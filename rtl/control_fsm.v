module control_fsm (
	input clk,
	input reset,

	input halt,
);
	parameter [7:0] RESET  = 8'b0000_0001;
	parameter [7:0] FETCH  = 8'b0000_0010;
	parameter [7:0] EXE    = 8'b0000_0100;
	parameter [7:0] MEM_W  = 8'b0000_1000;
	parameter [7:0] MEM_R  = 8'b0001_0000;
	
	reg [7:0] state;
	
	always @(posedge clk) 
	begin
		if (reset) begin
			state <= RESET;
		end else begin
			case (state)
				RESET, FETCH : begin
					if (!halt)
						next_state <= FETCH;
					else
						next_state <= RESET;
				end
				default: begin
				end
			endcase
		end
	end

endmodule
