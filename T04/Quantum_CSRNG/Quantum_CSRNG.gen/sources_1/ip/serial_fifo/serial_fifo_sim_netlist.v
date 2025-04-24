// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Apr 24 11:58:57 2025
// Host        : DELTAV-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/sammy/Documents/DSL/DSL-30.110/T04/Quantum_CSRNG/Quantum_CSRNG.gen/sources_1/ip/serial_fifo/serial_fifo_sim_netlist.v
// Design      : serial_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "serial_fifo,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module serial_fifo
   (clk,
    rst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input rst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire rst;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "510" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "509" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  serial_fifo_fifo_generator_v13_2_9 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
gcDjvJ18gZEH8C+LHMq/N7AaYWSyHgvjIQn585rdUOTVX2orO9n8j6LNiga3BYkS91+lbHAjAieW
oD/8serz9uvKt9uVuyMIE6oOFFScZR6q2wQk1d1Qzq717+8yPCwgBT9HIhfJIHLujHt+cA2l2L5t
tux9aNBdVKkk1MHv7yY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
exhH3ieiewq538XhQByQWj7PMh1Y+pzdDw+4bALHgOXUMTZleYL0Pvhip/E5VwYBOb3/5i/ElWf3
Vm6OeE9b1Jj8xb7x10akeyRaNdCJYAtTqgb7gFS/crjXeoaYKJgLqCiyaB7LdWR9BiZOWqxEPSxe
/lr/8F8psti0kra2jACCbz94iU3qDIdZWH5kqd21Pp2/YczWpJBQzh+bBz9V+EuMAeZIzY3x2GZy
jOMZPemqiqFhSEcDf09mKK3xKEUxE+TPz82hd9ZrF5OjFst6mWMVye10lkzmY5Hmmx5Y/PVgPx3R
fN0tTAZfIDGH/YUu758U8UWOIcMzBHF6rytqmg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Umfm0FNxPKfdryB9QccnkcrzqkPtalTpE+R0M3D9kxaXOa1YOGT+9jGc1TRZMLcN5NyGN3UIZcH4
LWFVfGg80k9RmFHBDZaHzOXaomQhoPSO++ArXvmvO5zgttfCHEl7jypYkuPgwfQMfjK7YII9Deex
KOC8JtqORVWmhq47cpQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cm7WeJnXtFlUdJuJH7wHYfinJTaBhpglyFWD2YwmOuS4fmVA4nXbX0IMaU1F1WGO1VK25KlFf8Nm
w8L6BJ6ZpH12xPIl3J17rMT4/3KHv9tpBWqeC080GeV5nISo8JrhOpIKa4+HBHZ6lYLce8LBAu/Z
EiBmDqw22aLsAuPAzAMh9yuHT5rpX9ykD9u0uZ5UplK05S0TsvYMUqcHNQ2hijt/lbxvUxXHTa+W
GJ5RRQAdw98wG1mc65u16hfZPsLimnw4BHwpyNGOPadShqb78rQihc+YiBTn4lgN1HhquWRGqCYZ
ZEjBmtWOJm8WJSTWtcpFEkmPlOTDmNX82e9mnw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a1mMNsEVIHwFCxw3sHygQ6eU3z5whgDQI+YHUmPAwU6q4vqfu2NVxu0z42QL1rV1rCsm39SqZ078
EGEqt7XUt6bdvI3yu4dU8gF+jou5njJ2UU34VmbOw/MQt48Hmi+hxtH1/zSlbNe2iOksDFEFTHmW
WGHgPS2bACG/KtAZMYK3gBtbnb9dtu+p5hxiQtwMOFnv9kQGBxcMaciN0yqy2TE5fygwKcNEua29
jiGUF0qgPS1k6qN+zLrYWkaVT0amR1MFXpv0WcwL+xVkxj6bBQhe5D7t5xCIsfLR4xqa5WVpa0dN
FkxGlIoufL17G/cGRr4nV4QP0sqcDCCHYpRoIA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPFWI49JcHqYFxRrTG2uFixmE4jeIWIero9KijBFo7+FOCC7hJeSlCuNlwb8mBsI0Up57fm7C8t9
tb1l2QCfvy82JqTvEuH49UmS+8/GEnbK1QbVHsDIiv3/8cFn+0zw/VSuVeaN8L0yzeNIo8m59iAq
AQ9wOyqKFEhKKkbn+nVg+hQW3L/P25hisjV06sqmfsA0Rx4bYhFoxEvIw3A4x9LsBIIfDpgDsPzS
NICAEhfA7fWXKK6UsOmuq1NZLTDmFe2zEHijVMovzm/qqvHfu7fCt5POlGtLOPZhXGCDZi0v1yiq
VyT7JTUW5P/rcLgzkfyKToozq36lEkXd6VSaLg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T4EV2kKcg5a7rlvEGr4AG3uvv0JzSoc0NQb9aIeE2gsKGq0oLel4q0oZ7eO6He8noW5KEowgkY0O
xDnerk/R4qxdSePYeRRmUg3KZ7hAHVEQrHpQ2RbYwK5mUIpQLjxCWRWzBjeWOce2bh0dAMR/4OH6
t95V8b9VWpgepcUXynGvLDv31tVgr+8LtXlgWTNBiJj2mTZ3gEVxpgGRwMGsampw9yKqBKoR+/hg
++FP8JJkrOSdB2bhnNaD4fZotMLkhYDrWvQm9z6rW7fwxA2oEI+oUqi+K+82oiLzeVWy7FhVyzgS
Y273uSE53DWk35UE9A6ebcI/xUl1iGqwdeZihA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gZRrJLrBkbil4BLf1tia07NzGL28f+Pk9zyPElbTDf8NEXCsuwTum6RjR5lvY/odzAYHlcKxpG+6
gwjafT2OV5gHqqtPXrRHcVU4p5LEzOOl5p3puqvK+1z2+YpHqxOZIIZPIH9kjtzNgcBmcU7S2sFN
zTxyAYuLL9sAN+AIQ9UrW4MXDWxUtdkwPaSyFIvuKoxOKUD5IXEY9NtBpz1zsABMKNHneOO8pAix
qg8S/uQ/XJ8Qggr+vE7HDUUMCsijNXvqbkLM3xf6dXFpOqanKxd6/GfTcob4sezm/hMOZ2xiXcfS
hsYUMRdO9H6fmhECfszoK2XMsMt6xM+vlLywWJ0I6u468qVFxROkf9vL+ZDq/tMiJOm7E1p+HDif
98f5v1OybtzlZJP9bDMwWYcsCqcDejCMQyYOgPCgg+2jTR1JezxuK7PpjyliT0rnu7FfI/0tRzbL
d5YqO79RN0byWVTTdIlTWzL/qBD8BLVqXzWs3M+up46dGPxbkzv44od4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
A79lFm/8JnoMxv1MOWkY+AtU24uc6/CeGf6bjoYWLJXkzzHQooKleg9l+jH7oajoC3oVQh/sMXdi
3QmwZ5SKMt6sb03SC5BW7xPky8zyP6w8FRMCI2Tz1/GhozqjIbgSstUfCaemxIgj3rG7GkRYZ/2k
ualG2mpYDNyaxz1lMYaHfm7stH/IQlkCh6HHMbi7ImYJ6pILa828Ls3VREjo7dtXPS2ZDFxreSIH
2SZ3NpLJO0/umchZaUkt1xN0bsxgtGdOzSqGDpTJrU/ltmclBX199pmrXQa5p/q0FSLj2WkB043l
l3x1Rdipn49DvChkvbVzJP9aej4kwSPhvxHnHQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GFpXmWYmUY46GvuVucUW1VOu3+gGtLxYW4Ho/p4wggZ+jWrpUVhz2RSAxu+ufiLHtM9oYgKPaSYT
DOeuIJGTnxGr20Vh6Nn3cc41TyKAf0vxN2fGISEQQWrjh9OOgNcBmJfaHsSq7+5dhCaIWlGrInVr
GD5TqclLzw6cHAuPGxMi2wD4rq16RkDJnQbPf8ptaskWz81NxZfyWAL4T2E24soybpln8+vuF+72
IQYfLQh/dDDsNHKNKwTKAtGjpFS8eVSbYnS+k3Am4loN8JRflh0+c4yGUo4EkuRzUFiIBrJOKylp
qicgwQw7vdbe+yPl6moUlvA1U2CjJ87bsXk5CA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hzklq501x4qEym07A6+Vh+O6T5Q1srpTjckVi/KQ8/P6I6xpFqHBBikoKASz9mkWuvFaf6aly934
etGfnzZuPuKCoMPixevIcq9cgFblu43p0H0FR4BSbqN+A/K2utwAblPur01qwtH9nc1azxOtPedI
3KLsEBUN2ObidzkZIUbiQlQ72wru0lGZ5uN6iiNcLRnEhqjdjWiOHf5qGo+df2QyP6S5zRR7hGOd
N5h9/9towH2UQ++6hnOd4pjtl7PKHWlU92421M+LhruDkz4Bw6c7d7EVdbIcZ3ub+l/OnCyNwQsr
WUo2E+j4vd3zIVA0gzTA1oLX73BJ1oxwQdO3JA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52544)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
