module tb_regfile;
	
	reg clk;
	reg reset;

	reg w_en;
	reg [4:0] w_addr;
	reg [31:0] w_data;

	reg [4:0] ra_addr;
	wire [31:0] ra_data;

	reg [4:0] rb_addr;
	wire [31:0] rb_data;

	regfile dut (
		.clk(clk),
		.reset(reset),

		.w_en(w_en),
		.w_addr(w_addr),
		.w_data(w_data),

		.ra_addr(ra_addr),
		.ra_data(ra_data),

		.rb_addr(rb_addr),
		.rb_data(rb_data)
	);

	initial begin
		clk = 1'b1;
	end;
	always #5 clk = ~clk;


	initial begin
		$dumpfile("wave1.vcd");
		$dumpvars(0);

		reset <= 1'b1;

		w_en <= 1'b0;
		w_addr <= 'd0;
		w_data <= 'd0;

		ra_addr <= 'd0;
		rb_addr <= 'd0;

		#41;

		reset <= 1'b0;
		#10;

		for (integer i = 1; i <= 32; i = i + 1) begin
			w_en <= 1'b1;
			w_addr <= i-1;
			w_data <= i;
			#10;
		end

		w_en <= 1'b0;
		w_addr <= 'd0;
		w_data <= 'd0;
		#20;

		for (integer i = 0; i < 32; i = i + 1) begin
			ra_addr <= i;
			rb_addr <= i;
			#10;
		end

		ra_addr <= 'd0;
		rb_addr <= 'd0;
		#20;
	
		$fatal;
		$finish(1);
	end;

endmodule
