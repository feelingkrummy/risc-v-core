module regfile (
	input clk,
	input reset,

	input w_en,
	input [4:0] w_addr,
	input [31:0] w_data,

	input [4:0] ra_addr,
	output wire [31:0] ra_data,

	input [4:0] rb_addr,
	output wire [31:0] rb_data
);

	reg [31:0] registers[31:0];
	wire [31:0] reg_en;

	genvar reg_idx;

	decoder_5to32 w_addr_decode ( .encoded(w_addr), .decoded(reg_en) );

	always @(posedge clk)
	begin
		registers[0] <= 32'd0;
	end
	generate
		for (reg_idx = 1; reg_idx < 32; reg_idx = reg_idx + 1) begin
			always @(posedge clk)
			begin
				if (reset) begin
					registers[reg_idx] <= 'd0;
				end else begin
					if (w_en & reg_en[reg_idx]) begin
						registers[reg_idx] <= w_data;
					end
				end
			end
		end
	endgenerate

	assign ra_data = registers[ra_addr];
	assign rb_data = registers[rb_addr];

endmodule;
