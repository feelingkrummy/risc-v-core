
module core #(
	parameter IMEM_SIZE = 4096
	parameter IMEM_INIT_FILE = ""
) (
	input clk,
	input reset, 

	// AXI4-Lite Master to Outside
	output wire m_axi_awvalid,
	input m_axi_awready,
	output wire [31:0] m_axi_awaddr,
	output wire [2:0] m_axi_awprot,

	output wire m_axi_wvalid,
	input m_axi_wready,
	output wire [31:0] m_axi_wdata,
	output wire [3:0] m_axi_wstrb,

	input m_axi_bvalid,
	output wire m_axi_bvalid,
	input m_axi_bresp,

	output wire m_axi_arvalid,
	input m_axi_arready,
	output wire [31:0] m_axi_araddr,
	output wire [2:0] m_axi_arprot,

	input m_axi_rvalid,
	output wire m_axi_rready,
	input [31:0] m_axi_rdata,
	input [1:0] m_axi_rresp
);

	reg [31:0] pc, next_pc;
	wire [31:0] instr;

	dual_port_ram #(
		.DATA_WIDTH(32),
		.ADDR_WIDTH($clog2(IMEM_SIZE)),
		.INIT_FILE(IMEM_INIT_FILE)
	) imem (
		.clk(clk)

		// Not using this interface yet
		// For outside access (debugging, flashing, etc)
		.data_a(),
		.addr_a(),
		.we_a(),
		.q_a(),

		// 
		.data_b(32'd0),
		.addr_b(pc[$clog2(IMEM_SIZE)-1:0]),
		.we_b(1'b0),
		.q_b(instr)
	);




endmodule
