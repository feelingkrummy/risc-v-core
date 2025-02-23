module decoder_5to32 (
	input [4:0] encoded,
	output reg [31:0] decoded
);

	always @(*) begin
		case(encoded)
			5'd0  : decoded = 32'b00000000000000000000000000000001;
			5'd1  : decoded = 32'b00000000000000000000000000000010;
			5'd2  : decoded = 32'b00000000000000000000000000000100;
			5'd3  : decoded = 32'b00000000000000000000000000001000;
			5'd4  : decoded = 32'b00000000000000000000000000010000;
			5'd5  : decoded = 32'b00000000000000000000000000100000;
			5'd6  : decoded = 32'b00000000000000000000000001000000;
			5'd7  : decoded = 32'b00000000000000000000000010000000;
			5'd8  : decoded = 32'b00000000000000000000000100000000;
			5'd9  : decoded = 32'b00000000000000000000001000000000;
			5'd10 : decoded = 32'b00000000000000000000010000000000;
			5'd11 : decoded = 32'b00000000000000000000100000000000;
			5'd12 : decoded = 32'b00000000000000000001000000000000;
			5'd13 : decoded = 32'b00000000000000000010000000000000;
			5'd14 : decoded = 32'b00000000000000000100000000000000;
			5'd15 : decoded = 32'b00000000000000001000000000000000;
			5'd16 : decoded = 32'b00000000000000010000000000000000;
			5'd17 : decoded = 32'b00000000000000100000000000000000;
			5'd18 : decoded = 32'b00000000000001000000000000000000;
			5'd19 : decoded = 32'b00000000000010000000000000000000;
			5'd20 : decoded = 32'b00000000000100000000000000000000;
			5'd21 : decoded = 32'b00000000001000000000000000000000;
			5'd22 : decoded = 32'b00000000010000000000000000000000;
			5'd23 : decoded = 32'b00000000100000000000000000000000;
			5'd24 : decoded = 32'b00000001000000000000000000000000;
			5'd25 : decoded = 32'b00000010000000000000000000000000;
			5'd26 : decoded = 32'b00000100000000000000000000000000;
			5'd27 : decoded = 32'b00001000000000000000000000000000;
			5'd28 : decoded = 32'b00010000000000000000000000000000;
			5'd29 : decoded = 32'b00100000000000000000000000000000;
			5'd30 : decoded = 32'b01000000000000000000000000000000;
			5'd31 : decoded = 32'b10000000000000000000000000000000;
			default : decoded = 32'd0;
		endcase
	end
	
endmodule
