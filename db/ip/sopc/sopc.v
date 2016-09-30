// sopc.v

// Generated using ACDS version 16.0 211

`timescale 1 ps / 1 ps
module sopc (
		input  wire        clk_clk,                     //                   clk.clk
		output wire [7:0]  leds_export,                 //                  leds.export
		input  wire        reset_reset_n,               //                 reset.reset_n
		output wire        sdram_clk_clk,               //             sdram_clk.clk
		output wire [11:0] sdram_controller_wire_addr,  // sdram_controller_wire.addr
		output wire [1:0]  sdram_controller_wire_ba,    //                      .ba
		output wire        sdram_controller_wire_cas_n, //                      .cas_n
		output wire        sdram_controller_wire_cke,   //                      .cke
		output wire        sdram_controller_wire_cs_n,  //                      .cs_n
		inout  wire [15:0] sdram_controller_wire_dq,    //                      .dq
		output wire [1:0]  sdram_controller_wire_dqm,   //                      .dqm
		output wire        sdram_controller_wire_ras_n, //                      .ras_n
		output wire        sdram_controller_wire_we_n   //                      .we_n
	);

	wire         pll_c0_clk;                                                // PLL:c0 -> [CPU:clk, LEDs:clk, SDRAM_controller:clk, irq_mapper:clk, jtag_uart:clk, mm_interconnect_0:PLL_c0_clk, rst_controller:clk, sysid:clock]
	wire  [31:0] cpu_data_master_readdata;                                  // mm_interconnect_0:CPU_data_master_readdata -> CPU:d_readdata
	wire         cpu_data_master_waitrequest;                               // mm_interconnect_0:CPU_data_master_waitrequest -> CPU:d_waitrequest
	wire         cpu_data_master_debugaccess;                               // CPU:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:CPU_data_master_debugaccess
	wire  [25:0] cpu_data_master_address;                                   // CPU:d_address -> mm_interconnect_0:CPU_data_master_address
	wire   [3:0] cpu_data_master_byteenable;                                // CPU:d_byteenable -> mm_interconnect_0:CPU_data_master_byteenable
	wire         cpu_data_master_read;                                      // CPU:d_read -> mm_interconnect_0:CPU_data_master_read
	wire         cpu_data_master_readdatavalid;                             // mm_interconnect_0:CPU_data_master_readdatavalid -> CPU:d_readdatavalid
	wire         cpu_data_master_write;                                     // CPU:d_write -> mm_interconnect_0:CPU_data_master_write
	wire  [31:0] cpu_data_master_writedata;                                 // CPU:d_writedata -> mm_interconnect_0:CPU_data_master_writedata
	wire  [31:0] cpu_instruction_master_readdata;                           // mm_interconnect_0:CPU_instruction_master_readdata -> CPU:i_readdata
	wire         cpu_instruction_master_waitrequest;                        // mm_interconnect_0:CPU_instruction_master_waitrequest -> CPU:i_waitrequest
	wire  [25:0] cpu_instruction_master_address;                            // CPU:i_address -> mm_interconnect_0:CPU_instruction_master_address
	wire         cpu_instruction_master_read;                               // CPU:i_read -> mm_interconnect_0:CPU_instruction_master_read
	wire         cpu_instruction_master_readdatavalid;                      // mm_interconnect_0:CPU_instruction_master_readdatavalid -> CPU:i_readdatavalid
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;  // mm_interconnect_0:jtag_uart_avalon_jtag_slave_chipselect -> jtag_uart:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;    // jtag_uart:av_readdata -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest; // jtag_uart:av_waitrequest -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;     // mm_interconnect_0:jtag_uart_avalon_jtag_slave_address -> jtag_uart:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;        // mm_interconnect_0:jtag_uart_avalon_jtag_slave_read -> jtag_uart:av_read_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;       // mm_interconnect_0:jtag_uart_avalon_jtag_slave_write -> jtag_uart:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;   // mm_interconnect_0:jtag_uart_avalon_jtag_slave_writedata -> jtag_uart:av_writedata
	wire  [31:0] mm_interconnect_0_sysid_control_slave_readdata;            // sysid:readdata -> mm_interconnect_0:sysid_control_slave_readdata
	wire   [0:0] mm_interconnect_0_sysid_control_slave_address;             // mm_interconnect_0:sysid_control_slave_address -> sysid:address
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_readdata;            // CPU:debug_mem_slave_readdata -> mm_interconnect_0:CPU_debug_mem_slave_readdata
	wire         mm_interconnect_0_cpu_debug_mem_slave_waitrequest;         // CPU:debug_mem_slave_waitrequest -> mm_interconnect_0:CPU_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_cpu_debug_mem_slave_debugaccess;         // mm_interconnect_0:CPU_debug_mem_slave_debugaccess -> CPU:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_cpu_debug_mem_slave_address;             // mm_interconnect_0:CPU_debug_mem_slave_address -> CPU:debug_mem_slave_address
	wire         mm_interconnect_0_cpu_debug_mem_slave_read;                // mm_interconnect_0:CPU_debug_mem_slave_read -> CPU:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_cpu_debug_mem_slave_byteenable;          // mm_interconnect_0:CPU_debug_mem_slave_byteenable -> CPU:debug_mem_slave_byteenable
	wire         mm_interconnect_0_cpu_debug_mem_slave_write;               // mm_interconnect_0:CPU_debug_mem_slave_write -> CPU:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_writedata;           // mm_interconnect_0:CPU_debug_mem_slave_writedata -> CPU:debug_mem_slave_writedata
	wire  [31:0] mm_interconnect_0_pll_pll_slave_readdata;                  // PLL:readdata -> mm_interconnect_0:PLL_pll_slave_readdata
	wire   [1:0] mm_interconnect_0_pll_pll_slave_address;                   // mm_interconnect_0:PLL_pll_slave_address -> PLL:address
	wire         mm_interconnect_0_pll_pll_slave_read;                      // mm_interconnect_0:PLL_pll_slave_read -> PLL:read
	wire         mm_interconnect_0_pll_pll_slave_write;                     // mm_interconnect_0:PLL_pll_slave_write -> PLL:write
	wire  [31:0] mm_interconnect_0_pll_pll_slave_writedata;                 // mm_interconnect_0:PLL_pll_slave_writedata -> PLL:writedata
	wire         mm_interconnect_0_sdram_controller_s1_chipselect;          // mm_interconnect_0:SDRAM_controller_s1_chipselect -> SDRAM_controller:az_cs
	wire  [15:0] mm_interconnect_0_sdram_controller_s1_readdata;            // SDRAM_controller:za_data -> mm_interconnect_0:SDRAM_controller_s1_readdata
	wire         mm_interconnect_0_sdram_controller_s1_waitrequest;         // SDRAM_controller:za_waitrequest -> mm_interconnect_0:SDRAM_controller_s1_waitrequest
	wire  [22:0] mm_interconnect_0_sdram_controller_s1_address;             // mm_interconnect_0:SDRAM_controller_s1_address -> SDRAM_controller:az_addr
	wire         mm_interconnect_0_sdram_controller_s1_read;                // mm_interconnect_0:SDRAM_controller_s1_read -> SDRAM_controller:az_rd_n
	wire   [1:0] mm_interconnect_0_sdram_controller_s1_byteenable;          // mm_interconnect_0:SDRAM_controller_s1_byteenable -> SDRAM_controller:az_be_n
	wire         mm_interconnect_0_sdram_controller_s1_readdatavalid;       // SDRAM_controller:za_valid -> mm_interconnect_0:SDRAM_controller_s1_readdatavalid
	wire         mm_interconnect_0_sdram_controller_s1_write;               // mm_interconnect_0:SDRAM_controller_s1_write -> SDRAM_controller:az_wr_n
	wire  [15:0] mm_interconnect_0_sdram_controller_s1_writedata;           // mm_interconnect_0:SDRAM_controller_s1_writedata -> SDRAM_controller:az_data
	wire         mm_interconnect_0_leds_s1_chipselect;                      // mm_interconnect_0:LEDs_s1_chipselect -> LEDs:chipselect
	wire  [31:0] mm_interconnect_0_leds_s1_readdata;                        // LEDs:readdata -> mm_interconnect_0:LEDs_s1_readdata
	wire   [1:0] mm_interconnect_0_leds_s1_address;                         // mm_interconnect_0:LEDs_s1_address -> LEDs:address
	wire         mm_interconnect_0_leds_s1_write;                           // mm_interconnect_0:LEDs_s1_write -> LEDs:write_n
	wire  [31:0] mm_interconnect_0_leds_s1_writedata;                       // mm_interconnect_0:LEDs_s1_writedata -> LEDs:writedata
	wire         irq_mapper_receiver0_irq;                                  // jtag_uart:av_irq -> irq_mapper:receiver0_irq
	wire  [31:0] cpu_irq_irq;                                               // irq_mapper:sender_irq -> CPU:irq
	wire         rst_controller_reset_out_reset;                            // rst_controller:reset_out -> [CPU:reset_n, LEDs:reset_n, SDRAM_controller:reset_n, irq_mapper:reset, jtag_uart:rst_n, mm_interconnect_0:CPU_reset_reset_bridge_in_reset_reset, rst_translator:in_reset, sysid:reset_n]
	wire         rst_controller_reset_out_reset_req;                        // rst_controller:reset_req -> [CPU:reset_req, rst_translator:reset_req_in]
	wire         cpu_debug_reset_request_reset;                             // CPU:debug_reset_request -> [rst_controller:reset_in1, rst_controller_001:reset_in1]
	wire         rst_controller_001_reset_out_reset;                        // rst_controller_001:reset_out -> [PLL:reset, mm_interconnect_0:PLL_inclk_interface_reset_reset_bridge_in_reset_reset]

	sopc_CPU cpu (
		.clk                                 (pll_c0_clk),                                        //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                   //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                //                          .reset_req
		.d_address                           (cpu_data_master_address),                           //               data_master.address
		.d_byteenable                        (cpu_data_master_byteenable),                        //                          .byteenable
		.d_read                              (cpu_data_master_read),                              //                          .read
		.d_readdata                          (cpu_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (cpu_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (cpu_data_master_write),                             //                          .write
		.d_writedata                         (cpu_data_master_writedata),                         //                          .writedata
		.d_readdatavalid                     (cpu_data_master_readdatavalid),                     //                          .readdatavalid
		.debug_mem_slave_debugaccess_to_roms (cpu_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (cpu_instruction_master_address),                    //        instruction_master.address
		.i_read                              (cpu_instruction_master_read),                       //                          .read
		.i_readdata                          (cpu_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (cpu_instruction_master_waitrequest),                //                          .waitrequest
		.i_readdatavalid                     (cpu_instruction_master_readdatavalid),              //                          .readdatavalid
		.irq                                 (cpu_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (cpu_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                   // custom_instruction_master.readra
	);

	sopc_LEDs leds (
		.clk        (pll_c0_clk),                           //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_leds_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_leds_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_leds_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_leds_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_leds_s1_readdata),   //                    .readdata
		.out_port   (leds_export)                           // external_connection.export
	);

	sopc_PLL pll (
		.clk                (clk_clk),                                   //       inclk_interface.clk
		.reset              (rst_controller_001_reset_out_reset),        // inclk_interface_reset.reset
		.read               (mm_interconnect_0_pll_pll_slave_read),      //             pll_slave.read
		.write              (mm_interconnect_0_pll_pll_slave_write),     //                      .write
		.address            (mm_interconnect_0_pll_pll_slave_address),   //                      .address
		.readdata           (mm_interconnect_0_pll_pll_slave_readdata),  //                      .readdata
		.writedata          (mm_interconnect_0_pll_pll_slave_writedata), //                      .writedata
		.c0                 (pll_c0_clk),                                //                    c0.clk
		.c2                 (sdram_clk_clk),                             //                    c2.clk
		.areset             (1'b0),                                      //           (terminated)
		.locked             (),                                          //           (terminated)
		.phasedone          (),                                          //           (terminated)
		.phasecounterselect (3'b000),                                    //           (terminated)
		.phaseupdown        (1'b0),                                      //           (terminated)
		.phasestep          (1'b0),                                      //           (terminated)
		.scanclk            (1'b0)                                       //           (terminated)
	);

	sopc_SDRAM_controller sdram_controller (
		.clk            (pll_c0_clk),                                          //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset),                     // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_controller_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_controller_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_controller_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_controller_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_controller_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_controller_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_controller_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_controller_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_controller_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_controller_wire_addr),                          //  wire.export
		.zs_ba          (sdram_controller_wire_ba),                            //      .export
		.zs_cas_n       (sdram_controller_wire_cas_n),                         //      .export
		.zs_cke         (sdram_controller_wire_cke),                           //      .export
		.zs_cs_n        (sdram_controller_wire_cs_n),                          //      .export
		.zs_dq          (sdram_controller_wire_dq),                            //      .export
		.zs_dqm         (sdram_controller_wire_dqm),                           //      .export
		.zs_ras_n       (sdram_controller_wire_ras_n),                         //      .export
		.zs_we_n        (sdram_controller_wire_we_n)                           //      .export
	);

	sopc_jtag_uart jtag_uart (
		.clk            (pll_c0_clk),                                                //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                           //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                                   //               irq.irq
	);

	sopc_sysid sysid (
		.clock    (pll_c0_clk),                                     //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                //         reset.reset_n
		.readdata (mm_interconnect_0_sysid_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sysid_control_slave_address)   //              .address
	);

	sopc_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                         (clk_clk),                                                   //                                       clk_0_clk.clk
		.PLL_c0_clk                                            (pll_c0_clk),                                                //                                          PLL_c0.clk
		.CPU_reset_reset_bridge_in_reset_reset                 (rst_controller_reset_out_reset),                            //                 CPU_reset_reset_bridge_in_reset.reset
		.PLL_inclk_interface_reset_reset_bridge_in_reset_reset (rst_controller_001_reset_out_reset),                        // PLL_inclk_interface_reset_reset_bridge_in_reset.reset
		.CPU_data_master_address                               (cpu_data_master_address),                                   //                                 CPU_data_master.address
		.CPU_data_master_waitrequest                           (cpu_data_master_waitrequest),                               //                                                .waitrequest
		.CPU_data_master_byteenable                            (cpu_data_master_byteenable),                                //                                                .byteenable
		.CPU_data_master_read                                  (cpu_data_master_read),                                      //                                                .read
		.CPU_data_master_readdata                              (cpu_data_master_readdata),                                  //                                                .readdata
		.CPU_data_master_readdatavalid                         (cpu_data_master_readdatavalid),                             //                                                .readdatavalid
		.CPU_data_master_write                                 (cpu_data_master_write),                                     //                                                .write
		.CPU_data_master_writedata                             (cpu_data_master_writedata),                                 //                                                .writedata
		.CPU_data_master_debugaccess                           (cpu_data_master_debugaccess),                               //                                                .debugaccess
		.CPU_instruction_master_address                        (cpu_instruction_master_address),                            //                          CPU_instruction_master.address
		.CPU_instruction_master_waitrequest                    (cpu_instruction_master_waitrequest),                        //                                                .waitrequest
		.CPU_instruction_master_read                           (cpu_instruction_master_read),                               //                                                .read
		.CPU_instruction_master_readdata                       (cpu_instruction_master_readdata),                           //                                                .readdata
		.CPU_instruction_master_readdatavalid                  (cpu_instruction_master_readdatavalid),                      //                                                .readdatavalid
		.CPU_debug_mem_slave_address                           (mm_interconnect_0_cpu_debug_mem_slave_address),             //                             CPU_debug_mem_slave.address
		.CPU_debug_mem_slave_write                             (mm_interconnect_0_cpu_debug_mem_slave_write),               //                                                .write
		.CPU_debug_mem_slave_read                              (mm_interconnect_0_cpu_debug_mem_slave_read),                //                                                .read
		.CPU_debug_mem_slave_readdata                          (mm_interconnect_0_cpu_debug_mem_slave_readdata),            //                                                .readdata
		.CPU_debug_mem_slave_writedata                         (mm_interconnect_0_cpu_debug_mem_slave_writedata),           //                                                .writedata
		.CPU_debug_mem_slave_byteenable                        (mm_interconnect_0_cpu_debug_mem_slave_byteenable),          //                                                .byteenable
		.CPU_debug_mem_slave_waitrequest                       (mm_interconnect_0_cpu_debug_mem_slave_waitrequest),         //                                                .waitrequest
		.CPU_debug_mem_slave_debugaccess                       (mm_interconnect_0_cpu_debug_mem_slave_debugaccess),         //                                                .debugaccess
		.jtag_uart_avalon_jtag_slave_address                   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                     jtag_uart_avalon_jtag_slave.address
		.jtag_uart_avalon_jtag_slave_write                     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),       //                                                .write
		.jtag_uart_avalon_jtag_slave_read                      (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),        //                                                .read
		.jtag_uart_avalon_jtag_slave_readdata                  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                                                .readdata
		.jtag_uart_avalon_jtag_slave_writedata                 (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                                                .writedata
		.jtag_uart_avalon_jtag_slave_waitrequest               (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                                                .waitrequest
		.jtag_uart_avalon_jtag_slave_chipselect                (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  //                                                .chipselect
		.LEDs_s1_address                                       (mm_interconnect_0_leds_s1_address),                         //                                         LEDs_s1.address
		.LEDs_s1_write                                         (mm_interconnect_0_leds_s1_write),                           //                                                .write
		.LEDs_s1_readdata                                      (mm_interconnect_0_leds_s1_readdata),                        //                                                .readdata
		.LEDs_s1_writedata                                     (mm_interconnect_0_leds_s1_writedata),                       //                                                .writedata
		.LEDs_s1_chipselect                                    (mm_interconnect_0_leds_s1_chipselect),                      //                                                .chipselect
		.PLL_pll_slave_address                                 (mm_interconnect_0_pll_pll_slave_address),                   //                                   PLL_pll_slave.address
		.PLL_pll_slave_write                                   (mm_interconnect_0_pll_pll_slave_write),                     //                                                .write
		.PLL_pll_slave_read                                    (mm_interconnect_0_pll_pll_slave_read),                      //                                                .read
		.PLL_pll_slave_readdata                                (mm_interconnect_0_pll_pll_slave_readdata),                  //                                                .readdata
		.PLL_pll_slave_writedata                               (mm_interconnect_0_pll_pll_slave_writedata),                 //                                                .writedata
		.SDRAM_controller_s1_address                           (mm_interconnect_0_sdram_controller_s1_address),             //                             SDRAM_controller_s1.address
		.SDRAM_controller_s1_write                             (mm_interconnect_0_sdram_controller_s1_write),               //                                                .write
		.SDRAM_controller_s1_read                              (mm_interconnect_0_sdram_controller_s1_read),                //                                                .read
		.SDRAM_controller_s1_readdata                          (mm_interconnect_0_sdram_controller_s1_readdata),            //                                                .readdata
		.SDRAM_controller_s1_writedata                         (mm_interconnect_0_sdram_controller_s1_writedata),           //                                                .writedata
		.SDRAM_controller_s1_byteenable                        (mm_interconnect_0_sdram_controller_s1_byteenable),          //                                                .byteenable
		.SDRAM_controller_s1_readdatavalid                     (mm_interconnect_0_sdram_controller_s1_readdatavalid),       //                                                .readdatavalid
		.SDRAM_controller_s1_waitrequest                       (mm_interconnect_0_sdram_controller_s1_waitrequest),         //                                                .waitrequest
		.SDRAM_controller_s1_chipselect                        (mm_interconnect_0_sdram_controller_s1_chipselect),          //                                                .chipselect
		.sysid_control_slave_address                           (mm_interconnect_0_sysid_control_slave_address),             //                             sysid_control_slave.address
		.sysid_control_slave_readdata                          (mm_interconnect_0_sysid_control_slave_readdata)             //                                                .readdata
	);

	sopc_irq_mapper irq_mapper (
		.clk           (pll_c0_clk),                     //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.sender_irq    (cpu_irq_irq)                     //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.reset_in1      (cpu_debug_reset_request_reset),      // reset_in1.reset
		.clk            (pll_c0_clk),                         //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.reset_in1      (cpu_debug_reset_request_reset),      // reset_in1.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule