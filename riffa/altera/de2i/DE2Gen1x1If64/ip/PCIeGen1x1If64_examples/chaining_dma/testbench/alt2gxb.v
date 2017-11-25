////////////////////////////////////////////////////////////////////
//
//   ALT2GXB Parameterized Megafunction
//
//  Copyright (C) 1991-2013 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions  
//  and other software and tools, and its AMPP partner logic  
//  functions, and any output files from any of the foregoing  
//  (including device programming or simulation files), and any  
//  associated documentation or information are expressly subject  
//  to the terms and conditions of the Altera Program License  
//  Subscription Agreement, Altera MegaCore Function License  
//  Agreement, or other applicable license agreement, including,  
//  without limitation, that your use is for the sole purpose of  
//  programming logic devices manufactured by Altera and sold by  
//  Altera or its authorized distributors.  Please refer to the  
//  applicable agreement for further details. 
//  
//  Quartus II 13.1.1 Build 166 11/26/2013 
//
//
//
////////////////////////////////////////////////////////////////////

//************************************************************
// Description:
//
// This module contains alt2gxb megafunction
//************************************************************

// synthesis VERILOG_INPUT_VERSION VERILOG_2001

module alt2gxb (
                rx_datain,
                rx_coreclk,
                rx_cruclk,
                rx_cruclk_alt,
                rx_digitalreset,
                rx_analogreset,
                rx_powerdown,
                rx_enapatternalign,
                rx_bitslip,
                pipe8b10binvpolarity,
                rx_invpolarity,
                rx_revbitorderwa,
                rx_revbyteorderwa,
                rx_enabyteord,
                rx_rmfifordena,
                rx_rmfifowrena,
                rx_phfifordenable,
                rx_phfifowrdisable,
                rx_phfiforeset,
                rx_rmfiforeset,
                rx_seriallpbken,
                rx_a1a2size,
                rx_locktodata,
                rx_locktorefclk,
                tx_datain,
                tx_datainfull,
                tx_ctrlenable, 
                tx_forcedisp,
                tx_dispval,
                tx_detectrxloop,
                tx_forceelecidle,
                tx_forcedispcompliance,
                powerdn,
                tx_phfiforeset,
                tx_invpolarity,
                tx_coreclk,
                tx_digitalreset,
                tx_revparallellpbken,
                gxb_powerdown,
                gxb_enable,
                reconfig_clk,
                pll_inclk,
                pll_inclk_alt,
                pll_inclk_rx_cruclk,
                fixedclk,
                reconfig_togxb,
                aeq_togxb,
                cal_blk_clk,
                cal_blk_powerdown,
                rx_dataout,
                rx_dataoutfull,
                rx_clkout,
                rx_recovclkout,
                rx_pll_locked,
                rx_freqlocked,
                rx_rlv,
                rx_syncstatus,
                rx_a1detect,
                rx_a2detect,
                rx_k1detect,
                rx_k2detect,
                rx_patterndetect,
                rx_ctrldetect,
                rx_errdetect,
                rx_disperr,
                rx_runningdisp,
                rx_rmfifodatainserted,
                rx_rmfifodatadeleted,
                rx_rmfifoempty,
                rx_rmfifofull,
                rx_rmfifoalmostempty,
                rx_rmfifoalmostfull,
                rx_bisterr,
                rx_bistdone,
                rx_a1a2sizeout,
                rx_byteorderalignstatus,
                rx_phfifooverflow,
                rx_phfifounderflow,
                rx_signaldetect,
                debug_rx_phase_comp_fifo_error,
                pipestatus,
                pipedatavalid,
                pipeelecidle,
                pipephydonestatus,
                tx_dataout,
                tx_clkout,
                tx_phfifooverflow,
                tx_phfifounderflow,
                debug_tx_phase_comp_fifo_error,
                reconfig_fromgxb,
                reconfig_fromgxb_oe,
                aeq_fromgxb,
                rx_channelaligned,
                pll_locked,
                pll_locked_alt,
                coreclkout,
                cal_blk_calibrationstatus
                );

// Common parameters
parameter number_of_channels = 1;
parameter operation_mode = "duplex";
parameter loopback_mode = "none";
parameter reverse_loopback_mode = "none";
parameter digitalreset_port_width = number_of_channels;
parameter protocol = "basic";
parameter lpm_hint = "none";
parameter lpm_type = "alt2gxb";
parameter starting_channel_number = 0;
parameter transmitter_termination = "off";
parameter receiver_termination = "off";
parameter enable_fast_recovery_pci_mode = "false";
parameter reconfig_protocol = "basic";
parameter reconfig_dprio_mode = 0;
parameter en_local_clk_div_ctrl = "false";
parameter enable_pll_inclk_drive_rx_cru = "false";
parameter enable_pll_inclk_alt_drive_rx_cru = "false";
parameter intended_device_family = "stratixiigx";
parameter pll_legal_multiplier_list = "disable_4_5_mult_in_6g";

// Parameters applicable for receiver
parameter rx_channel_width = 8;
parameter rx_use_double_data_mode = "false";
parameter rx_use_deserializer_double_data_mode = "false";
parameter rx_cru_inclock_period = 5000;
parameter rx_cru_inclock1_period = 5000;
parameter rx_cru_inclock2_period = 5000;
parameter rx_cru_inclock3_period = 5000;
parameter rx_cru_inclock4_period = 5000;
parameter rx_cru_inclock5_period = 5000;
parameter rx_cru_inclock6_period = 5000;
parameter rx_cru_log_index = 0;
parameter rx_reconfig_clk_scheme = "tx_clk_to_rx";
parameter rx_data_rate = 1000;
parameter rx_data_rate_remainder = 0;
parameter rx_dprio_mode = "none";
parameter rx_use_rising_edge_triggered_pattern_align = "false";
parameter rx_disable_running_disp_in_word_align = "false";
parameter rx_enable_true_complement_match_in_word_align = "false";
parameter rx_bitslip_enable = "false";
parameter rx_align_pattern = "0000000000";
parameter rx_align_pattern_length = 10;
parameter rx_align_loss_sync_error_num = 1;
parameter rx_run_length = 200;
parameter rx_run_length_enable = "true";
parameter rx_allow_align_polarity_inversion = "false";
parameter rx_enable_bit_reversal = "false";
parameter rx_enable_deep_align_byte_swap = "false";
parameter rx_8b_10b_mode = "none";
parameter rx_infiniband_invalid_code = 0;
parameter rx_rate_match_fifo_mode = "none";
parameter rx_rate_match_fifo_mode_manual_control = "normal"; //TSE request: disable RM FIFO in GIGE Mode
parameter rx_rate_match_almost_empty_threshold = 11;
parameter rx_rate_match_almost_full_threshold = 13;
parameter rx_byte_ordering_mode = "none";
parameter rx_byte_order_pattern = "0";
parameter rx_byte_order_pad_pattern = "0";
parameter rx_disable_auto_idle_insertion = "false";
parameter rx_allow_pipe_polarity_inversion = "false";
parameter rx_enable_self_test_mode = "false";
parameter rx_self_test_mode = "incremental";
parameter rx_force_signal_detect = "false";
parameter rx_ppmselect = 32;
parameter rx_bandwidth_mode = 1;
parameter rx_enable_dc_coupling = "false";
parameter rx_signal_detect_threshold = 1;
parameter equalizer_ctrl_a_setting = 7;
parameter equalizer_ctrl_b_setting = 7;
parameter equalizer_ctrl_c_setting = 7;
parameter equalizer_ctrl_d_setting = 7;
parameter equalizer_ctrl_v_setting = 7;
parameter equalizer_dcgain_setting = 0;
parameter rx_adaptive_equalization_mode = "none";
parameter rx_ignore_lock_detect = "false";
parameter rx_enable_lock_to_refclk_sig = "false";
parameter rx_enable_lock_to_data_sig = "false";
parameter rx_use_cruclk = "false";
parameter rx_use_clkout = "true";
parameter rx_use_coreclk = "false";
parameter rx_add_generic_fifo_we_synch_register = "false";
parameter rx_force_freq_det_low = "false";
parameter rx_force_freq_det_high = "false";
parameter rx_use_pipe8b10binvpolarity = "false";
parameter rx_channel_bonding = "indv";
parameter rx_force_signal_detect_dig = "true";
parameter rx_insert_pad_on_underflow = "false";
parameter rx_cru_pre_divide_by = 1;
parameter rx_cruclk_width = number_of_channels;
parameter rx_digitalreset_port_width = digitalreset_port_width;

// Advance parameters for receiver
parameter rx_datapath_protocol = "basic";
parameter rx_use_local_refclk = "false";
parameter rx_rate_match_fifo_write_mux_sel = "auto";
parameter rx_rate_match_fifo_read_mux_sel = "auto";
parameter rx_use_align_state_machine = "false";
parameter rx_num_align_code_groups_in_ordered_set = 0;
parameter rx_rate_match_pattern1 = "0";
parameter rx_rate_match_pattern2 = "0";
parameter rx_use_rate_match_pattern1_only = "false";
parameter rx_rate_match_pattern_size = 10;
parameter rx_rate_match_skip_set_based = "false";
parameter rx_rate_match_back_to_back = "false";
parameter rx_rate_match_ordered_set_based = "false";
parameter rx_use_deskew_fifo = "false";
parameter rx_custom_deskew_pattern = "false";
parameter rx_deskew_pattern = "0";
parameter rx_flip_rx_out = "false";
parameter rx_align_to_deskew_pattern_pos_disp_only= "false";
parameter rx_num_align_cons_good_data = 1;
parameter rx_num_align_cons_pat = 1;
parameter rx_8b_10b_compatibility_mode = "false";
parameter rx_pll_sim_clkout_phase_shift = 0;
parameter rx_common_mode = "0.9V";

// Parameters applicable to transmitter
parameter tx_data_rate = 1000;
parameter tx_reconfig_data_rate = 1000;
parameter tx_data_rate_remainder = 0;
parameter tx_reconfig_data_rate_remainder = 0;
parameter tx_reconfig_clk_scheme = "tx_ch0_clk_source";
parameter tx_channel_width = 8;
parameter tx_dprio_mode = "none";
parameter tx_use_double_data_mode = "false";
parameter tx_use_serializer_double_data_mode = "false";
parameter tx_8b_10b_mode = "none";
parameter tx_force_disparity_mode = "false";
parameter tx_force_kchar = "false";
parameter tx_force_echar = "false";
parameter tx_rxdetect_ctrl = 0;
parameter tx_low_speed_test_select = 0;
parameter tx_allow_polarity_inversion = "false";
parameter tx_enable_symbol_swap = "false";
parameter tx_enable_bit_reversal = "false";
parameter tx_enable_self_test_mode = "false";
parameter tx_enable_idle_selection = "false";
parameter tx_self_test_mode = "incremental";
parameter tx_flip_tx_in = "false";
parameter tx_use_coreclk = "false";
parameter tx_enable_slew_rate = "false";
parameter vod_ctrl_setting = 1;
parameter preemphasis_ctrl_1stposttap_setting = 0;
parameter preemphasis_ctrl_2ndposttap_setting = 0;
parameter preemphasis_ctrl_pretap_setting = 0;
parameter preemphasis_ctrl_2ndposttap_inv_setting = "false";
parameter preemphasis_ctrl_pretap_inv_setting = "false";
parameter tx_common_mode = "0.75V";
parameter tx_analog_power = "1.5V";
parameter tx_channel_bonding = "indv";
parameter tx_refclk_divide_by = 1;
parameter tx_digitalreset_port_width = digitalreset_port_width;

// Advance parameters for transmitter
parameter tx_divider_refclk_select = "auto";
parameter tx_refclk_select = "auto";
parameter tx_transmit_protocol = "basic";
parameter tx_8b_10b_compatibility_mode = "false";
parameter tx_pll_sim_clkout_phase_shift = 0;
parameter tx_pll_reconfig_sim_clkout_phase_shift = 0;
 

// Central management unit parameters
parameter cmu_pll_inclock_period = 5000;
parameter pll_inclk0_inclock_period = 5000;
parameter pll_inclk1_inclock_period = 5000;
parameter pll_inclk2_inclock_period = 5000;
parameter pll_inclk3_inclock_period = 5000;
parameter pll_inclk4_inclock_period = 5000;
parameter pll_inclk5_inclock_period = 5000;
parameter pll_inclk6_inclock_period = 5000;
parameter cmu_clk_div_use_coreclk_out_post_divider = "false";
parameter cmu_pll_loop_filter_resistor_control = 0;
parameter cmu_pll_reconfig_loop_filter_resistor_control = 0;
parameter gen_reconfig_pll = "false";
parameter cmu_pll_reconfig_inclock_period = 5000;
parameter cmu_pll_log_index = 0;
parameter cmu_pll_reconfig_log_index = 0;
parameter cmu_pll_inclk_log_index = 0;
parameter cmu_pll_reconfig_inclk_log_index = 0;
parameter reconfig_pll_inclk_width = 1;
parameter enable_reconfig_pll_inclk_drive_rx = "true";
parameter enable_pll_inclk0_divider = "false";
parameter enable_pll_inclk1_divider = "false";
parameter enable_pll_inclk2_divider = "false";
parameter enable_pll_inclk3_divider = "false";
parameter enable_pll_inclk4_divider = "false";
parameter enable_pll_inclk5_divider = "false";
parameter enable_pll_inclk6_divider = "false";

parameter use_calibration_block = "true";


//Advance parameters for central management unit
parameter cmu_offset_all_errors_align = "false";
parameter cmu_refclk_divider_enable = "auto";
parameter cmu_clk_div_inclk_sel = "auto";
parameter cmu_pll_pfd_clk_select = "auto";
parameter enable_pll_cascade = "false";
parameter enable_reconfig_pll_cascade = "false";
parameter sim_dump_dprio_internal_reg_at_time = 0;
parameter sim_dump_filename = "sim_dprio_dump.txt";

parameter enforce_reconfig_refclk_divider = "auto";
parameter enforce_refclk_divider = "auto";
parameter use_global_clk_divider = "auto";
parameter reconfig_use_global_clk_divider = "auto";

//parameter to control RX PHFIFO bypass
parameter rx_disable_ph_low_latency_mode = "auto";

//Internal parameters
localparam NUM_QUAD_PER_PROT = (operation_mode == "rx")? (((rx_channel_bonding != "x8") && (rx_channel_bonding != "x8_unbundled"))? 1 : 2) :
                               (operation_mode == "tx")?  (((tx_channel_bonding != "x8") && (tx_channel_bonding != "x8_unbundled"))? 1 : 2) :
                               ((tx_channel_bonding != "x8") && (tx_channel_bonding != "x8_unbundled"))? 1 : 2;
localparam NUMBER_CHANNELS_PER_QUAD = 4;
localparam NUMBER_OF_QUADS = ((number_of_channels / NUMBER_CHANNELS_PER_QUAD) <= 0)? 1 :
                             ((number_of_channels % NUMBER_CHANNELS_PER_QUAD) != 0)? (number_of_channels / NUMBER_CHANNELS_PER_QUAD) + 1 : (number_of_channels / NUMBER_CHANNELS_PER_QUAD);
localparam NUMBER_CHANNELS_PER_BI_QUAD = 2 * NUMBER_CHANNELS_PER_QUAD;
localparam NUMBER_OF_BI_QUAD = ((number_of_channels / NUMBER_CHANNELS_PER_BI_QUAD) <= 0)? 1 :
                                ((number_of_channels % NUMBER_CHANNELS_PER_BI_QUAD) != 0)? (number_of_channels / NUMBER_CHANNELS_PER_BI_QUAD) + 1: (number_of_channels / NUMBER_CHANNELS_PER_BI_QUAD);
localparam INT_TX_DWIDTH_FACTOR = ((tx_use_double_data_mode == "true") && (tx_use_serializer_double_data_mode == "true"))? 4:
                                    ((tx_use_double_data_mode == "false") && (tx_use_serializer_double_data_mode == "false"))? 1 :
                                    ((tx_use_double_data_mode == "true") || (tx_use_serializer_double_data_mode == "true"))? 2 : 1;
localparam INT_RX_USE_DESERIALIZER_DOUBLE_DATA_MODE = ((protocol == "gige") || (protocol == "xaui") || (protocol == "pipe"))? "false" : rx_use_deserializer_double_data_mode;
localparam INT_RX_DWIDTH_FACTOR = ((rx_use_double_data_mode == "true") && (INT_RX_USE_DESERIALIZER_DOUBLE_DATA_MODE == "true"))? 4:
                                    ((rx_use_double_data_mode == "false") && (INT_RX_USE_DESERIALIZER_DOUBLE_DATA_MODE == "false"))? 1 :
                                    ((rx_use_double_data_mode == "true") || (INT_RX_USE_DESERIALIZER_DOUBLE_DATA_MODE == "true"))? 2 : 1;
localparam INT_QUAD_BONDED = ((rx_channel_bonding == "x4") || (tx_channel_bonding == "x4") || (rx_channel_bonding == "x4_unbundled") || (tx_channel_bonding == "x4_unbundled"))? "true" : "false" ;
localparam INT_BI_QUAD_BONDED = ((rx_channel_bonding == "x8") || (tx_channel_bonding == "x8") || (rx_channel_bonding == "x8_unbundled") || (tx_channel_bonding == "x8_unbundled"))? "true" : "false" ;
localparam INT_RX_TX_INDV_SAME_DATA_RATE =  ((operation_mode == "rx") || (operation_mode == "tx"))? "true" : 
                                            ((tx_data_rate == rx_data_rate) && (tx_data_rate_remainder == rx_data_rate_remainder))? "true" : 
                                            "false";
localparam INT_MAX_DEVADDR = 32;                                    
localparam TX_SERIALIZATION_FACTOR = (((tx_channel_width == 8) || (tx_channel_width == 16) || (tx_channel_width == 32)) && (tx_8b_10b_mode == "none"))? 8 : 10;
localparam INT_RECONFIG_DPRIO_MODE = ((rx_dprio_mode == "pma_electricals") || (tx_dprio_mode == "pma_electricals"))? 1 : reconfig_dprio_mode;
// Set the pipe internal signals & input from user when it is channel interface reconfiguration mode
localparam INT_TX_RX_PIPE_INTERNAL_SIGNAL = ((protocol == "pipe") || ((INT_RECONFIG_DPRIO_MODE & 4) != 0))? "true" : "false";
localparam INT_RECONFIG_CHANNEL_INTERFACE = ((INT_RECONFIG_DPRIO_MODE & 4) != 0)? "true" : "false";
localparam INT_RECONFIG_CHANNEL_INTERNALS = ((INT_RECONFIG_DPRIO_MODE & 2) != 0)? "true" : "false";
localparam INT_RECONFIG_CMU_PLL_RECONFIG = ((INT_RECONFIG_DPRIO_MODE & 16) != 0)? "true" : "false";
localparam INT_EN_SERIAL_LOOPBACK_CONNECT = ((loopback_mode == "slb") ||  (INT_RECONFIG_CHANNEL_INTERFACE == "true"))? "true" : "false";
localparam INT_IS_OLD_DPRIO_PMA_ELECTRICALS_DESIGN = ((rx_dprio_mode == "pma_electricals") || (tx_dprio_mode == "pma_electricals"))? "true" : "false";
localparam INT_RECONFIG_ANALOG_ONLY = ((INT_RECONFIG_DPRIO_MODE == 1) || (INT_IS_OLD_DPRIO_PMA_ELECTRICALS_DESIGN == "true"))? "true" : "false";
localparam INT_EN_CLOCK_SCHEME = ((INT_RECONFIG_CHANNEL_INTERFACE == "true") || (INT_RECONFIG_CHANNEL_INTERNALS == "true"))? "true" : "false";
localparam INT_RX_CRU_DRIVEN_BY_INPUT_PORT = ((rx_use_cruclk == "true") || (enable_pll_inclk_drive_rx_cru == "true") || (enable_reconfig_pll_inclk_drive_rx == "true"))? "true" : "false";

// Identify the PCI-Express Gen 2
localparam INT_IS_PIPE_GEN_2 = ((protocol == "pipe") && (((tx_data_rate > 2500) && (operation_mode != "rx")) || ((rx_data_rate > 2500) && (operation_mode == "rx"))) && (tx_refclk_divide_by == 1))? "true" : "false";
localparam INT_RECONFIG_IS_PIPE_GEN_2 = ((INT_RECONFIG_DPRIO_MODE != 0) && (INT_RECONFIG_DPRIO_MODE != 1) && (reconfig_protocol == "pipe") && (tx_reconfig_data_rate > 2500))? "true" : "false";

// Reconfigure to PCI-Express Gen 1
localparam INT_RECONFIG_IS_PIPE_GEN_1 = ((INT_RECONFIG_DPRIO_MODE != 0) && (reconfig_protocol == "pipe") && (tx_reconfig_data_rate == 2500))? "true" : "false";

// Transmitter internal parameters
localparam TX_BYTE_SIZE = tx_channel_width/INT_TX_DWIDTH_FACTOR;
localparam INT_ENABLE_REVERSE_PARALLEL_LOOPBACK = (reverse_loopback_mode == "rplb")? "true" : "false";
localparam INT_TX_REFCLK_SELECT = (tx_refclk_select != "auto") ? tx_refclk_select :
                                    (tx_channel_bonding == "indv")? "local" :
                                   (((INT_QUAD_BONDED == "true") || (INT_BI_QUAD_BONDED == "true"))? "cmu_clock_divider" : "local");
localparam INT_TX_SERIALIZER_CLK_SELECT = ((tx_channel_bonding == "x8") || (tx_channel_bonding == "x8_unbundled"))? "analogx8refclk":
                                          ((tx_channel_bonding == "x4") || (tx_channel_bonding == "x4_unbundled"))? "analogx4refclk" : 
                                          ((operation_mode == "duplex") && (INT_RX_CRU_DRIVEN_BY_INPUT_PORT == "false"))? "analogx4refclk" :
                                          ((use_global_clk_divider == "auto") || (use_global_clk_divider == "false"))? "local" : 
                                          (use_global_clk_divider == "true")? "analogx4refclk" : "local";
localparam INT_TX_TRANSMIT_PROTOCOL =  (protocol == "xaui")? "xaui" :
                                       (protocol == "pipe")? "pipe" : tx_transmit_protocol;

localparam INT_TX_DIVIDER_REFCLK_SELECT_PLL_FAST_CLK0 = (tx_divider_refclk_select != "auto")? tx_divider_refclk_select: 
                                                        ((INT_RECONFIG_DPRIO_MODE != 0) && (cmu_pll_log_index == 1))?  "false" : "true";
localparam INT_TX_CHANNEL_BONDING = (tx_channel_bonding == "indv")? "none" :
                                    (tx_channel_bonding == "x4")? "x4" : 
                                    (tx_channel_bonding == "x8")? "x8" : 
                                    (tx_channel_bonding == "x4_unbundled")? "x4_unbundled" : 
                                    (tx_channel_bonding == "x8_unbundled")? "x8_unbundled" : "none";
localparam INT_TX_ENABLE_IDLE_SELECTION = (protocol == "gige")? "true" : tx_enable_idle_selection;
localparam INT_TX_ENC_8B_10B_COMPATIBILITY_MODE =   tx_8b_10b_compatibility_mode;

localparam INT_TX_DISPARITY_MODE = ((protocol == "pipe") || (tx_force_disparity_mode == "true"))? "new" : "none"; 
localparam INT_TX_DISABLE_PH_LOW_LATENCY_MODE = (protocol == "pipe")? "true" : "false";        
localparam INT_TX_IS_BI_QUAD_BONDED = ((tx_channel_bonding == "x8") || (tx_channel_bonding == "x8_unbundled"))? "true" : "false";
localparam INT_TX_IS_QUAD_BONDED = ((tx_channel_bonding == "x4") || (tx_channel_bonding == "x4_unbundled"))? "true" : "false";
localparam INT_TX_EN_REVSERIAL_LPBK = ((reverse_loopback_mode == "precdr_rslb") || (reverse_loopback_mode == "postcdr_rslb") || ((INT_RECONFIG_DPRIO_MODE & 4) != 0))? "true" : "false";                                           
localparam INT_TX_COMMON_MODE = ((tx_common_mode == "0.7V") || (tx_common_mode == "0.75V"))? "0.75V" : tx_common_mode;

// Receiver internal parameters
localparam RX_DESERIALIZATION_FACTOR = (((rx_channel_width == 8) || (rx_channel_width == 16) || (rx_channel_width == 32)) && (rx_8b_10b_mode == "none"))? 8 : 10;
localparam RX_BYTE_SIZE = rx_channel_width/INT_RX_DWIDTH_FACTOR;
localparam INT_RX_DATAPATH_PROTOCOL =  (protocol == "xaui")? "xaui" :
                                       (protocol == "pipe")? "pipe" : rx_datapath_protocol;
localparam INT_RX_ENABLE_DEEP_ALIGN =  ((protocol == "pipe") || (protocol == "gige") || (protocol == "xaui"))? "false" :
                                        (rx_use_deserializer_double_data_mode == "true")? "true" : "false";
localparam INT_RX_ENABLE_DEEP_ALIGN_BYTE_SWAP = (INT_RX_ENABLE_DEEP_ALIGN == "true")? rx_enable_deep_align_byte_swap : "false";
localparam INT_RX_ENABLE_TRUE_COMPLEMENT_MATCH_WORD_ALIGN = ((protocol == "xaui") || (protocol == "gige"))? "false" : rx_enable_true_complement_match_in_word_align;
localparam INT_RX_USE_ALIGN_STATE_MACHINE = ((protocol == "xaui") || (protocol == "pipe") || (protocol == "gige")|| (protocol == "5g_scrambled") || (protocol == "cei_6g"))? "true" : 
                                            rx_use_align_state_machine;
localparam INT_RX_ALIGN_PATTERN = (protocol == "pipe")? "0101111100" :
                                  (protocol == "cei_6g")? "0000000000000000" : rx_align_pattern;
localparam INT_RX_ALIGN_PATTERN_LENGTH =    (protocol == "pipe")? 10 : 
                                            (protocol == "cei_6g")? 16 : rx_align_pattern_length;                                             
localparam INT_RX_NUM_ALIGN_CODE_GROUPS_IN_ORDERED_SET = (protocol == "gige")? 1 : 
                                                          ((protocol == "xaui") || (protocol == "sonet") || (protocol == "pipe") || (protocol == "5g_scrambled"))? 0 : rx_num_align_code_groups_in_ordered_set;
localparam INT_RX_8B_10B_MODE =  ((protocol == "xaui") || (protocol == "gige"))? "normal" : rx_8b_10b_mode;
localparam INT_RX_DEC_8B_10B_COMPAT_MODE = rx_8b_10b_compatibility_mode;

localparam INT_RX_RATE_MATCH_FIFO_MODE = ((protocol == "xaui") || (protocol == "gige"))? ((rx_rate_match_fifo_mode_manual_control == "none" && protocol == "gige")? "none" : "normal") : rx_rate_match_fifo_mode;
localparam INT_RX_USE_RATE_MATCH_PATTERN1_ONLY = ((protocol == "xaui") ||(protocol == "gige")) ? "false" : rx_use_rate_match_pattern1_only;
localparam INT_RX_RATE_MATCH_PATTERN1 = (protocol == "xaui")? "00000000001101000011" : rx_rate_match_pattern1;
localparam INT_RX_RATE_MATCH_PATTERN2 = (protocol == "xaui")? "00000000000010111100": rx_rate_match_pattern2;
localparam INT_RATE_MATCH_SKIP_SET_BASED = ((protocol == "pipe") || (protocol == "3g_basic") || (protocol == "cpri"))? "true" : 
                                            ((protocol == "xaui") || (protocol == "gige") || (protocol == "sonet"))? "false" : rx_rate_match_skip_set_based; 
localparam INT_RATE_MATCH_BACK_TO_BACK =    ((protocol == "pipe") || (protocol == "sonet") || (protocol == "cei_6g"))? "false" :
                                            ((protocol == "xaui") || (protocol == "gige") || (protocol == "3g_basic") || (protocol == "cpri") || (rx_rate_match_fifo_mode_manual_control == "none" && protocol == "gige"))? "true" : rx_rate_match_back_to_back;
localparam INT_RX_RATE_MATCH_ORDERED_SET_BASED =  (protocol == "gige")? "true" : rx_rate_match_ordered_set_based;
localparam INT_RX_RATE_MATCH_PATTERN_SIZE = (INT_RX_RATE_MATCH_ORDERED_SET_BASED  == "true")? 20 : rx_rate_match_pattern_size;
localparam INT_RX_NUM_ALIGN_CONS_GOOD_DATA =    ((protocol == "xaui") || (protocol == "gige"))? 4 :
                                                ((protocol == "cei_6g") || (protocol == "sonet") || (protocol == "5g_scrambled"))? 1 :
                                                (protocol == "pipe")? 16 : rx_num_align_cons_good_data;
localparam INT_RX_NUM_ALIGN_CONS_PAT = ((protocol == "xaui") || (protocol == "pipe"))? 4 : 
                                        (protocol == "gige")? 3 : 
                                        (protocol == "sonet") || (protocol == "cei_6g")? 1 : rx_num_align_cons_pat;                                                 
localparam INT_RX_ALIGN_LOSS_SYNC_ERROR_NUM = ((protocol == "xaui") || (protocol == "gige"))? 4 : 
                                               ((protocol == "pipe") || (protocol == "cei_6g"))? 1 : rx_align_loss_sync_error_num ;
localparam INT_RX_USE_PARALLEL_LOOPBACK = (loopback_mode == "plb")? "true" : "false";
localparam INT_RX_WORD_ALIGNER_NUM_BYTE = (rx_use_deserializer_double_data_mode == "true")? 2 : 1;
localparam INT_RX_DESKEW_PATTERN = (protocol == "xaui")? "0011000011" : ((rx_custom_deskew_pattern == "true")? rx_deskew_pattern : "0");
localparam INT_RX_DISALLOW_KCHAR_AFTER_PATTERN_ORDERED_SET = ((protocol == "xaui")|| (protocol == "gige"))? "false" : "false";
localparam INT_RX_DISABLE_PH_LOW_LATENCY_MODE = (rx_disable_ph_low_latency_mode != "auto")? rx_disable_ph_low_latency_mode : 
                                                (protocol == "pipe")? "true" : "false";
localparam INT_RX_CHANNEL_BONDING = (rx_channel_bonding == "indv")? "none" :
                                    (rx_channel_bonding == "x4")? "x4" : 
                                    (rx_channel_bonding == "x8")? "x8" :
                                    (rx_channel_bonding == "x4_unbundled")? "x4_unbundled" :
                                    (rx_channel_bonding == "x8_unbundled")? "x8_unbundled" : "none";
localparam INT_RX_DETECT_BYPASS = "false";     
localparam INT_RX_EQ_ADAPT_SEG_CONTROL = 3;
localparam INT_RX_EQ_MAX_GRADIENT_CONTROL = 7;   
localparam INT_RX_ENABLE_BIT_REVERSAL = ((rx_enable_bit_reversal == "true") || ((INT_RECONFIG_CHANNEL_INTERFACE == "true") || (INT_RECONFIG_CHANNEL_INTERNALS == "true")))? "true" : "false";
localparam INT_RX_EN_INVPOLARITY = ((rx_allow_align_polarity_inversion == "true") || (INT_RECONFIG_CHANNEL_INTERFACE == "true"))? "true" : "false";
localparam INT_RX_EN_PIPE8B10BINVPOLARITY_CONNECT = ((rx_use_pipe8b10binvpolarity == "true") || (INT_RECONFIG_CHANNEL_INTERFACE == "true"))? "true" : "false";
localparam INT_RX_EN_BYTEORD_CONNECT = ((rx_byte_ordering_mode == "pattern-based") || (INT_RECONFIG_CHANNEL_INTERFACE == "true"))?  "true" : "false";
localparam INT_RX_EN_A1A2SIZE_CONNECT = (((rx_use_deserializer_double_data_mode == "false") && (RX_DESERIALIZATION_FACTOR == 8)) || (INT_RECONFIG_CHANNEL_INTERFACE == "true"))? "true" : "false";

//Clock selection mux
localparam INT_RX_RECOVERED_CLK_MUX_SELECT = (protocol != "custom")? ((loopback_mode == "plb")? "local_refclk" : "recvd_clk") :
                                             (rx_use_local_refclk == "true")? "local_refclk" : "recvd_clk";
localparam INT_RX_CLK1_MUX_SELECT = (rx_rate_match_fifo_write_mux_sel != "auto")? rx_rate_match_fifo_write_mux_sel :
                                    (loopback_mode == "plb")? "local_refclk" :
                                    (protocol == "xaui")? "master_clk" :
                                    ((rx_use_deskew_fifo == "false")? INT_RX_RECOVERED_CLK_MUX_SELECT : "recvd_clk");
localparam INT_RX_CLK2_MUX_SELECT = (rx_rate_match_fifo_read_mux_sel != "auto")? rx_rate_match_fifo_read_mux_sel :
                                    ((rx_rate_match_fifo_mode == "none" || (rx_rate_match_fifo_mode_manual_control == "none" && protocol == "gige")) && (INT_RX_CLK1_MUX_SELECT != "master_clk"))?  INT_RX_CLK1_MUX_SELECT : 
                                    (((INT_QUAD_BONDED == "true") || (INT_BI_QUAD_BONDED == "true"))? "digital_refclk": "local_refclk");
localparam INT_RX_RD_CLK_MUX_SELECT = (rx_enable_self_test_mode == "true")? "int_clk" : "core_clk";

localparam INT_RX_ALLOW_SERIAL_LOOPBACK = (loopback_mode == "slb")? "true" : "false";
localparam INT_RX_SIGNAL_DETECT_THRESHOLD = rx_signal_detect_threshold;
localparam INT_IS_ANALOG_OLD_DESIGN = ((rx_dprio_mode == "pma_electricals") || (tx_dprio_mode == "pma_electricals"))? "true" : "false";
localparam INT_RX_USE_LOCALREFCLK = ((INT_RX_TX_INDV_SAME_DATA_RATE == "true") && (rx_rate_match_fifo_mode != "none") && (INT_RX_CLK2_MUX_SELECT == "local_refclk"))? (protocol == "gige" && rx_rate_match_fifo_mode_manual_control == "none")? "false" : "true" :
                                    (loopback_mode == "plb")? "true" :
                                    (INT_EN_CLOCK_SCHEME == "true")? "true" : "false";
localparam INT_RX_PIPEX1_NO_RATE_MATCH_FIFO = ((rx_rate_match_fifo_mode == "none") && (protocol == "pipe") && (rx_channel_bonding == "indv"))? "true" : "false";

localparam MAX_PLL_INCLK = 8;
// Search through the refclk divider enable parameters for the CMU PLL reconfig_pll_inclk's refclk divider and
// obtain the index. This is only for CMU PLL reconfiguration refclk divider generation
localparam INT_RECONFIG_PLL_REFCLK_DIV0_INDEX = (enable_pll_inclk0_divider == "true")? 0 :
                                                (enable_pll_inclk1_divider == "true")? 1 :
                                                (enable_pll_inclk2_divider == "true")? 2 :
                                                (enable_pll_inclk3_divider == "true")? 3 :
                                                (enable_pll_inclk4_divider == "true")? 4 :
                                                (enable_pll_inclk5_divider == "true")? 5 :
                                                (enable_pll_inclk6_divider == "true")? 6 : 7;
localparam INT_RECONFIG_PLL_REFCLK_DIV1_INDEX = (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == 7)? 7 :
                                                ((enable_pll_inclk1_divider == "true") && (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == 0))? 1 :
                                                ((enable_pll_inclk2_divider == "true") && (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX <= 1))? 2 :
                                                ((enable_pll_inclk3_divider == "true") && (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX <= 2))? 3 :
                                                ((enable_pll_inclk4_divider == "true") && (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX <= 3))? 4 :
                                                ((enable_pll_inclk5_divider == "true") && (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX <= 4))? 5 :
                                                ((enable_pll_inclk6_divider == "true") && (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX <= 5))? 6 : 7;
localparam INT_RECONFIG_PLL_CLKIN_REFCLK_DIV0_EN = (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX != 7)? "true" : "false"; 

localparam INT_CMU_PLL_DATA_RATE = (operation_mode == "rx")? rx_data_rate : tx_data_rate;
localparam INT_CMU_PLL_DATA_RATE_REMAINDER = (operation_mode == "rx")? rx_data_rate_remainder : tx_data_rate_remainder;
localparam INT_CMU_PLL_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? cmu_pll_inclock_period :
                                        (cmu_pll_inclk_log_index == 0)? pll_inclk0_inclock_period :
                                        (cmu_pll_inclk_log_index == 1)? pll_inclk1_inclock_period :
                                        (cmu_pll_inclk_log_index == 2)? pll_inclk2_inclock_period :
                                        (cmu_pll_inclk_log_index == 3)? pll_inclk3_inclock_period :
                                        (cmu_pll_inclk_log_index == 4)? pll_inclk4_inclock_period :
                                        (cmu_pll_inclk_log_index == 5)? pll_inclk5_inclock_period :
                                        (cmu_pll_inclk_log_index == 6)? pll_inclk6_inclock_period : cmu_pll_inclock_period;
localparam real INT_CMU_PLL_MULTIPLICATION = (((((INT_CMU_PLL_DATA_RATE * 100.0) + (INT_CMU_PLL_DATA_RATE_REMAINDER/10000)) * INT_CMU_PLL_INCLOCK_PERIOD)/ 1000000)) / 200.0;
localparam integer INT_CMU_PLL_MULT_ROUNDED = INT_CMU_PLL_MULTIPLICATION;
localparam real INT_TX_CLK_DIVIDER_DIV_DIF = (INT_CMU_PLL_MULT_ROUNDED < INT_CMU_PLL_MULTIPLICATION)? (INT_CMU_PLL_MULTIPLICATION - INT_CMU_PLL_MULT_ROUNDED + 0.0) :
                                          (INT_CMU_PLL_MULT_ROUNDED - INT_CMU_PLL_MULTIPLICATION + 0.0);
localparam real INT_TX_ADJUSTED_CLK_DIVIDER_DIV_DIF = ((INT_TX_CLK_DIVIDER_DIV_DIF < 0.125) || (INT_TX_CLK_DIVIDER_DIV_DIF >= 0.75))? 0 :
                                             ((INT_TX_CLK_DIVIDER_DIV_DIF >= 0.125) && (INT_TX_CLK_DIVIDER_DIV_DIF < 0.1875))? 0.125 :
                                             ((INT_TX_CLK_DIVIDER_DIV_DIF > 0.1875) && (INT_TX_CLK_DIVIDER_DIV_DIF <= 0.375))? 0.25 :
                                             ((INT_TX_CLK_DIVIDER_DIV_DIF > 0.375) && (INT_TX_CLK_DIVIDER_DIV_DIF < 0.75))? 0.5 : 0;
localparam integer INT_TX_REFCLK_DIVIDE_BY = (tx_channel_bonding != "indv")? 1 :
                                            (((INT_CMU_PLL_MULT_ROUNDED == 2) && (INT_TX_ADJUSTED_CLK_DIVIDER_DIV_DIF == 0)) || ((INT_TX_ADJUSTED_CLK_DIVIDER_DIV_DIF == 0.5) && (INT_CMU_PLL_MULTIPLICATION <= 12.5)))? 2 :
                                            (INT_TX_ADJUSTED_CLK_DIVIDER_DIV_DIF == 0.25)? 4:
                                            (INT_TX_ADJUSTED_CLK_DIVIDER_DIV_DIF == 0.125)? 4 : 1;
// Indicates whether the reconfig_pll_clkin for the current selected source needs refclk divider or not for
// CMU PLL reconfiguration(first PLL)
localparam INT_SELECTED_CLK_SOURCE = (operation_mode == "rx")? rx_cru_log_index : cmu_pll_inclk_log_index;
localparam INT_CMU_PLL_REFCLK_DIV_OTHER_IS_SEL_CLK =    (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX == 7)? 7 :
                                                        (INT_SELECTED_CLK_SOURCE <= INT_RECONFIG_PLL_REFCLK_DIV1_INDEX)? 7 :
                                                        (((INT_SELECTED_CLK_SOURCE == 2) && (enable_pll_inclk2_divider == "true")) ||
                                                        ((INT_SELECTED_CLK_SOURCE == 3) && (enable_pll_inclk3_divider == "true")) ||
                                                        ((INT_SELECTED_CLK_SOURCE == 4) && (enable_pll_inclk4_divider == "true")) ||
                                                        ((INT_SELECTED_CLK_SOURCE == 5) && (enable_pll_inclk5_divider == "true")) ||
                                                        ((INT_SELECTED_CLK_SOURCE == 6) && (enable_pll_inclk6_divider == "true")))? cmu_pll_inclk_log_index : 7;
localparam INT_CMU_PLL_CLKIN_NEED_DIV = ((INT_RECONFIG_PLL_REFCLK_DIV1_INDEX != 7) && (cmu_pll_inclk_log_index == INT_RECONFIG_PLL_REFCLK_DIV1_INDEX))? "true" : 
                                        ((INT_RECONFIG_PLL_REFCLK_DIV0_INDEX != 7) && (cmu_pll_inclk_log_index == INT_RECONFIG_PLL_REFCLK_DIV0_INDEX))? "true" : 
                                        (INT_CMU_PLL_REFCLK_DIV_OTHER_IS_SEL_CLK != 7)? "true" : "false";
localparam INT_CMU_PLL_EN_4_5_MULT_6G = ((pll_legal_multiplier_list == "disable_4_5_mult_above_3125") && (INT_CMU_PLL_DATA_RATE <= 3125))? "true" : "false";                                 
localparam INT_CMU_PLL_M_NEED_REFCLK_DIV = ((tx_use_serializer_double_data_mode == "false") && (((INT_CMU_PLL_MULT_ROUNDED == 13) && (INT_TX_CLK_DIVIDER_DIV_DIF <= 0.5)) || ((INT_CMU_PLL_MULT_ROUNDED == 3) && (INT_TX_CLK_DIVIDER_DIV_DIF <= 0.5)) || (INT_CMU_PLL_MULT_ROUNDED == 2)))? "true" :
                                           ((tx_use_serializer_double_data_mode == "true") && (((INT_CMU_PLL_MULT_ROUNDED == 13) && (INT_TX_CLK_DIVIDER_DIV_DIF <= 0.5)) || (((INT_CMU_PLL_MULT_ROUNDED == 4) || (INT_CMU_PLL_MULT_ROUNDED == 5)) && (INT_CMU_PLL_EN_4_5_MULT_6G == "false"))))? "true" :
                                           (((((INT_CMU_PLL_MULT_ROUNDED == 13)  || (INT_CMU_PLL_MULT_ROUNDED == 12)) && (INT_TX_CLK_DIVIDER_DIV_DIF <= 0.5)) || (INT_CMU_PLL_MULT_ROUNDED == 2) || ((INT_CMU_PLL_MULT_ROUNDED == 3) && (INT_TX_CLK_DIVIDER_DIV_DIF <= 0.5))) && (en_local_clk_div_ctrl == "true"))?  "true" : "false";                                        
localparam INT_CMU_PLL_NEED_REFCLK_DIV =    (INT_RECONFIG_CMU_PLL_RECONFIG == "true")? INT_CMU_PLL_CLKIN_NEED_DIV :
                                            (enforce_refclk_divider == "true")? "true" : 
                                            (enforce_refclk_divider == "false")? "false" :
                                            ((INT_IS_PIPE_GEN_2 == "true") || (INT_RECONFIG_IS_PIPE_GEN_2 == "true"))? "false" :
                                            ((INT_TX_SERIALIZER_CLK_SELECT == "local") && (tx_channel_bonding == "indv") && (protocol != "pipe"))? 
                                            ((INT_TX_CLK_DIVIDER_DIV_DIF == 0.125)? "true" : 
                                            ((protocol == "sonet") && (cmu_pll_inclock_period < 3205) && (INT_TX_REFCLK_DIVIDE_BY == 2)) ? "true" :
                                            ((cmu_pll_inclock_period < 3076) && ((INT_RECONFIG_CHANNEL_INTERFACE == "true") || (INT_RECONFIG_CHANNEL_INTERNALS == "true") || (INT_RECONFIG_CMU_PLL_RECONFIG == "true") || ((protocol != "3g_basic") && (protocol != "cpri") && (protocol != "6g_basic") && (INT_RECONFIG_DPRIO_MODE == 0))))? "true" : INT_CMU_PLL_M_NEED_REFCLK_DIV):
                                            ((INT_CMU_PLL_MULTIPLICATION == 12.5) || (INT_CMU_PLL_MULTIPLICATION == 2) || ((cmu_pll_inclock_period < 3076) && (protocol != "3g_basic") && (protocol != "cpri") && (protocol != "6g_basic")))? "true" : INT_CMU_PLL_M_NEED_REFCLK_DIV; 
localparam integer INT_REQUIRED_TX_REFCLK_DIVIDE_BY = ((protocol == "pipe") && (INT_TX_REFCLK_DIVIDE_BY != 1))? (INT_TX_REFCLK_DIVIDE_BY / 2) :  
                                                      ((protocol == "sonet") && (INT_TX_REFCLK_DIVIDE_BY == 2)) ? 1 : 
                                                      ((INT_CMU_PLL_NEED_REFCLK_DIV == "true") && (INT_TX_REFCLK_DIVIDE_BY > 1))? (INT_TX_REFCLK_DIVIDE_BY / 2) : INT_TX_REFCLK_DIVIDE_BY;
localparam integer INT_CMU_PLL_ADJUSTED_MULT_VALUE = (tx_channel_bonding == "indv")? ((INT_CMU_PLL_NEED_REFCLK_DIV == "true")? (INT_REQUIRED_TX_REFCLK_DIVIDE_BY * INT_CMU_PLL_MULTIPLICATION * 2) : INT_REQUIRED_TX_REFCLK_DIVIDE_BY * INT_CMU_PLL_MULTIPLICATION) : 
                                                    (INT_CMU_PLL_NEED_REFCLK_DIV == "true")? (INT_CMU_PLL_MULTIPLICATION * 2) : INT_CMU_PLL_MULTIPLICATION;
localparam INT_IS_VALID_CMU_PLL_MULT_VALUE =    (INT_CMU_PLL_ADJUSTED_MULT_VALUE == 1) ||(INT_CMU_PLL_ADJUSTED_MULT_VALUE == 4)||(INT_CMU_PLL_ADJUSTED_MULT_VALUE == 5) || (INT_CMU_PLL_ADJUSTED_MULT_VALUE == 8) ||
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE == 10) || (INT_CMU_PLL_ADJUSTED_MULT_VALUE  == 16) || (INT_CMU_PLL_ADJUSTED_MULT_VALUE  == 20) ||
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE == 25)? "true" : "false";                                                
localparam integer INT_CMU_PLL_MULTIPLY_BY =   (INT_IS_VALID_CMU_PLL_MULT_VALUE == "true")? INT_CMU_PLL_ADJUSTED_MULT_VALUE :
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE < 1)? 1 :
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE < 4)? 4 :
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE < 7)? 5 :
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE < 8)? 8 :
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE < 10)? 10 :
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE < 13)? 10 :
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE < 19)? 16 :
                                                (INT_CMU_PLL_ADJUSTED_MULT_VALUE < 22)? 25 : INT_CMU_PLL_ADJUSTED_MULT_VALUE;

// Setting up the secondary PLL for reconfiguration
localparam INT_CMU_PLL_RECONFIG_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? cmu_pll_reconfig_inclock_period :
                                                (cmu_pll_reconfig_inclk_log_index == 0)? pll_inclk0_inclock_period :
                                                (cmu_pll_reconfig_inclk_log_index == 1)? pll_inclk1_inclock_period :
                                                (cmu_pll_reconfig_inclk_log_index == 2)? pll_inclk2_inclock_period :
                                                (cmu_pll_reconfig_inclk_log_index == 3)? pll_inclk3_inclock_period :
                                                (cmu_pll_reconfig_inclk_log_index == 4)? pll_inclk4_inclock_period :
                                                (cmu_pll_reconfig_inclk_log_index == 5)? pll_inclk5_inclock_period :
                                                (cmu_pll_reconfig_inclk_log_index == 6)? pll_inclk6_inclock_period : cmu_pll_reconfig_inclock_period;
localparam real INT_CMU_PLL_RECONFIG_MULTIPLICATION = (((((tx_reconfig_data_rate * 100.0) + (tx_reconfig_data_rate_remainder/10000)) * INT_CMU_PLL_RECONFIG_INCLOCK_PERIOD)/ 1000000)) / 200.0;
localparam integer INT_CMU_PLL_RECONFIG_MULT_ROUNDED = INT_CMU_PLL_RECONFIG_MULTIPLICATION;
localparam real INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF = (INT_CMU_PLL_RECONFIG_MULT_ROUNDED < INT_CMU_PLL_RECONFIG_MULTIPLICATION)? (INT_CMU_PLL_RECONFIG_MULTIPLICATION - INT_CMU_PLL_RECONFIG_MULT_ROUNDED + 0.0) :
                                          (INT_CMU_PLL_RECONFIG_MULT_ROUNDED - INT_CMU_PLL_RECONFIG_MULTIPLICATION + 0.0);
localparam real INT_TX_RECONFIG_ADJUSTED_CLK_DIVIDER_DIV_DIF = ((INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF < 0.125) || (INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF >= 0.75))? 0 :
                                             ((INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF >= 0.125) && (INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF < 0.1875))? 0.125 :
                                             ((INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF > 0.1875) && (INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF <= 0.375))? 0.25 :
                                             ((INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF > 0.375) && (INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF < 0.75))? 0.5 : 0;
localparam integer INT_TX_RECONFIG_REFCLK_DIVIDE_BY = (tx_channel_bonding != "indv")? 1 :
                                            (((INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 2) && (INT_TX_RECONFIG_ADJUSTED_CLK_DIVIDER_DIV_DIF == 0)) || ((INT_TX_RECONFIG_ADJUSTED_CLK_DIVIDER_DIV_DIF == 0.5) && (INT_CMU_PLL_RECONFIG_MULTIPLICATION <= 12.5)))? 2 :
                                            (INT_TX_RECONFIG_ADJUSTED_CLK_DIVIDER_DIV_DIF == 0.25)? 4:
                                            (INT_TX_RECONFIG_ADJUSTED_CLK_DIVIDER_DIV_DIF == 0.125)? 4 : 1;
// Indicates whether the reconfig_pll_clkin for the current selected source needs refclk divider or not for
// CMU PLL reconfiguration(2nd PLL)
localparam INT_CMU_PLL_RECONFIG_REFCLK_DIV_OTHER_IS_SEL_CLK = (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX == 7)? 7 :
                                                        (cmu_pll_reconfig_inclk_log_index <= INT_RECONFIG_PLL_REFCLK_DIV1_INDEX)? 7 :
                                                        (((cmu_pll_reconfig_inclk_log_index == 2) && (enable_pll_inclk2_divider == "true")) ||
                                                        ((cmu_pll_reconfig_inclk_log_index == 3) && (enable_pll_inclk3_divider == "true")) ||
                                                        ((cmu_pll_reconfig_inclk_log_index == 4) && (enable_pll_inclk4_divider == "true")) ||
                                                        ((cmu_pll_reconfig_inclk_log_index == 5) && (enable_pll_inclk5_divider == "true")) ||
                                                        ((cmu_pll_reconfig_inclk_log_index == 6) && (enable_pll_inclk6_divider == "true")))? cmu_pll_reconfig_inclk_log_index : 7;

localparam INT_CMU_PLL_RECONFIG_PLL_CLKIN_NEED_DIV = ((INT_RECONFIG_PLL_REFCLK_DIV1_INDEX != 7) && (cmu_pll_reconfig_inclk_log_index == INT_RECONFIG_PLL_REFCLK_DIV1_INDEX))? "true" : 
                                                     ((INT_RECONFIG_PLL_REFCLK_DIV0_INDEX != 7) && (cmu_pll_reconfig_inclk_log_index == INT_RECONFIG_PLL_REFCLK_DIV0_INDEX))? "true" : 
                                                     (INT_CMU_PLL_RECONFIG_REFCLK_DIV_OTHER_IS_SEL_CLK != 7)? "true" : "false";
localparam INT_CMU_PLL_RECONFIG_EN_4_5_MULT_6G = ((pll_legal_multiplier_list == "disable_4_5_mult_above_3125") && (tx_reconfig_data_rate <= 3125))? "true" : "false";                                 
localparam INT_CMU_PLL_RECONFIG_M_NEED_REFCLK_DIV = (((reconfig_protocol == "3g_basic") || (reconfig_protocol == "cpri")) && (((INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 13) && (INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF <= 0.5)) || ((INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 3) && (INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF <= 0.5)) || (INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 2)))? "true" :
                                                    ((reconfig_protocol == "6g_basic") && (((INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 13) && (INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF <= 0.5)) || (((INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 4) || (INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 5)) && (INT_CMU_PLL_RECONFIG_EN_4_5_MULT_6G == "false"))))? "true" :
                                                    ((reconfig_protocol == "cei_6g") && (INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 5))? "true" : 
                                                    (((((INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 13) || (INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 12)) && (INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF <= 0.5)) || (INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 2) || ((INT_CMU_PLL_RECONFIG_MULT_ROUNDED == 3) && (INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF <= 0.5))) && (en_local_clk_div_ctrl == "true"))? "true" : "false";                                        
localparam INT_CMU_PLL_RECONFIG_NEED_REFCLK_DIV =   ((INT_RECONFIG_DPRIO_MODE == 0) || (INT_IS_OLD_DPRIO_PMA_ELECTRICALS_DESIGN == "true")) ? "false" : ((INT_RECONFIG_IS_PIPE_GEN_1 == "true") && (rx_cru_pre_divide_by == 1) && (INT_IS_PIPE_GEN_2 == "true")) ? "false" : (INT_RECONFIG_CMU_PLL_RECONFIG == "true")? INT_CMU_PLL_RECONFIG_PLL_CLKIN_NEED_DIV :
                                                   (gen_reconfig_pll == "false")? "false" :
                                                    (enforce_reconfig_refclk_divider == "true")? "true" : 
                                                    (enforce_reconfig_refclk_divider == "false")? "false" :
                                                    ((INT_RECONFIG_IS_PIPE_GEN_2 == "true"))? "false" :
                                                    ((tx_channel_bonding == "indv") && (reconfig_protocol != "pipe"))? 
                                                    ((INT_TX_RECONFIG_CLK_DIVIDER_DIV_DIF == 0.125)? "true" : 
                                                    ((reconfig_protocol == "sonet") && (cmu_pll_reconfig_inclock_period < 3205) && (INT_TX_RECONFIG_REFCLK_DIVIDE_BY == 2)) ? "true" :
                                                    ((cmu_pll_reconfig_inclock_period < 3076) && ((INT_RECONFIG_CHANNEL_INTERFACE == "true") || (INT_RECONFIG_CHANNEL_INTERNALS == "true") || (INT_RECONFIG_CMU_PLL_RECONFIG == "true") || ((reconfig_protocol != "3g_basic") && (reconfig_protocol != "cpri") && (reconfig_protocol != "6g_basic") && (INT_RECONFIG_DPRIO_MODE == 0))))? "true" : INT_CMU_PLL_RECONFIG_M_NEED_REFCLK_DIV):
                                                    ((INT_CMU_PLL_RECONFIG_MULTIPLICATION == 12.5) || ((cmu_pll_reconfig_inclock_period < 3076) && (reconfig_protocol != "3g_basic") && (reconfig_protocol != "cpri") && (reconfig_protocol != "6g_basic")) || (INT_CMU_PLL_RECONFIG_MULTIPLICATION == 2))? "true" : INT_CMU_PLL_RECONFIG_M_NEED_REFCLK_DIV; 
localparam integer INT_REQUIRED_TX_RECONFIG_REFCLK_DIVIDE_BY = ((reconfig_protocol == "pipe") && (INT_TX_RECONFIG_REFCLK_DIVIDE_BY != 1))? (INT_TX_RECONFIG_REFCLK_DIVIDE_BY / 2) :  
                                                                ((reconfig_protocol == "sonet") && (INT_TX_RECONFIG_REFCLK_DIVIDE_BY == 2)) ? 1 : 
                                                                ((INT_CMU_PLL_RECONFIG_NEED_REFCLK_DIV == "true") && (INT_TX_RECONFIG_REFCLK_DIVIDE_BY > 1))? (INT_TX_RECONFIG_REFCLK_DIVIDE_BY / 2) : INT_TX_RECONFIG_REFCLK_DIVIDE_BY;
localparam integer INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE =    (tx_channel_bonding == "indv")? ((INT_CMU_PLL_RECONFIG_NEED_REFCLK_DIV == "true")? (INT_REQUIRED_TX_RECONFIG_REFCLK_DIVIDE_BY  * INT_CMU_PLL_RECONFIG_MULTIPLICATION * 2) : INT_REQUIRED_TX_RECONFIG_REFCLK_DIVIDE_BY  * INT_CMU_PLL_RECONFIG_MULTIPLICATION) : 
                                                (INT_CMU_PLL_RECONFIG_NEED_REFCLK_DIV == "true")? (INT_CMU_PLL_RECONFIG_MULTIPLICATION * 2) : INT_CMU_PLL_RECONFIG_MULTIPLICATION;
localparam INT_IS_VALID_CMU_PLL_RECONFIG_MULT_VALUE =    (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE == 1) ||(INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE == 4)||(INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE == 5) || (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE == 8) ||
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE == 10) || (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE  == 16) || (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE  == 20) ||
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE == 25)? "true" : "false";                                                
localparam integer INT_CMU_PLL_RECONFIG_MULTIPLY_BY =   (INT_IS_VALID_CMU_PLL_RECONFIG_MULT_VALUE == "true")? INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE :
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE < 1)? 1 :
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE < 4)? 4 :
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE < 7)? 5 :
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE < 8)? 8 :
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE < 10)? 10 :
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE < 13)? 10 :
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE < 19)? 16 :
                                                (INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE < 22)? 25 : INT_CMU_PLL_RECONFIG_ADJUSTED_MULT_VALUE;  

localparam INT_CMU_CLK_DIV_DIVIDE_BY = ((operation_mode == "rx") && (INT_RX_CRU_DRIVEN_BY_INPUT_PORT == "false"))? ((RX_DESERIALIZATION_FACTOR == 8)? 4 : 5):
                                       (TX_SERIALIZATION_FACTOR == 8)? 4 : 5;
localparam INT_CRU_RECONFIG_PLL_INCLOCK_PERIOD =  (rx_cru_log_index == 0)? pll_inclk0_inclock_period :
                                                  (rx_cru_log_index == 1)? pll_inclk1_inclock_period :
                                                  (rx_cru_log_index == 2)? pll_inclk2_inclock_period :
                                                  (rx_cru_log_index == 3)? pll_inclk3_inclock_period :
                                                  (rx_cru_log_index == 4)? pll_inclk4_inclock_period :
                                                  (rx_cru_log_index == 5)? pll_inclk5_inclock_period :
                                                  (rx_cru_log_index == 6)? pll_inclk6_inclock_period : cmu_pll_reconfig_inclock_period;
localparam INT_CRU_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "true")? INT_CRU_RECONFIG_PLL_INCLOCK_PERIOD :
                                    (INT_RX_CRU_DRIVEN_BY_INPUT_PORT == "true")? ((enable_pll_inclk_drive_rx_cru == "true")? INT_CMU_PLL_INCLOCK_PERIOD : rx_cru_inclock_period ):
                                    (INT_CMU_PLL_NEED_REFCLK_DIV == "true")? (cmu_pll_inclock_period * INT_CMU_CLK_DIV_DIVIDE_BY / INT_CMU_PLL_MULTIPLY_BY) * 2 : (cmu_pll_inclock_period * INT_CMU_CLK_DIV_DIVIDE_BY / INT_CMU_PLL_MULTIPLY_BY) ;
localparam real INT_RX_CRU_MULTIPLICATION = (((((rx_data_rate * 100.0) + (rx_data_rate_remainder/10000)) * INT_CRU_INCLOCK_PERIOD)/ 1000000)) / 200.0;
localparam integer INT_RX_CRU_MULT_ROUNDED = INT_RX_CRU_MULTIPLICATION;
localparam real INT_RX_CRU_ROUND_DIF = (INT_RX_CRU_MULT_ROUNDED < INT_RX_CRU_MULTIPLICATION)? (INT_RX_CRU_MULTIPLICATION - INT_RX_CRU_MULT_ROUNDED + 0.0) :
                                          (INT_RX_CRU_MULT_ROUNDED - INT_RX_CRU_MULTIPLICATION + 0.0);
localparam real INT_RX_ADJUSTED_CRU_ROUND_DIF = ((INT_RX_CRU_ROUND_DIF >= 0.03125) && (INT_RX_CRU_ROUND_DIF < 0.09375))? 0.0625 :
                                                ((INT_RX_CRU_ROUND_DIF < 0.125) || (INT_RX_CRU_ROUND_DIF >= 0.75))? 0 :
                                             ((INT_RX_CRU_ROUND_DIF >= 0.125) && (INT_RX_CRU_ROUND_DIF < 0.1875))? 0.125 :
                                             ((INT_RX_CRU_ROUND_DIF > 0.1875) && (INT_RX_CRU_ROUND_DIF <= 0.375))? 0.25 :
                                             ((INT_RX_CRU_ROUND_DIF > 0.375) && (INT_RX_CRU_ROUND_DIF < 0.75))? 0.5 : 0;                                          
localparam integer INT_RX_CRU_PRE_DIV_FAC = ((INT_RX_CRU_MULT_ROUNDED == 2) && (INT_RX_ADJUSTED_CRU_ROUND_DIF == 0))? 2 :
                                            (INT_RX_CRU_MULTIPLICATION > 12.5)? 1:
                                            (INT_RX_CRU_MULTIPLICATION  == 12.5) && (INT_CMU_PLL_NEED_REFCLK_DIV == "true")? 1:
                                            (INT_RX_ADJUSTED_CRU_ROUND_DIF == 0.5)? 2:
                                            (INT_RX_ADJUSTED_CRU_ROUND_DIF == 0.25)? 4:
                                            ((INT_RX_ADJUSTED_CRU_ROUND_DIF == 0.125) || (INT_RX_ADJUSTED_CRU_ROUND_DIF == 0.0625))? 8 : 1;    
localparam INT_RX_PLL_EN_4_5_MULT_6G = ((pll_legal_multiplier_list == "disable_4_5_mult_above_3125") && (rx_data_rate <= 3125))? "true" : "false";                                 
localparam INT_RX_CRU_M_NEED_REFCLK_DIV = ((rx_use_deserializer_double_data_mode == "false") && (((INT_RX_CRU_MULT_ROUNDED == 13) && (INT_RX_CRU_ROUND_DIF <= 0.5)) || ((INT_RX_CRU_MULT_ROUNDED == 3) && (INT_RX_CRU_ROUND_DIF <= 0.5)) || (INT_RX_CRU_MULT_ROUNDED == 2)))? "true" :
                                          ((rx_use_deserializer_double_data_mode == "true") && (((INT_RX_CRU_MULT_ROUNDED == 13) && (INT_RX_CRU_ROUND_DIF <= 0.5)) || (((INT_RX_CRU_MULT_ROUNDED == 4) || (INT_RX_CRU_MULT_ROUNDED == 5)) && (INT_RX_PLL_EN_4_5_MULT_6G == "false"))))? "true" : 
                                          (((((INT_RX_CRU_MULT_ROUNDED == 13) || (INT_RX_CRU_MULT_ROUNDED == 12)) && (INT_RX_CRU_ROUND_DIF <= 0.5)) || (INT_RX_CRU_MULT_ROUNDED == 2) || ((INT_RX_CRU_MULT_ROUNDED == 3) && (INT_RX_CRU_ROUND_DIF <= 0.5))) && (en_local_clk_div_ctrl == "true"))? "true" : "false";                                        
localparam INT_RX_CRU_NEED_REFCLK_DIV = ((operation_mode == "tx") || (INT_RX_CRU_DRIVEN_BY_INPUT_PORT == "false"))? "false" :
                                        (enforce_refclk_divider == "true")? "true" :
                                        (enforce_refclk_divider == "false")? "false" :
                                        (INT_IS_PIPE_GEN_2 == "true")? "false" :
                                        ((operation_mode == "duplex") || ((INT_RECONFIG_DPRIO_MODE != 0) && (INT_RECONFIG_ANALOG_ONLY == "false")))? ((INT_CMU_PLL_NEED_REFCLK_DIV == "true")? "true" : "false") :
                                        (INT_RX_ADJUSTED_CRU_ROUND_DIF == 0.0625)? "true" : 
                                        ((protocol == "sonet") && (INT_CRU_INCLOCK_PERIOD < 3205) && (INT_RX_CRU_PRE_DIV_FAC == 2) && (operation_mode == "rx"))? "true" :
                                        ((INT_CRU_INCLOCK_PERIOD < 3076) && (protocol != "3g_basic") && (protocol != "cpri") && (protocol != "6g_basic"))? "true" : INT_RX_CRU_M_NEED_REFCLK_DIV;
localparam INT_RX_CRU_REFCLK_DIV_GEN = ((INT_IS_PIPE_GEN_2 == "true") || (INT_RECONFIG_IS_PIPE_GEN_2 == "true"))? "true" : INT_RX_CRU_NEED_REFCLK_DIV;

localparam integer INT_FINAL_RX_CRU_PRE_DIV_FAC = ((operation_mode == "duplex") && (INT_CMU_PLL_NEED_REFCLK_DIV == "true") && (INT_RX_CRU_PRE_DIV_FAC != 1))?  INT_RX_CRU_PRE_DIV_FAC / 2 :
                                                  ((operation_mode == "rx") && (INT_RX_CRU_NEED_REFCLK_DIV == "true") && (INT_RX_CRU_PRE_DIV_FAC != 1))? INT_RX_CRU_PRE_DIV_FAC / 2 :             
                                                 INT_RX_CRU_PRE_DIV_FAC;
                                                 
localparam INT_RX_CRU_RECONFIG_NEED_REFCLK_DIV = (INT_CMU_PLL_RECONFIG_NEED_REFCLK_DIV == "true")? "true" : "false";
localparam INT_RX_CRU_RECONFIG_REFCLK_DIV_GEN = ((INT_RX_CRU_RECONFIG_NEED_REFCLK_DIV == "false") && (((INT_RECONFIG_IS_PIPE_GEN_1 == "true") && (rx_cru_pre_divide_by == 1) && (INT_IS_PIPE_GEN_2 == "true")) ||((INT_RECONFIG_IS_PIPE_GEN_2 == "true") && (tx_refclk_divide_by == 2))))? "true" : INT_RX_CRU_RECONFIG_NEED_REFCLK_DIV;              
                                      
localparam integer INT_RX_CRU_ADJUSTED_MULT_VALUE = (INT_RX_CRU_NEED_REFCLK_DIV == "true")? (INT_RX_CRU_MULTIPLICATION * INT_FINAL_RX_CRU_PRE_DIV_FAC * 2) : INT_RX_CRU_MULTIPLICATION * INT_FINAL_RX_CRU_PRE_DIV_FAC;
localparam INT_IS_VALID_CRU_MULT_VALUE =  (INT_RX_CRU_ADJUSTED_MULT_VALUE == 1) ||(INT_RX_CRU_ADJUSTED_MULT_VALUE == 4)||(INT_RX_CRU_ADJUSTED_MULT_VALUE == 5) || (INT_RX_CRU_ADJUSTED_MULT_VALUE == 8) ||
                                          (INT_RX_CRU_ADJUSTED_MULT_VALUE == 10) || (INT_RX_CRU_ADJUSTED_MULT_VALUE  == 16) || (INT_RX_CRU_ADJUSTED_MULT_VALUE  == 20) ||
                                          (INT_RX_CRU_ADJUSTED_MULT_VALUE == 25)? "true" : "false";  
localparam integer INT_RX_CRU_MULTIPLY_BY = (INT_IS_VALID_CRU_MULT_VALUE == "true")? INT_RX_CRU_ADJUSTED_MULT_VALUE :
                                            (INT_RX_CRU_ADJUSTED_MULT_VALUE < 1)? 1 :
                                           (INT_RX_CRU_ADJUSTED_MULT_VALUE < 4)? 4 :
                                           (INT_RX_CRU_ADJUSTED_MULT_VALUE < 7)? 5 :
                                           (INT_RX_CRU_ADJUSTED_MULT_VALUE < 8)? 8 :
                                           (INT_RX_CRU_ADJUSTED_MULT_VALUE < 10)? 10 :
                                           (INT_RX_CRU_ADJUSTED_MULT_VALUE < 13)? 10 :
                                           (INT_RX_CRU_ADJUSTED_MULT_VALUE < 19)? 16 :
                                           (INT_RX_CRU_ADJUSTED_MULT_VALUE < 22)? 25 : INT_RX_CRU_ADJUSTED_MULT_VALUE;  

localparam INT_CRU_PRE_DIVIDE_BY = (en_local_clk_div_ctrl == "true")? rx_cru_pre_divide_by : INT_FINAL_RX_CRU_PRE_DIV_FAC;
localparam INT_RX_IS_QUAD_BONDED = ((rx_channel_bonding == "x4") || (rx_channel_bonding == "x4_unbundled"))? "true" : "false";
localparam INT_RX_CRU_CLOCK_SELECT = (INT_RX_CRU_DRIVEN_BY_INPUT_PORT == "true")? ((INT_RX_CRU_REFCLK_DIV_GEN == "true")? 2 : 1) : 0;
                                      
localparam INT_RX_ALIGN_TO_DESKEW_POS_DISP = ((protocol == "xaui") || (protocol == "gige")|| (protocol == "5g_scrambled") || (protocol == "cei_6g"))? "false" : rx_align_to_deskew_pattern_pos_disp_only;
localparam INT_RX_IS_BI_QUAD_BONDED = ((rx_channel_bonding == "x8") || (rx_channel_bonding == "x8_unbundled"))? "true" : "false";

localparam INT_CENT_UNIT_OFFSET_ALL_ERRORS_ALIGN = cmu_offset_all_errors_align;

localparam INT_CMU_CLK_DIV_USE_DIGITAL_REFCLK_POST_DIVIDER = (INT_QUAD_BONDED == "true")? ((tx_use_serializer_double_data_mode == "true")? "true" : "false") : "false" ;
localparam INT_CMU_CLK_DIV_INCLK_SEL = (cmu_clk_div_inclk_sel == "auto")? ((use_global_clk_divider == "true")? cmu_pll_log_index :0 ): 
                                        ((cmu_clk_div_inclk_sel == "pll0")? 0 : 
                                        ((cmu_clk_div_inclk_sel == "pll1")? 1 : 2));

// Enable the first refclk divider generation                                            
localparam INT_CMU_REFCLK_DIVIDER_ENABLE =  (cmu_refclk_divider_enable != "auto")? cmu_refclk_divider_enable :
                                            (INT_RECONFIG_CMU_PLL_RECONFIG == "true")? INT_RECONFIG_PLL_CLKIN_REFCLK_DIV0_EN :
                                            ((operation_mode == "rx") && (rx_channel_bonding == "indv"))? "false" :
                                            (operation_mode == "tx")? INT_CMU_PLL_NEED_REFCLK_DIV :
                                            ((operation_mode == "duplex") && (tx_channel_bonding == "indv"))? (((INT_CMU_PLL_NEED_REFCLK_DIV == "false") && (INT_RX_CRU_DRIVEN_BY_INPUT_PORT == "false"))? INT_RX_CRU_NEED_REFCLK_DIV : INT_CMU_PLL_NEED_REFCLK_DIV):
                                            INT_CMU_PLL_NEED_REFCLK_DIV;
                                            
localparam INT_CMU_REFCLK_DIVIDER_GEN =  ((INT_IS_PIPE_GEN_2 == "true") || (INT_RECONFIG_IS_PIPE_GEN_2 == "true"))? "true" : INT_CMU_REFCLK_DIVIDER_ENABLE; 
                                          
// Enable the second refclk divider generation
localparam INT_CMU_REFCLK_RECONFIG_DIVIDER_ENABLE = ((operation_mode == "rx") && (rx_channel_bonding == "indv") && (INT_RECONFIG_CMU_PLL_RECONFIG == "false"))? "false" : 
                                                    (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? INT_CMU_PLL_RECONFIG_NEED_REFCLK_DIV :
                                                    (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX != 7)? "true" : "false"; 
localparam INT_CMU_REFCLK_RECONFIG_DIVIDER_GEN =  ((INT_RECONFIG_IS_PIPE_GEN_2 == "true")? "true" : ((INT_RECONFIG_IS_PIPE_GEN_1 == "true") && (rx_cru_pre_divide_by == 1) && (INT_IS_PIPE_GEN_2 == "true"))) ? "true" : INT_CMU_REFCLK_RECONFIG_DIVIDER_ENABLE; 
                                                    
localparam INT_FINAL_CRU_INCLOCK_PERIOD = ((INT_RX_CRU_DRIVEN_BY_INPUT_PORT == "true") && (INT_RX_CRU_NEED_REFCLK_DIV == "true"))? (INT_CRU_INCLOCK_PERIOD  * 2) : INT_CRU_INCLOCK_PERIOD;                                          
localparam INT_FINAL_CRU_RECONFIG_INCLOCK_PERIOD = ((INT_CMU_REFCLK_RECONFIG_DIVIDER_ENABLE == "true") && (INT_RECONFIG_DPRIO_MODE != 0))? cmu_pll_reconfig_inclock_period * 2 : cmu_pll_reconfig_inclock_period;

// CMU PLL0 inclock period setting
localparam integer INT_CMU_PLL0_INCLK0_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? 0 : 
                                               (enable_pll_inclk0_divider == "true")? (pll_inclk0_inclock_period * 2) : pll_inclk0_inclock_period;
localparam integer INT_CMU_PLL0_INCLK1_PERIOD = ((INT_RECONFIG_CMU_PLL_RECONFIG == "false") && (INT_CMU_REFCLK_DIVIDER_ENABLE == "true"))? (cmu_pll_inclock_period * 2) : 
                                               ((INT_RECONFIG_CMU_PLL_RECONFIG == "false") && (INT_CMU_REFCLK_DIVIDER_ENABLE == "false"))?  cmu_pll_inclock_period :
                                               ((INT_RECONFIG_CMU_PLL_RECONFIG == "true") && (enable_pll_inclk1_divider == "true"))? (pll_inclk1_inclock_period  * 2) : pll_inclk1_inclock_period;
localparam integer INT_CMU_PLL0_INCLK2_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? cmu_pll_inclock_period :
                                               (enable_pll_inclk2_divider == "true")? (pll_inclk2_inclock_period * 2) : pll_inclk2_inclock_period;                                                  
localparam integer INT_CMU_PLL0_INCLK3_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? 0 : 
                                               (enable_pll_inclk3_divider == "true")? (pll_inclk3_inclock_period * 2) : pll_inclk3_inclock_period;
localparam integer INT_CMU_PLL0_INCLK4_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? 0 : 
                                               (enable_pll_inclk4_divider == "true")? (pll_inclk4_inclock_period * 2) : pll_inclk4_inclock_period;
localparam integer INT_CMU_PLL0_INCLK5_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? 0 : 
                                               (enable_pll_inclk5_divider == "true")? (pll_inclk5_inclock_period * 2) : pll_inclk5_inclock_period;
localparam integer INT_CMU_PLL0_INCLK6_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? 0 : 
                                               (enable_pll_inclk6_divider == "true")? (pll_inclk6_inclock_period * 2) : pll_inclk6_inclock_period;

// CMU PLL1 inclock period setting. Only inclk source 1 and 2 index need special handling due to backward compatibility

localparam integer INT_CMU_PLL1_INCLK1_PERIOD = ((INT_RECONFIG_CMU_PLL_RECONFIG == "false") && (INT_CMU_PLL_RECONFIG_NEED_REFCLK_DIV == "true"))? (cmu_pll_reconfig_inclock_period * 2) : 
                                               ((INT_RECONFIG_CMU_PLL_RECONFIG == "false") && (INT_CMU_PLL_RECONFIG_NEED_REFCLK_DIV == "false"))?  cmu_pll_reconfig_inclock_period :
                                               ((INT_RECONFIG_CMU_PLL_RECONFIG == "true") && (enable_pll_inclk1_divider == "true"))? (pll_inclk1_inclock_period  * 2) : pll_inclk1_inclock_period;
localparam integer INT_CMU_PLL1_INCLK2_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? cmu_pll_reconfig_inclock_period :
                                               (enable_pll_inclk2_divider == "true")? (pll_inclk2_inclock_period * 2) : pll_inclk2_inclock_period;                                                  

// RX CRU inclock period setting
localparam INT_RX_CRU0_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? ((rx_cru_log_index == 1)? INT_FINAL_CRU_RECONFIG_INCLOCK_PERIOD : INT_FINAL_CRU_INCLOCK_PERIOD) :
                                        (enable_reconfig_pll_inclk_drive_rx == "true")? INT_CMU_PLL0_INCLK0_PERIOD : rx_cru_inclock_period;
localparam INT_RX_CRU1_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? ((rx_cru_log_index == 1)? INT_FINAL_CRU_INCLOCK_PERIOD : 
                                        (gen_reconfig_pll == "true")? INT_FINAL_CRU_RECONFIG_INCLOCK_PERIOD : INT_FINAL_CRU_INCLOCK_PERIOD ) :
                                        (enable_reconfig_pll_inclk_drive_rx == "true")? INT_CMU_PLL0_INCLK1_PERIOD : rx_cru_inclock1_period ;
localparam INT_RX_CRU2_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? INT_FINAL_CRU_INCLOCK_PERIOD :
                                        (enable_reconfig_pll_inclk_drive_rx == "true")? INT_CMU_PLL0_INCLK2_PERIOD : rx_cru_inclock2_period ;
localparam INT_RX_CRU3_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? INT_FINAL_CRU_INCLOCK_PERIOD :
                                        (enable_reconfig_pll_inclk_drive_rx == "true")? INT_CMU_PLL0_INCLK3_PERIOD : rx_cru_inclock3_period ;
localparam INT_RX_CRU4_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? INT_FINAL_CRU_INCLOCK_PERIOD :
                                        (enable_reconfig_pll_inclk_drive_rx == "true")? INT_CMU_PLL0_INCLK4_PERIOD : rx_cru_inclock4_period ;
localparam INT_RX_CRU5_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? INT_FINAL_CRU_INCLOCK_PERIOD :
                                        (enable_reconfig_pll_inclk_drive_rx == "true")? INT_CMU_PLL0_INCLK5_PERIOD : rx_cru_inclock5_period ;
localparam INT_RX_CRU6_INCLOCK_PERIOD = (INT_RECONFIG_CMU_PLL_RECONFIG == "false")? INT_FINAL_CRU_INCLOCK_PERIOD :
                                        (enable_reconfig_pll_inclk_drive_rx == "true")? INT_CMU_PLL0_INCLK6_PERIOD : rx_cru_inclock6_period ;

localparam INT_CMU_PLL_INCLK_SEL = (INT_RECONFIG_CMU_PLL_RECONFIG == "true")? cmu_pll_inclk_log_index : 
                                   (INT_CMU_REFCLK_DIVIDER_GEN == "true")? 1 : 2;                                  
localparam INT_CMU_PLL_PFD_CLK_SELECT = (protocol != "custom")?  INT_CMU_PLL_INCLK_SEL :
                                        (cmu_pll_pfd_clk_select == "core_clk")? 2 :
                                        (cmu_pll_pfd_clk_select == "refclk0")? 1 : 2 ;
localparam INT_CMU_PLL_RECONFIG_PFD_CLK_SELECT = (INT_RECONFIG_CMU_PLL_RECONFIG == "true")? cmu_pll_reconfig_inclk_log_index : 
                                                 (INT_CMU_REFCLK_RECONFIG_DIVIDER_GEN == "true")? 1 : 2; 
                                                                         
localparam INT_CLK_DIV_SELECT_PCLK = (INT_BI_QUAD_BONDED == "true")? "true" : "false";
localparam INT_CLK_DIV_USE_CORECLK_OUT_POST_DIVIDER = (protocol == "custom")? cmu_clk_div_use_coreclk_out_post_divider :
                                                      ((protocol == "pipe") || (protocol == "xaui") || (INT_QUAD_BONDED == "true")) ? (((rx_use_double_data_mode == "true") || (tx_use_double_data_mode == "true")) ? "true" : "false") : "false";
localparam INT_GXB_POWERDOWN_WIDTH = ((NUMBER_OF_QUADS % NUM_QUAD_PER_PROT) != 0)? (NUMBER_OF_QUADS / NUM_QUAD_PER_PROT) + 1 :
                                    (NUMBER_OF_QUADS / NUM_QUAD_PER_PROT);
localparam INT_CMU_CONNECT_DPRIO =  (INT_RECONFIG_DPRIO_MODE != 0)? "true" :
                                    ((rx_dprio_mode == "pma_electricals") || (tx_dprio_mode == "pma_electricals"))? "true" : "false";
                                   
localparam INT_CMU_CLK_DIV_EN = ((use_global_clk_divider != "auto") && (operation_mode != "rx"))? use_global_clk_divider :
                                (reconfig_use_global_clk_divider != "auto")? reconfig_use_global_clk_divider :
                                ((operation_mode == "rx") && (rx_channel_bonding == "indv") && (INT_RX_CRU_DRIVEN_BY_INPUT_PORT == "true"))? "false" : 
                                (tx_channel_bonding == "indv")? "false" : "true";
localparam INT_RX_FORCE_SIGNAL_DETECT_DIG = rx_force_signal_detect_dig;
localparam INT_CMU_REFCLK_DIV_COUPLING_TERMINATION = "normal_100_ohm_termination";

localparam INT_PROTOCOL_HINT = ((protocol == "3g_basic") || (protocol == "6g_basic")) ? "basic" :
                                (protocol == "cei_6g") ? "cei" :
                                (protocol == "5g_scrambled") ? "sonet" :
                                (protocol == "pipe") ? 
                                (((rx_channel_bonding == "x8") || (rx_channel_bonding == "x8_unbundled"))? "pcie_x8" :
                                 ((rx_channel_bonding == "x4") || (rx_channel_bonding == "x4_unbundled")) ? "pcie_x4" : "pcie_x1"
                                 ) : (protocol == "cpri")? "cpri" : protocol;
                                                                   
localparam INT_RECONFIG_PROTOCOL_HINT = ((reconfig_protocol == "3g_basic") || (reconfig_protocol == "6g_basic")) ? "basic" :
                                        (reconfig_protocol == "cei_6g") ? "cei" :
                                        (reconfig_protocol == "5g_scrambled") ? "sonet" :
                                        (reconfig_protocol == "pipe") ? 
                                        (((rx_channel_bonding == "x8") || (rx_channel_bonding == "x8_unbundled"))? "pcie_x8" :
                                         ((rx_channel_bonding == "x4") || (rx_channel_bonding == "x4_unbundled")) ? "pcie_x4" : "pcie_x1") : 
                                        (reconfig_protocol == "cpri")? "cpri" :  reconfig_protocol;                                                         
                                                                   
localparam INT_EN_X16_X20_BASIC_BANDWIDTH = (((protocol == "3g_basic") || (protocol == "cpri")) && ((INT_CMU_PLL_MULTIPLY_BY == 16) || (INT_CMU_PLL_MULTIPLY_BY == 20)))? "true" : "false";                                                                                                           
localparam INT_EN_RECONFIG_X16_X20_BASIC_BANDWIDTH = ((reconfig_protocol == "3g_basic") && ((INT_CMU_PLL_RECONFIG_MULTIPLY_BY == 16) || (INT_CMU_PLL_RECONFIG_MULTIPLY_BY == 20)))? "true" : "false";                                                                                                           
localparam INT_CMU_PLL_BW = ((INT_EN_X16_X20_BASIC_BANDWIDTH == "false") && (INT_IS_PIPE_GEN_2 == "false"))? ((cmu_pll_loop_filter_resistor_control == 3 || cmu_pll_loop_filter_resistor_control == 2) ? 3 : 2) :
                            (INT_IS_PIPE_GEN_2 == "true")? 3 :
                            ((INT_EN_X16_X20_BASIC_BANDWIDTH == "true") && ((cmu_pll_loop_filter_resistor_control == 3) || (cmu_pll_loop_filter_resistor_control == 1)))? 3 : 2;
localparam INT_CMU_PLL_BW_CPC = (INT_EN_X16_X20_BASIC_BANDWIDTH == "false")? ((cmu_pll_loop_filter_resistor_control == 3) ? 2 : 1) :
                                ((cmu_pll_loop_filter_resistor_control == 3) || (cmu_pll_loop_filter_resistor_control == 2))? 2 : 1;
localparam INT_CMU_PLL_RECONFIG_BW = ((INT_EN_RECONFIG_X16_X20_BASIC_BANDWIDTH == "false") && (INT_RECONFIG_IS_PIPE_GEN_2 == "false"))? ((cmu_pll_reconfig_loop_filter_resistor_control == 3 || cmu_pll_reconfig_loop_filter_resistor_control == 2) ? 3 : 2) :
                                     (INT_RECONFIG_IS_PIPE_GEN_2 == "true")? 3 :
                                     ((cmu_pll_reconfig_loop_filter_resistor_control == 3) || (cmu_pll_reconfig_loop_filter_resistor_control == 1))? 3 : 2;
localparam INT_CMU_PLL_RECONFIG_BW_CPC = (INT_EN_RECONFIG_X16_X20_BASIC_BANDWIDTH == "false")?((cmu_pll_reconfig_loop_filter_resistor_control == 3)? 2 : 1) :
                                         ((cmu_pll_reconfig_loop_filter_resistor_control == 3) || (cmu_pll_reconfig_loop_filter_resistor_control == 2))? 2 : 1;
                                     

                                   
// Input ports for receivers
input [number_of_channels - 1 :0] rx_datain;
input [number_of_channels - 1 : 0] rx_coreclk;
input [rx_cruclk_width - 1 : 0] rx_cruclk;
input [rx_cruclk_width - 1 : 0] rx_cruclk_alt;
input [rx_digitalreset_port_width - 1 : 0] rx_digitalreset;
input [rx_digitalreset_port_width - 1 : 0] rx_analogreset;
input [number_of_channels - 1 : 0] rx_powerdown;
input [number_of_channels - 1 : 0] rx_enapatternalign;
input [number_of_channels - 1 : 0] rx_bitslip;
input [number_of_channels - 1 : 0] rx_invpolarity;
input [number_of_channels - 1 : 0] rx_revbitorderwa;
input [number_of_channels - 1 : 0] rx_revbyteorderwa;
input [number_of_channels - 1 : 0] rx_enabyteord;
input [number_of_channels - 1 : 0] rx_rmfifordena;
input [number_of_channels - 1 : 0] rx_rmfifowrena;
input [number_of_channels - 1 : 0] rx_phfifordenable;
input [number_of_channels - 1 : 0] rx_phfifowrdisable;
input [number_of_channels - 1 : 0] rx_phfiforeset;
input [number_of_channels - 1 : 0] rx_rmfiforeset;
input [number_of_channels - 1 : 0] rx_seriallpbken;
input [number_of_channels - 1 : 0] rx_a1a2size;
input [number_of_channels - 1 : 0] rx_locktodata;
input [number_of_channels - 1 : 0] rx_locktorefclk;
input [number_of_channels - 1 : 0] pipe8b10binvpolarity;
input [(number_of_channels * 4) - 1 : 0] aeq_togxb;

// Input ports for transmitter
input [(tx_channel_width * number_of_channels) - 1:0] tx_datain;
input [(44 * number_of_channels) - 1 : 0] tx_datainfull;
input [(INT_TX_DWIDTH_FACTOR * number_of_channels) - 1 : 0] tx_ctrlenable; 
input [(INT_TX_DWIDTH_FACTOR * number_of_channels) - 1 : 0] tx_forcedisp;
input [(INT_TX_DWIDTH_FACTOR * number_of_channels) - 1 : 0] tx_dispval;
input [number_of_channels - 1 : 0] tx_detectrxloop;
input [number_of_channels - 1 : 0] tx_forceelecidle;
input [number_of_channels - 1 : 0] tx_forcedispcompliance;
input [(number_of_channels * 2) - 1 : 0] powerdn;
input [number_of_channels - 1 : 0] tx_phfiforeset;
input [number_of_channels - 1 : 0] tx_invpolarity;
input [number_of_channels - 1 : 0] tx_coreclk;
input [tx_digitalreset_port_width - 1 : 0] tx_digitalreset;
input [number_of_channels - 1 : 0] tx_revparallellpbken;


// Central management unit input ports
input [INT_GXB_POWERDOWN_WIDTH - 1 : 0] gxb_powerdown;
input [0 : 0] gxb_enable;
input reconfig_clk;
input pll_inclk;
input pll_inclk_alt;
input [reconfig_pll_inclk_width - 1 : 0] pll_inclk_rx_cruclk;
input fixedclk;
input [2 : 0] reconfig_togxb;
input cal_blk_clk;
input cal_blk_powerdown;


// Output ports for receiver
output [((rx_channel_width * number_of_channels) - 1):0] rx_dataout;
output [((64 * number_of_channels) - 1):0] rx_dataoutfull;
output [(number_of_channels - 1) : 0] rx_clkout;
output [(number_of_channels - 1) : 0] rx_recovclkout;
output [(number_of_channels - 1) : 0] rx_pll_locked;
output [(number_of_channels - 1) : 0] rx_freqlocked;
output [(number_of_channels - 1) : 0] rx_rlv;
output [(number_of_channels*INT_RX_DWIDTH_FACTOR) -1 : 0 ] rx_syncstatus;
output [(number_of_channels*INT_RX_WORD_ALIGNER_NUM_BYTE) -1 : 0] rx_a1detect;
output [(number_of_channels*INT_RX_WORD_ALIGNER_NUM_BYTE) -1 : 0] rx_a2detect;
output [(number_of_channels*INT_RX_WORD_ALIGNER_NUM_BYTE) -1 : 0] rx_k1detect;
output [(number_of_channels*2) -1 : 0] rx_k2detect;
output [(number_of_channels*INT_RX_DWIDTH_FACTOR) -1 : 0 ] rx_patterndetect; 
output [(number_of_channels*INT_RX_DWIDTH_FACTOR) -1 : 0 ] rx_ctrldetect;
output [(number_of_channels*INT_RX_DWIDTH_FACTOR) -1 : 0 ] rx_errdetect;
output [(number_of_channels*INT_RX_DWIDTH_FACTOR) -1 : 0 ] rx_disperr;
output [(number_of_channels*INT_RX_DWIDTH_FACTOR) -1 : 0 ] rx_runningdisp;
output [(number_of_channels*INT_RX_DWIDTH_FACTOR) -1 : 0 ] rx_rmfifodatainserted;
output [(number_of_channels*INT_RX_DWIDTH_FACTOR) -1 : 0 ] rx_rmfifodatadeleted;
output [(number_of_channels - 1) : 0] rx_rmfifoempty;
output [(number_of_channels - 1) : 0] rx_rmfifofull;
output [(number_of_channels - 1) : 0] rx_rmfifoalmostempty;
output [(number_of_channels - 1) : 0] rx_rmfifoalmostfull;
output [(number_of_channels - 1) : 0] rx_bisterr;
output [(number_of_channels - 1) : 0] rx_bistdone;
output [(number_of_channels*INT_RX_DWIDTH_FACTOR) -1 : 0] rx_a1a2sizeout;
output [(number_of_channels - 1) : 0] rx_byteorderalignstatus;
output [(number_of_channels - 1) : 0] rx_phfifooverflow;
output [(number_of_channels - 1) : 0] rx_phfifounderflow;
output [(number_of_channels - 1) : 0] rx_signaldetect;
output [(number_of_channels * 3) - 1 : 0] pipestatus;
output [(number_of_channels - 1) : 0] pipedatavalid;
output [(number_of_channels - 1) : 0] pipeelecidle;
output [(number_of_channels - 1) : 0] pipephydonestatus;
output [(number_of_channels - 1) : 0] debug_rx_phase_comp_fifo_error;

// Output ports for transmitter
output [(number_of_channels - 1) : 0] tx_dataout;
output [(number_of_channels - 1) : 0] tx_clkout;
output [(number_of_channels - 1) : 0] tx_phfifooverflow;
output [(number_of_channels - 1) : 0] tx_phfifounderflow;
output [(number_of_channels - 1) : 0] debug_tx_phase_comp_fifo_error;

//Output ports for central management unit
output [NUMBER_OF_QUADS - 1 : 0] reconfig_fromgxb;
output [NUMBER_OF_QUADS - 1 : 0] reconfig_fromgxb_oe;
output [(number_of_channels * 6) - 1 : 0] aeq_fromgxb;
output [NUMBER_OF_QUADS - 1 : 0] rx_channelaligned;
output [NUMBER_OF_QUADS -1 : 0] pll_locked;
output [NUMBER_OF_QUADS -1 : 0] pll_locked_alt;
output [NUMBER_OF_QUADS - 1 : 0] coreclkout;
output [4 : 0] cal_blk_calibrationstatus;


//Default port value for receiver input port
tri0 [number_of_channels - 1 : 0] rx_coreclk;
tri0 [rx_cruclk_width - 1 : 0] rx_cruclk;
tri0 [rx_cruclk_width - 1 : 0] rx_cruclk_alt;
tri0 [rx_digitalreset_port_width - 1 : 0] rx_digitalreset;
tri0 [rx_digitalreset_port_width - 1 : 0] rx_analogreset;
tri0 [number_of_channels - 1 : 0] rx_powerdown;
tri0 [number_of_channels - 1 : 0] rx_enapatternalign;
tri0 [number_of_channels - 1 : 0] rx_bitslip;
tri0 [number_of_channels - 1 : 0] rx_invpolarity;
tri0 [number_of_channels - 1 : 0] rx_revbitorderwa;
tri0 [number_of_channels - 1 : 0] rx_revbyteorderwa;
tri0 [number_of_channels - 1 : 0] rx_enabyteord;
tri0 [number_of_channels - 1 : 0] rx_rmfifordena;
tri0 [number_of_channels - 1 : 0] rx_rmfifowrena;
tri1 [number_of_channels - 1 : 0] rx_phfifordenable;
tri0 [number_of_channels - 1 : 0] rx_phfifowrdisable;
tri0 [number_of_channels - 1 : 0] rx_phfiforeset;
tri0 [number_of_channels - 1 : 0] rx_rmfiforeset;
tri0 [number_of_channels - 1 : 0] rx_seriallpbken;
tri0 [number_of_channels - 1 : 0] rx_a1a2size;
tri0 [number_of_channels - 1 : 0] rx_locktodata;
tri0 [number_of_channels - 1 : 0] rx_locktorefclk;
tri0 [number_of_channels - 1 : 0] pipe8b10binvpolarity;
tri0 [(number_of_channels * 4) - 1 : 0] aeq_togxb;


// Default port value for transmitter input ports
tri0 [(INT_TX_DWIDTH_FACTOR * number_of_channels) - 1 : 0] tx_ctrlenable; 
tri0 [(INT_TX_DWIDTH_FACTOR * number_of_channels) - 1 : 0] tx_forcedisp;
tri0 [(INT_TX_DWIDTH_FACTOR * number_of_channels) - 1 : 0] tx_dispval;
tri0 [number_of_channels - 1 : 0] tx_detectrxloop;
tri0 [number_of_channels - 1 : 0] tx_forceelecidle;
tri0 [number_of_channels - 1 : 0] tx_forcedispcompliance;
tri0 [(number_of_channels * 2) - 1 : 0] powerdn;
tri0 [number_of_channels - 1 : 0] tx_phfiforeset;
tri0 [number_of_channels - 1 : 0] tx_invpolarity;
tri0 [number_of_channels - 1 : 0] tx_coreclk;
tri0 [tx_digitalreset_port_width - 1 : 0] tx_digitalreset;
tri0 [number_of_channels - 1 : 0] tx_revparallellpbken;


// Default port value for central management unit input ports
tri0 [INT_GXB_POWERDOWN_WIDTH - 1 : 0] gxb_powerdown;
tri1 [0 : 0] gxb_enable;
tri0 reconfig_clk;
tri0 pll_inclk;
tri0 pll_inclk_alt;
tri0 fixedclk;
tri0 reconfig_togxb_in;
tri1 reconfig_togxb_disable;
tri0 reconfig_togxb_load;
tri0 cal_blk_clk;
tri1 cal_blk_powerdown;


genvar num_tx;
genvar num_rx;
genvar num_quad;
genvar rx_bit_cnt;
genvar rx_byte_cnt;
genvar tx_bit_cnt;
genvar tx_byte_cnt;
genvar num_pll_inclk;
genvar refclk_div_count;

tri0 [ ((tx_channel_width * number_of_channels) - 1) : 0] tx_datain_wire;
tri0 [ ((rx_channel_width * number_of_channels) - 1) : 0] rx_out_wire;
tri0 [NUMBER_OF_QUADS - 1: 0] pll0_out;
tri0 [NUMBER_OF_QUADS - 1: 0] pll1_out;
tri0 [NUMBER_OF_QUADS - 1: 0] refclk_pma;
tri0 [(NUMBER_OF_QUADS * 2) - 1: 0] tx_pllfastclk_in;
tri0 [NUMBER_OF_QUADS - 1: 0] analogfastrefclkout;
tri0 [NUMBER_OF_QUADS - 1: 0] analogrefclkout;
tri0 [(NUMBER_OF_QUADS * 3) - 1: 0] clk_div_clkin;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] fixedclk_in;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] rx_digitalreset_in;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] rx_analogreset_in;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] rx_powerdown_in;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] tx_digitalreset_in;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] rx_digitalreset_out;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] rx_analogreset_out;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] tx_digitalreset_out;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] tx_analogreset_out;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] rx_rxcruresetout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] rx_rxadceresetout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] cent_unit_rxcrupowerdn;
tri0 [(3 * NUMBER_OF_QUADS) - 1 : 0] cent_unit_pllresetout;
tri0 [(2 * NUMBER_OF_QUADS) - 1 : 0] pllreset_in;
tri0 [NUMBER_OF_QUADS - 1 : 0] cent_unit_quadresetout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] cent_unit_rxadcepowerdn;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] cent_unit_rxibpowerdn;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] cent_unit_txobpowerdn;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] cent_unit_txdividerpowerdn;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD)- 1: 0] cent_unit_txdetectrxpowerdn;
tri0 [NUMBER_OF_QUADS - 1 : 0] cent_unit_clkdivpowerdn;
tri0 [(3 * NUMBER_OF_QUADS) - 1 : 0] cent_unit_pllpowerdn;
tri0 [(2 * NUMBER_OF_QUADS) - 1 : 0] pllpowerdn_in;
tri0 [number_of_channels - 1 : 0] tx_localrefclk;
tri0 [number_of_channels - 1 : 0] rx_coreclk_in;
tri0 [number_of_channels - 1 : 0] rx_pldcruclk_in;
tri0 [number_of_channels - 1 : 0] rx_pldcruclk_reconfig_in;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_channelaligned_in;
tri0 [NUMBER_OF_QUADS - 1 : 0] enabledeskew;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_masterclk;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_alignstatussync;
tri0 [number_of_channels - 1 : 0] rx_clkout_wire;
tri0 [(INT_TX_DWIDTH_FACTOR * number_of_channels) - 1 : 0] tx_forcedisp_wire;
tri0 [NUMBER_OF_QUADS - 1 : 0] cmu_refclk_div_out;
tri0 [NUMBER_OF_QUADS - 1 : 0] cmu_refclk_div_reconfig_out;
tri0 [(NUMBER_OF_QUADS * 8) - 1 : 0] cmu_refclk_div_other_out;
tri0 [(number_of_channels - 1) : 0] rx_recovclkout_wire;
tri0 [(number_of_channels - 1) : 0] tx_core_clkout_wire;
tri0 [(number_of_channels - 1) : 0] tx_clkout_int_wire;
tri0 [(number_of_channels - 1) : 0] rx_disablefifordout_wire;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_disablefifordin_in;
tri0 [number_of_channels - 1 : 0] rx_disablefifowrout_wire;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_disablefifowrin_in;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_fifordin_in;
tri0 [number_of_channels - 1 : 0] rx_fifordout_wire;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_fiforesetrd;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 8) - 1 : 0] cent_unit_rx_xgmdataout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 8) - 1 : 0] cent_unit_tx_xgmdataout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 8) - 1 : 0] rx_xgmdataout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 8) - 1 : 0] tx_xgmdataout;
tri0 [(NUMBER_OF_QUADS * 4) - 1 : 0] rx_xgmctrlin;
tri0 [(NUMBER_OF_QUADS * 4) - 1 : 0] cent_unit_rx_ctrl;
tri0 [(NUMBER_OF_QUADS * 4) - 1 : 0] rx_syncstatusdeskew;
tri0 [(NUMBER_OF_QUADS * 4) - 1 : 0] rx_adetectdeskew;
tri0 [(NUMBER_OF_QUADS * 4) - 1 : 0] rx_rdalign;
tri0 [(NUMBER_OF_QUADS * 4) - 1 : 0] rx_xgmrunningdisp;
tri0 [(NUMBER_OF_QUADS * 4) - 1 : 0] rx_xgmdatavalid;
tri0 [(NUMBER_OF_QUADS * 4) - 1 : 0] cent_unit_txctrlout;
tri0 [(NUMBER_OF_QUADS * 4) - 1 : 0] tx_xgmctrlenable;
tri0 [NUMBER_OF_QUADS - 1 : 0] cent_unit_rdenablesync;
tri0 [number_of_channels - 1 : 0] tx_rdenablesync;
tri0 [number_of_channels - 1 : 0] tx_serialfdbkout;
tri0 [number_of_channels - 1 : 0] rx_revserialfdbkout;
tri0 [(number_of_channels * 20) - 1 : 0] tx_parallelfdbkout;
tri0 [(number_of_channels * 20) - 1 : 0] rx_revparallelfdbkdata; 
tri0 [ NUMBER_OF_QUADS - 1 : 0 ] clk_div_pclkx8out;
tri0 [ NUMBER_OF_QUADS - 1 : 0 ] clk_div_pclkin;
tri0 [NUMBER_OF_QUADS - 1 : 0] tx_phfifox4wrenable;
tri0 [NUMBER_OF_QUADS - 1 : 0] tx_phfifox4rdenable;
tri0 [NUMBER_OF_QUADS - 1 : 0] tx_phfifox4rdclk;
tri0 [NUMBER_OF_QUADS - 1 : 0] tx_phfifox4bytesel;
tri0 [number_of_channels - 1 : 0] tx_phfifowrenableout;
tri0 [number_of_channels - 1 : 0] tx_phfifordenableout;
tri0 [number_of_channels - 1 : 0] tx_phfifordclkout;
tri0 [number_of_channels - 1 : 0] tx_phfifobyteselout;
tri0 [number_of_channels - 1 : 0] rx_phfifowrenableout;
tri0 [number_of_channels - 1 : 0] rx_phfifordenableout;
tri0 [number_of_channels - 1 : 0] rx_phfifowrclkout;
tri0 [number_of_channels - 1 : 0] rx_phfifobyteselout;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_phfifox4wrenable;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_phfifox4rdenable;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_phfifox4wrclk;
tri0 [NUMBER_OF_QUADS - 1 : 0] rx_phfifox4bytesel;
tri0 [NUMBER_OF_BI_QUAD - 1 : 0] tx_phfifox8wrenable;
tri0 [NUMBER_OF_BI_QUAD - 1 : 0] tx_phfifox8rdenable;
tri0 [NUMBER_OF_BI_QUAD - 1 : 0] tx_phfifox8rdclk;
tri0 [NUMBER_OF_BI_QUAD - 1 : 0] tx_phfifox8bytesel;
tri0 [NUMBER_OF_BI_QUAD - 1 : 0] rx_phfifox8wrenable;
tri0 [NUMBER_OF_BI_QUAD - 1 : 0] rx_phfifox8rdenable;
tri0 [NUMBER_OF_BI_QUAD - 1 : 0] rx_phfifox8wrclk;
tri0 [NUMBER_OF_BI_QUAD - 1 : 0] rx_phfifox8bytesel;
tri0 [(number_of_channels - 1) : 0] tx_phfifooverflowout;
tri0 [(number_of_channels - 1) : 0] tx_phfifounderflowout;
tri0 [(number_of_channels - 1) : 0] rx_phfifooverflowout;
tri0 [(number_of_channels - 1) : 0] rx_phfifounderflowout;
tri0 [(number_of_channels * 4) - 1 : 0] tx_pipepowerstateout;
tri0 [(number_of_channels * 2) - 1 : 0] tx_pipepowerdownout;
tri0 [(number_of_channels * 2) - 1 : 0] tx_rxfoundout;
tri0 [number_of_channels - 1 : 0] tx_rxdetectvalidout;
tri0 [(NUMBER_OF_QUADS * 8) - 1 : 0] pll0_clkin;
tri0 [(NUMBER_OF_QUADS * 8) - 1 : 0] pll1_clkin;
tri0 [number_of_channels - 1 : 0] rx_int_rmfifowrena;
tri0 [(number_of_channels * 9) - 1 : 0] rx_cruclk_in;
tri0 [number_of_channels - 1 : 0] rx_alignstatussyncout;
tri0 [number_of_channels - 1 : 0] rx_pipestatetransdoneout;
tri0 [(number_of_channels * 8) - 1 : 0] rx_analogtestbus_out;
tri0 [(number_of_channels - 1) : 0] pipedatavalid_out;
tri0 [(number_of_channels - 1) : 0] pipeelecidle_out;


tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 300) - 1 : 0] rx_rxdprioout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 300) - 1 : 0] cent_unit_rxdprioout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 150) - 1 : 0] tx_txdprioout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 150) - 1 : 0] cent_unit_txdprioout;
tri0 [(NUMBER_OF_QUADS * 3 * 40) - 1 : 0] pll_cmuplldprioout;
tri0 [(NUMBER_OF_QUADS * 3 * 40) - 1 : 0] cent_unit_cmuplldprioout;
tri0 [(NUMBER_OF_QUADS * 30) - 1 : 0] clk_div_cmudividerdprioin;
tri0 [(NUMBER_OF_QUADS * 30) - 1 : 0] cent_unit_cmudividerdprioout;
tri0 [(NUMBER_OF_QUADS * 2) - 1 : 0] refclkdividerdprioin;
tri1 [NUMBER_OF_QUADS -1 : 0] cent_unit_dpriodisableout;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 150) - 1 : 0] tx_dprioin_wire;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 300) - 1 : 0] rx_dprioin_wire;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 300) - 1 : 0] cent_unit_rx_dprioin;
tri0 [(NUMBER_OF_QUADS * NUMBER_CHANNELS_PER_QUAD * 150) - 1 : 0] cent_unit_tx_dprioin;


wire [number_of_channels - 1 : 0 ] rx_phaselockloss_out;
tri0 [number_of_channels - 1 : 0] tx_coreclk_in;
tri0 [NUMBER_OF_QUADS - 1 : 0] coreclkout_wire;
tri0 [NUMBER_OF_BI_QUAD - 1 : 0] coreclkout_bi_quad_wire;
tri0 pll_inclk_wire;
tri0 pll1_inclk_wire;
tri0 [number_of_channels - 1 : 0] rx_cru_refclk_div_out;
tri0 [number_of_channels - 1 : 0] rx_cru_reconfig_refclk_div_out;
tri0 [NUMBER_OF_QUADS - 1 : 0] analogrefclkout_wire;
tri0 [NUMBER_OF_QUADS -1 : 0] pll_locked_out;
tri0 [NUMBER_OF_QUADS -1 : 0] pll_locked_alt_out;
tri0 [(number_of_channels - 1) : 0] rx_signaldetect_wire;
tri0 [(number_of_channels - 1) : 0] rx_locktodata_wire;
tri0 [(number_of_channels - 1) : 0] rx_locktorefclk_wire;
tri0 [(number_of_channels - 1) : 0] nfts_ltr_out;
tri0 [(number_of_channels - 1) : 0] nfts_ltd_out;
tri0 [((64 * number_of_channels) - 1):0] rx_dataoutfull_wire;

// Generate pll inclk 
generate
        
        if (INT_RECONFIG_CMU_PLL_RECONFIG == "true")
        begin
            if (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == 0)
                assign pll_inclk_wire = pll_inclk_rx_cruclk[0];
            else if (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == 1)
                assign pll_inclk_wire = pll_inclk_rx_cruclk[1];
            else if (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == 2)
                assign pll_inclk_wire = pll_inclk_rx_cruclk[2];
            else if (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == 3)
                assign pll_inclk_wire = pll_inclk_rx_cruclk[3];
            else if (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == 4)
                assign pll_inclk_wire = pll_inclk_rx_cruclk[4];
            else if (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == 5)
                assign pll_inclk_wire = pll_inclk_rx_cruclk[5];
            else if (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == 6)
                assign pll_inclk_wire = pll_inclk_rx_cruclk[6];
            else
                assign pll_inclk_wire = pll_inclk; 
           
                if (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX == 1)
                    assign pll1_inclk_wire = pll_inclk_rx_cruclk[1];
                else if (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX == 2)
                    assign pll1_inclk_wire = pll_inclk_rx_cruclk[2];
                else if (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX == 3)
                    assign pll1_inclk_wire = pll_inclk_rx_cruclk[3];
                else if (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX == 4)
                    assign pll1_inclk_wire = pll_inclk_rx_cruclk[4];
                else if (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX == 5)
                    assign pll1_inclk_wire = pll_inclk_rx_cruclk[5];
                else if (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX == 6)
                    assign pll1_inclk_wire = pll_inclk_rx_cruclk[6];
                else
                assign pll1_inclk_wire = 1'b0;
   
    
            
        end
        else
        begin
            if (operation_mode != "rx")
            begin
                 assign pll_inclk_wire = pll_inclk; 
  
                if (gen_reconfig_pll == "true")
                    assign pll1_inclk_wire = pll_inclk_alt;
            end

       end
            
endgenerate

// Assign reconfiguration signal
assign reconfig_togxb_in = reconfig_togxb[0];
assign reconfig_togxb_disable = reconfig_togxb[1];
assign reconfig_togxb_load = reconfig_togxb[2];


generate for (num_quad=0; num_quad < NUMBER_OF_QUADS; num_quad = num_quad + 1) begin:channel_quad
    assign rx_channelaligned[num_quad] = rx_channelaligned_in[num_quad];
   
      
    
    stratixiigx_hssi_central_management_unit cent_unit  ( 
                                                            .rxdigitalreset(rx_digitalreset_in[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .txdigitalreset(tx_digitalreset_in[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .rxanalogreset(rx_analogreset_in[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .rxpowerdown(rx_powerdown_in[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .quadenable (gxb_enable[0]),
                                                            .quadreset (gxb_powerdown[num_quad/NUM_QUAD_PER_PROT]),
                                                            .dpclk(reconfig_clk),
                                                            .fixedclk(fixedclk_in[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .txdatain((protocol == "xaui")? (tx_xgmdataout[(32 * num_quad) + 31 : (32 * num_quad)]) : {32{1'b0}}),
                                                            .txctrl((protocol == "xaui")? (tx_xgmctrlenable[(4 * num_quad) + 3 : (4 * num_quad)]) : {4{1'b0}}),
                                                            .rdenablesync((protocol == "xaui")? cent_unit_rdenablesync[num_quad] : 1'b0),
                                                            .txclk((protocol == "xaui")? refclk_pma[num_quad] : 1'b0),
                                                            .rxdatain((protocol == "xaui")? (rx_xgmdataout[(32 * num_quad) + 31 : (32 * num_quad)]) : {32{1'b0}}),
                                                            .rxctrl((protocol == "xaui")? (cent_unit_rx_ctrl[(4 * num_quad) + 3 : (4 * num_quad)]) : {4{1'b0}}),
                                                            .rxrunningdisp((protocol == "xaui")? (rx_xgmrunningdisp[(4 * num_quad) + 3 : (4 * num_quad)]) : {4{1'b0}}),
                                                            .rxdatavalid((protocol == "xaui")? (rx_xgmdatavalid[(4 * num_quad) + 3 : (4 * num_quad)]) : {4{1'b0}}),
                                                            .rxclk((protocol == "xaui")?((INT_RX_CLK2_MUX_SELECT == "core_clk")? rx_coreclk[(num_quad * 4)]: refclk_pma[num_quad]) : 1'b0),
                                                            .adet((protocol == "xaui")? (rx_adetectdeskew[(4 * num_quad) + 3 : (4 * num_quad)]) : {4{1'b0}}),
                                                            .syncstatus((protocol == "xaui")? (rx_syncstatusdeskew[(4 * num_quad) + 3 : (4 * num_quad)]) : {4{1'b0}}),
                                                            .rdalign((protocol == "xaui")? (rx_rdalign[(4 * num_quad) + 3 : (4 * num_quad)]) : {4{1'b0}}),
                                                            .recovclk((protocol == "xaui")? rx_masterclk[num_quad] : 1'b0),
                                                            .dprioin((INT_CMU_CONNECT_DPRIO == "true")? reconfig_togxb_in : 1'b0),
                                                            .dprioload((INT_CMU_CONNECT_DPRIO == "true")? reconfig_togxb_load : 1'b0),
                                                            .dpriodisable((INT_CMU_CONNECT_DPRIO == "true")? reconfig_togxb_disable : 1'b1),
                                                            .rxdprioin((INT_CMU_CONNECT_DPRIO == "true")? (cent_unit_rx_dprioin[((num_quad + 1) * 300 * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * 300 * NUMBER_CHANNELS_PER_QUAD)]) : {(300 * NUMBER_CHANNELS_PER_QUAD){1'b0}}),
                                                            .txdprioin((INT_CMU_CONNECT_DPRIO == "true")? (cent_unit_tx_dprioin[((num_quad + 1) * 150 * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * 150 * NUMBER_CHANNELS_PER_QUAD)]) : {(150 * NUMBER_CHANNELS_PER_QUAD){1'b0}}),
                                                            .cmuplldprioin((INT_CMU_CONNECT_DPRIO == "true")? pll_cmuplldprioout[(num_quad * 120) + 119 : (num_quad * 120)] : {120{1'b0}}),
                                                            .cmudividerdprioin((INT_CMU_CONNECT_DPRIO == "true")? (clk_div_cmudividerdprioin[(num_quad * 30) + 29 : (num_quad * 30)]) : {30{1'b0}}),
                                                            .refclkdividerdprioin((INT_CMU_CONNECT_DPRIO == "true")? (refclkdividerdprioin[(num_quad * 2) + 1 : (num_quad * 2)]) :  {2{1'b0}}),
                                                            // Output Port
                                                            .rxdigitalresetout(rx_digitalreset_out[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .rxanalogresetout(rx_analogreset_out[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .rxcruresetout(rx_rxcruresetout[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .rxadceresetout(rx_rxadceresetout[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .txdigitalresetout(tx_digitalreset_out[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .txanalogresetout(tx_analogreset_out[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .quadresetout(cent_unit_quadresetout[num_quad]),
                                                            .pllresetout(cent_unit_pllresetout[((3 * num_quad) + 2) : ( 3 * num_quad)]),
                                                            .rxadcepowerdn(cent_unit_rxadcepowerdn[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .rxcrupowerdn(cent_unit_rxcrupowerdn[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .rxibpowerdn(cent_unit_rxibpowerdn[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .txobpowerdn(cent_unit_txobpowerdn[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .txdividerpowerdn(cent_unit_txdividerpowerdn[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .txdetectrxpowerdn(cent_unit_txdetectrxpowerdn[((num_quad + 1) * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .clkdivpowerdn(cent_unit_clkdivpowerdn[num_quad]),
                                                            .pllpowerdn(cent_unit_pllpowerdn[((3 * num_quad) + 2) : ( 3 * num_quad)]),
                                                            .dprioout(reconfig_fromgxb[num_quad]),
                                                            .dpriooe(reconfig_fromgxb_oe[num_quad]),
                                                            .dpriodisableout(cent_unit_dpriodisableout[num_quad]),
                                                            .rxdprioout(cent_unit_rxdprioout[((num_quad + 1) * 300 * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * 300 * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .txdprioout(cent_unit_txdprioout[((num_quad + 1) * 150 * NUMBER_CHANNELS_PER_QUAD) - 1 : (num_quad * 150 * NUMBER_CHANNELS_PER_QUAD)]),
                                                            .cmuplldprioout(cent_unit_cmuplldprioout[(num_quad * 120) + 119 : (num_quad * 120)]),
                                                            .cmudividerdprioout(cent_unit_cmudividerdprioout[(num_quad * 30) + 29 : (num_quad * 30)]),
                                                            .alignstatus(rx_channelaligned_in[num_quad]),
                                                            .txdataout(cent_unit_tx_xgmdataout[(32 * num_quad) + 31 : (32 * num_quad)]),
                                                            .txctrlout(cent_unit_txctrlout[(4 * num_quad) + 3 : (4 * num_quad)]),
                                                            .rxdataout(cent_unit_rx_xgmdataout[(32 * num_quad) + 31 : (32 * num_quad)]),
                                                            .rxctrlout(rx_xgmctrlin[(4 * num_quad) + 3 : (4 * num_quad)]),
                                                            .enabledeskew(enabledeskew[num_quad]),
                                                            .fiforesetrd(rx_fiforesetrd[num_quad])
                                                            
                                                            
                                                        );
    defparam cent_unit.in_xaui_mode  = (protocol == "xaui")? "true" : "false";
    defparam cent_unit.dprio_config_mode = INT_RECONFIG_DPRIO_MODE;
    defparam cent_unit.portaddr = ((starting_channel_number + (4 * num_quad)) / 128) + 1;
    defparam cent_unit.devaddr = ((starting_channel_number / NUMBER_CHANNELS_PER_QUAD) + num_quad) % INT_MAX_DEVADDR + 1;
    defparam cent_unit.use_deskew_fifo = (protocol == "xaui")? "true" : rx_use_deskew_fifo;
    defparam cent_unit.offset_all_errors_align = INT_CENT_UNIT_OFFSET_ALL_ERRORS_ALIGN;
    defparam cent_unit.lpm_type = (lpm_type == "alt2gxb") ? "stratixiigx_hssi_central_management_unit" : "stratixiigx_hssi_central_management_unit";
    defparam cent_unit.bonded_quad_mode = (INT_BI_QUAD_BONDED == "true")? (((num_quad % 2)== 1)? "receiver" : "driver") : "none";
    defparam cent_unit.rx0_cru_clock0_physical_mapping = "iq0";
    defparam cent_unit.rx1_cru_clock0_physical_mapping = "iq0";
    defparam cent_unit.rx2_cru_clock0_physical_mapping = "iq0";
    defparam cent_unit.rx3_cru_clock0_physical_mapping = "iq0";
    defparam cent_unit.rx0_cru_clock1_physical_mapping = "iq1";
    defparam cent_unit.rx1_cru_clock1_physical_mapping = "iq1";
    defparam cent_unit.rx2_cru_clock1_physical_mapping = "iq1";
    defparam cent_unit.rx3_cru_clock1_physical_mapping = "iq1";
    defparam cent_unit.rx0_cru_clock2_physical_mapping = "iq2";
    defparam cent_unit.rx1_cru_clock2_physical_mapping = "iq2";
    defparam cent_unit.rx2_cru_clock2_physical_mapping = "iq2";
    defparam cent_unit.rx3_cru_clock2_physical_mapping = "iq2";
    defparam cent_unit.rx0_cru_clock3_physical_mapping = "iq3";
    defparam cent_unit.rx1_cru_clock3_physical_mapping = "iq3";
    defparam cent_unit.rx2_cru_clock3_physical_mapping = "iq3";
    defparam cent_unit.rx3_cru_clock3_physical_mapping = "iq3";
    defparam cent_unit.rx0_cru_clock4_physical_mapping = "iq4";
    defparam cent_unit.rx1_cru_clock4_physical_mapping = "iq4";
    defparam cent_unit.rx2_cru_clock4_physical_mapping = "iq4";
    defparam cent_unit.rx3_cru_clock4_physical_mapping = "iq4";
    defparam cent_unit.rx0_cru_clock5_physical_mapping = "pld_cru_clk";
    defparam cent_unit.rx1_cru_clock5_physical_mapping = "pld_cru_clk";
    defparam cent_unit.rx2_cru_clock5_physical_mapping = "pld_cru_clk";
    defparam cent_unit.rx3_cru_clock5_physical_mapping = "pld_cru_clk";
    defparam cent_unit.rx0_cru_clock6_physical_mapping = "refclk0";
    defparam cent_unit.rx1_cru_clock6_physical_mapping = "refclk0";
    defparam cent_unit.rx2_cru_clock6_physical_mapping = "refclk0";
    defparam cent_unit.rx3_cru_clock6_physical_mapping = "refclk0";
    defparam cent_unit.rx0_cru_clock7_physical_mapping = "refclk1";
    defparam cent_unit.rx1_cru_clock7_physical_mapping = "refclk1";
    defparam cent_unit.rx2_cru_clock7_physical_mapping = "refclk1";
    defparam cent_unit.rx3_cru_clock7_physical_mapping = "refclk1";
    defparam cent_unit.rx0_cru_clock8_physical_mapping = "cmu_div_clk";
    defparam cent_unit.rx1_cru_clock8_physical_mapping = "cmu_div_clk";
    defparam cent_unit.rx2_cru_clock8_physical_mapping = "cmu_div_clk";
    defparam cent_unit.rx3_cru_clock8_physical_mapping = "cmu_div_clk";
    defparam cent_unit.tx0_pll_fast_clk0_physical_mapping = "pll0";
    defparam cent_unit.tx0_pll_fast_clk1_physical_mapping = "pll1"; 
    defparam cent_unit.tx1_pll_fast_clk0_physical_mapping = "pll0"; 
    defparam cent_unit.tx1_pll_fast_clk1_physical_mapping = "pll1"; 
    defparam cent_unit.tx2_pll_fast_clk0_physical_mapping = "pll0"; 
    defparam cent_unit.tx2_pll_fast_clk1_physical_mapping = "pll1"; 
    defparam cent_unit.tx3_pll_fast_clk0_physical_mapping = "pll0"; 
    defparam cent_unit.tx3_pll_fast_clk1_physical_mapping = "pll1";
    defparam cent_unit.rx_dprio_width = 1200;
    defparam cent_unit.tx_dprio_width = 600;
    defparam cent_unit.pll0_inclk0_logical_to_physical_mapping = "iq0";
    defparam cent_unit.pll0_inclk1_logical_to_physical_mapping = "iq1";
    defparam cent_unit.pll0_inclk2_logical_to_physical_mapping = "iq2";
    defparam cent_unit.pll0_inclk3_logical_to_physical_mapping = "iq3";
    defparam cent_unit.pll0_inclk4_logical_to_physical_mapping = "iq4";
    defparam cent_unit.pll0_inclk5_logical_to_physical_mapping = "pld_clk";
    defparam cent_unit.pll0_inclk6_logical_to_physical_mapping = "clkrefclk0";
    defparam cent_unit.pll0_inclk7_logical_to_physical_mapping = "clkrefclk1";
    defparam cent_unit.pll1_inclk0_logical_to_physical_mapping = "iq0";
    defparam cent_unit.pll1_inclk1_logical_to_physical_mapping = "iq1";
    defparam cent_unit.pll1_inclk2_logical_to_physical_mapping = "iq2";
    defparam cent_unit.pll1_inclk3_logical_to_physical_mapping = "iq3";
    defparam cent_unit.pll1_inclk4_logical_to_physical_mapping = "iq4";
    defparam cent_unit.pll1_inclk5_logical_to_physical_mapping = "pld_clk";
    defparam cent_unit.pll1_inclk6_logical_to_physical_mapping = "clkrefclk0";
    defparam cent_unit.pll1_inclk7_logical_to_physical_mapping = "clkrefclk1";
    defparam cent_unit.sim_dump_dprio_internal_reg_at_time = sim_dump_dprio_internal_reg_at_time;
    defparam cent_unit.sim_dump_filename = sim_dump_filename;
    
    defparam cent_unit.analog_test_bus_enable = (rx_adaptive_equalization_mode == "continuous" ? "true" : "false"); 
   
    if (INT_CMU_CLK_DIV_EN == "true")
    begin
              
        // Generate cmu clock divider
        assign coreclkout[num_quad] = coreclkout_wire[num_quad];
    
         if (cmu_pll_log_index == 1)
         begin
                assign  clk_div_clkin[num_quad * 3] = pll1_out[num_quad];
                assign  clk_div_clkin[(num_quad * 3) + 1] = pll0_out[num_quad];
         end
         else
         begin
                assign  clk_div_clkin[num_quad * 3] = pll0_out[num_quad];
                assign  clk_div_clkin[(num_quad * 3) + 1] = pll1_out[num_quad];
         end
       
       
    
        if ((INT_BI_QUAD_BONDED == "true") && ((num_quad % 2) != 0))
        begin
            assign clk_div_pclkin[num_quad] = clk_div_pclkx8out[num_quad - 1];
        end
                
    
        stratixiigx_hssi_cmu_clock_divider clk_div  (   .clk(clk_div_clkin[(3 * num_quad) + 2 : (num_quad * 3)]),
                                                        .pclkin(clk_div_pclkin[num_quad]),
                                                        .powerdn(cent_unit_clkdivpowerdn[num_quad]),
                                                        .quadreset(cent_unit_quadresetout[num_quad]),
                                                        .dprioin(cent_unit_cmudividerdprioout[(num_quad * 30) + 29 : (num_quad * 30)]),
                                                        .dpriodisable(cent_unit_dpriodisableout[num_quad]),
                                                         // Output port
                                                        .digitalrefclkout(refclk_pma[num_quad]),
                                                        .analogfastrefclkout(analogfastrefclkout[num_quad]),
                                                        .analogrefclkout(analogrefclkout[num_quad]),
                                                        .pclkx8out(clk_div_pclkx8out[num_quad]),
                                                        .dprioout(clk_div_cmudividerdprioin[(num_quad * 30) + 29 : (num_quad * 30)]),
                                                        .coreclkout(coreclkout_wire[num_quad])
                                                     );
         defparam clk_div.inclk_select = INT_CMU_CLK_DIV_INCLK_SEL;
         defparam clk_div.use_digital_refclk_post_divider  = INT_CMU_CLK_DIV_USE_DIGITAL_REFCLK_POST_DIVIDER;
         defparam clk_div.use_coreclk_out_post_divider  = INT_CLK_DIV_USE_CORECLK_OUT_POST_DIVIDER;
         defparam clk_div.divide_by = INT_CMU_CLK_DIV_DIVIDE_BY;
         defparam clk_div.enable_pclk_x8_out = (INT_BI_QUAD_BONDED == "true")? "true" : "false";
         defparam clk_div.select_neighbor_pclk = ((num_quad % 2) != 0)? INT_CLK_DIV_SELECT_PCLK : "false";
         defparam clk_div.enable_refclk_out = ((INT_QUAD_BONDED == "true") || (INT_BI_QUAD_BONDED == "true") || (use_global_clk_divider == "true") || (reconfig_use_global_clk_divider == "true")) ? "true" : "false";
         defparam clk_div.sim_analogrefclkout_phase_shift = 0;
         defparam clk_div.sim_analogfastrefclkout_phase_shift = 0;
         defparam clk_div.sim_digitalrefclkout_phase_shift = 0;
         defparam clk_div.sim_pclkx8out_phase_shift = 0;
         defparam clk_div.sim_coreclkout_phase_shift = 0;
    end
    else
    begin
         assign coreclkout[num_quad] = 1'b0;
        assign coreclkout_wire[num_quad] = 1'b0;
         
    end
         
    if (((INT_BI_QUAD_BONDED == "true") && ((num_quad % 2) == 0)) ||
        ((INT_BI_QUAD_BONDED == "false") && ((INT_RECONFIG_CMU_PLL_RECONFIG == "true") || (operation_mode != "rx"))))
    begin
        
        if (INT_RECONFIG_CMU_PLL_RECONFIG == "true")
            
                          
          // Generate the clock input for the CMU PLLs when CMU PLL reconfiguration is turned on 
        	for (num_pll_inclk=0; num_pll_inclk < MAX_PLL_INCLK; num_pll_inclk = num_pll_inclk + 1) begin:pll_inclk_loop
				if ((INT_RECONFIG_PLL_REFCLK_DIV0_INDEX != 7) && (INT_RECONFIG_PLL_REFCLK_DIV0_INDEX == num_pll_inclk))
					assign pll0_clkin[(num_quad * 8) + num_pll_inclk] = cmu_refclk_div_out[num_quad];
                else if ((INT_RECONFIG_PLL_REFCLK_DIV1_INDEX != 7) && (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX == num_pll_inclk))
                	assign pll0_clkin[(num_quad * 8) + num_pll_inclk] = cmu_refclk_div_reconfig_out[num_quad];
                else if (num_pll_inclk < reconfig_pll_inclk_width)
                    assign pll0_clkin[(num_quad * 8) + num_pll_inclk] = cmu_refclk_div_other_out[num_pll_inclk];
                else
                	assign pll0_clkin[(num_quad * 8) + num_pll_inclk] = 1'b0;
                end
             
                
        else
        begin
            if (INT_CMU_REFCLK_DIVIDER_GEN == "true")
                assign pll0_clkin[(num_quad * 8) + 7 : (num_quad * 8)] = {6'b0, cmu_refclk_div_out[num_quad],1'b0};
            else
                assign pll0_clkin[(num_quad * 8) + 7 : (num_quad * 8)] = {5'b0,pll_inclk_wire,2'b0};
        end
        
    end
    if (((INT_BI_QUAD_BONDED == "true") && ((num_quad % 2) == 0)) ||
        ((INT_BI_QUAD_BONDED == "false") && (operation_mode != "rx")))
    begin
        tri0 [(NUMBER_OF_QUADS * 40) -1 : 0] pll0_dprioin;
        tri0 [(NUMBER_OF_QUADS * 40) -1 : 0] pll0_dprioout;
        localparam integer INT_MSB_CONST = 8 - reconfig_pll_inclk_width;
      
        if (cmu_pll_log_index == 1)
        begin
            assign pllreset_in[(num_quad * 2)] = cent_unit_pllresetout[(num_quad * 3) + 1];
            assign pllpowerdn_in[(num_quad * 2)] = cent_unit_pllpowerdn[(num_quad * 3) + 1];
            assign pll0_dprioin[(num_quad * 40) + 39 : (num_quad * 40)] = cent_unit_cmuplldprioout[(num_quad * 120) + 79 : (num_quad * 120) + 40];
            assign pll_cmuplldprioout[(num_quad * 120) + 79 : (num_quad * 120) + 40] = pll0_dprioout[(num_quad * 40) + 39 : (num_quad * 40)];
        end
        else
        begin
            assign pllreset_in[(num_quad * 2)] = cent_unit_pllresetout[(num_quad * 3)];
            assign pllpowerdn_in[(num_quad * 2)] = cent_unit_pllpowerdn[(num_quad * 3)];
            assign pll0_dprioin[(num_quad * 40) + 39 : (num_quad * 40)] = cent_unit_cmuplldprioout[(num_quad * 120) + 39 : (num_quad * 120)];
            assign pll_cmuplldprioout[(num_quad * 120) + 39 : (num_quad * 120)] = pll0_dprioout[(num_quad * 40) + 39 : (num_quad * 40)];
        end
                
        localparam INT_CMU_PLL0_VCO_RANGE = (INT_IS_PIPE_GEN_2 == "true")? "high" : "low"; 
        
        // Generate PLL
        stratixiigx_hssi_cmu_pll  pll0  (   .clk(pll0_clkin[(num_quad * 8) + 7 : (num_quad * 8)]),
                                            .pllreset(pllreset_in[(num_quad * 2)]),
                                            .pllpowerdn(pllpowerdn_in[(num_quad * 2)]),
                                            .dprioin(pll0_dprioin[(num_quad * 40) + 39 : (num_quad * 40)]),
                                            .dpriodisable(cent_unit_dpriodisableout[num_quad]),
                                            .clkout(pll0_out[num_quad]),
                                            .locked(pll_locked_out[num_quad]),
                                            .dprioout(pll0_dprioout[(num_quad * 40) + 39 : (num_quad * 40)])
                                        );
            defparam pll0.pfd_clk_select = INT_CMU_PLL_PFD_CLK_SELECT;
            defparam pll0.multiply_by = INT_CMU_PLL_MULTIPLY_BY;
            defparam pll0.divide_by = 1;
            defparam pll0.pll_type = "normal";
            defparam pll0.vco_range = INT_CMU_PLL0_VCO_RANGE;
            defparam pll0.low_speed_test_sel = 0;
            defparam pll0.dprio_config_mode = INT_RECONFIG_DPRIO_MODE;
            defparam pll0.pll_number = cmu_pll_log_index;
            defparam pll0.inclk0_period = INT_CMU_PLL0_INCLK0_PERIOD;
            defparam pll0.inclk1_period = INT_CMU_PLL0_INCLK1_PERIOD;
            defparam pll0.inclk2_period = INT_CMU_PLL0_INCLK2_PERIOD;
            defparam pll0.inclk3_period = INT_CMU_PLL0_INCLK3_PERIOD;
            defparam pll0.inclk4_period = INT_CMU_PLL0_INCLK4_PERIOD;
            defparam pll0.inclk5_period = INT_CMU_PLL0_INCLK5_PERIOD;
            defparam pll0.inclk6_period = INT_CMU_PLL0_INCLK6_PERIOD;
            defparam pll0.remapped_to_new_loop_filter_charge_pump_settings = "false";
            defparam pll0.sim_clkout_phase_shift = tx_pll_sim_clkout_phase_shift;
            defparam pll0.loop_filter_resistor_control = INT_CMU_PLL_BW;
            defparam pll0.charge_pump_current_control = INT_CMU_PLL_BW_CPC;
            defparam pll0.protocol_hint = INT_PROTOCOL_HINT;
            defparam pll0.enable_pll_cascade = enable_pll_cascade;
            
        

            if ((gen_reconfig_pll == "true") && (INT_RECONFIG_DPRIO_MODE != 0))
            begin
                 
                tri0 [(NUMBER_OF_QUADS * 40) -1 : 0] pll1_dprioin;
                tri0 [(NUMBER_OF_QUADS * 40) -1 : 0] pll1_dprioout;
                
                if (cmu_pll_reconfig_log_index == 1)
                begin
                    assign pllreset_in[(num_quad * 2) + 1] = cent_unit_pllresetout[(num_quad * 3) + 1];
                    assign pllpowerdn_in[(num_quad * 2) + 1] = cent_unit_pllpowerdn[(num_quad * 3) + 1];
                    assign pll1_dprioin[(num_quad * 40) + 39 : (num_quad * 40)] = cent_unit_cmuplldprioout[(num_quad * 120) + 79 : (num_quad * 120) + 40];
                    assign pll_cmuplldprioout[(num_quad * 120) + 79 : (num_quad * 120) + 40] = pll1_dprioout[(num_quad * 40) + 39 : (num_quad * 40)];
                end
                else
                begin
                    assign pllreset_in[(num_quad * 2) + 1] = cent_unit_pllresetout[(num_quad * 3)];
                    assign pllpowerdn_in[(num_quad * 2) + 1] = cent_unit_pllpowerdn[(num_quad * 3)];
                    assign pll1_dprioin[(num_quad * 40) + 39 : (num_quad * 40)] = cent_unit_cmuplldprioout[(num_quad * 120) + 39 : (num_quad * 120)];
                    assign pll_cmuplldprioout[(num_quad * 120) + 39 : (num_quad * 120)] = pll1_dprioout[(num_quad * 40) + 39 : (num_quad * 40)];
                end
            
                                         
                if (INT_RECONFIG_CMU_PLL_RECONFIG == "true")
                
                    assign pll1_clkin[(num_quad * 8) + 7 : (num_quad * 8)] = pll0_clkin[(num_quad * 8) + 7 : (num_quad * 8)];
                
                else
                begin
                    if (INT_CMU_REFCLK_RECONFIG_DIVIDER_GEN == "false") 
                        assign pll1_clkin[(num_quad * 8) + 7 : (num_quad * 8)] = {5'b0,pll1_inclk_wire,2'b0};
                    else
                        assign pll1_clkin[(num_quad * 8) + 7 : (num_quad * 8)] = {6'b0,cmu_refclk_div_reconfig_out[num_quad],1'b0};
                end

                localparam INT_CMU_PLL1_VCO_RANGE = (INT_RECONFIG_IS_PIPE_GEN_2 == "true")? "high" : "low";
                
                // Generate PLL for reconfiguration
                stratixiigx_hssi_cmu_pll  pll1  (   .clk(pll1_clkin[(num_quad * 8) + 7 : (num_quad * 8)]),
                                                    .pllreset(pllreset_in[(num_quad * 2) + 1]),
                                                    .pllpowerdn(pllpowerdn_in[(num_quad * 2) + 1]),
                                                    .dprioin(pll1_dprioin[(num_quad * 40) + 39 : (num_quad * 40)]),
                                                    .dpriodisable(cent_unit_dpriodisableout[num_quad]),
                                                    .clkout(pll1_out[num_quad]),
                                                    .locked(pll_locked_alt_out[num_quad]),
                                                    .dprioout(pll1_dprioout[(num_quad * 40) + 39 : (num_quad * 40)])
                                                );
                defparam pll1.pfd_clk_select = INT_CMU_PLL_RECONFIG_PFD_CLK_SELECT;
                defparam pll1.multiply_by = INT_CMU_PLL_RECONFIG_MULTIPLY_BY;
                defparam pll1.divide_by = 1;
                defparam pll1.pll_type = "normal";
                defparam pll1.vco_range = INT_CMU_PLL1_VCO_RANGE;
                defparam pll1.low_speed_test_sel = 0;
                defparam pll1.dprio_config_mode = INT_RECONFIG_DPRIO_MODE;
                defparam pll1.pll_number = cmu_pll_reconfig_log_index;
                defparam pll1.inclk0_period = INT_CMU_PLL0_INCLK0_PERIOD;
                defparam pll1.inclk1_period = INT_CMU_PLL1_INCLK1_PERIOD ;
                defparam pll1.inclk2_period = INT_CMU_PLL1_INCLK2_PERIOD;
                defparam pll1.inclk3_period = INT_CMU_PLL0_INCLK3_PERIOD;
                defparam pll1.inclk4_period = INT_CMU_PLL0_INCLK4_PERIOD;
                defparam pll1.inclk5_period = INT_CMU_PLL0_INCLK5_PERIOD;
                defparam pll1.inclk6_period = INT_CMU_PLL0_INCLK6_PERIOD;
                defparam pll1.remapped_to_new_loop_filter_charge_pump_settings = "false";
                defparam pll1.sim_clkout_phase_shift = tx_pll_reconfig_sim_clkout_phase_shift;
                defparam pll1.loop_filter_resistor_control = INT_CMU_PLL_RECONFIG_BW;
                defparam pll1.charge_pump_current_control = INT_CMU_PLL_RECONFIG_BW_CPC;
                defparam pll1.protocol_hint = INT_RECONFIG_PROTOCOL_HINT;
                defparam pll1.enable_pll_cascade = enable_reconfig_pll_cascade;
            end
            else
            begin
                assign pll_locked_alt_out[num_quad] = 1'b0;
            end
    end
    else
    begin
        assign pll_locked_out[num_quad] = 1'b0;
        assign pll_locked_alt_out[num_quad] = 1'b0;
    end
     
        
    if ((INT_BI_QUAD_BONDED == "true") && ((num_quad % 2) != 0))
    begin
        assign pll_locked[num_quad] = pll_locked[num_quad - 1];
        assign pll0_out[num_quad]= 1'b0;
        assign pll_locked_alt[num_quad] = pll_locked_alt_out[num_quad];
    end
    else
    begin
        assign pll_locked[num_quad] = pll_locked_out[num_quad];
        assign pll_locked_alt[num_quad] = pll_locked_alt_out[num_quad];
    end
   
    
    // Generate refclk divider primitive

    if ((((INT_BI_QUAD_BONDED == "true") && ((num_quad % 2) == 0)) ||
            (INT_BI_QUAD_BONDED == "false")) && (INT_CMU_REFCLK_DIVIDER_GEN == "true"))
    begin
        stratixiigx_hssi_refclk_divider refclk_div  (   .inclk (pll_inclk_wire),
                                                        .clkout(cmu_refclk_div_out[num_quad])
                                                     );
        defparam refclk_div.enable_divider = INT_CMU_REFCLK_DIVIDER_ENABLE;
        defparam refclk_div.divider_number = 0;
        defparam refclk_div.refclk_coupling_termination = INT_CMU_REFCLK_DIV_COUPLING_TERMINATION;
    end

    // Generate 2nd refclk divider primitive for the reconfig PLL when CMU PLL reconfiguration is turned off and
    // for CMU PLL when CMU PLL reconfiguration is turned on

    if ((((INT_BI_QUAD_BONDED == "true") && ((num_quad % 2) == 0)) ||
       (INT_BI_QUAD_BONDED == "false")) && (INT_CMU_REFCLK_RECONFIG_DIVIDER_GEN == "true"))
    begin
        stratixiigx_hssi_refclk_divider refclk_div_reconf  (   .inclk (pll1_inclk_wire),
                                                               .clkout(cmu_refclk_div_reconfig_out[num_quad])
                                                            );
        defparam refclk_div_reconf.enable_divider = INT_CMU_REFCLK_RECONFIG_DIVIDER_ENABLE;
        defparam refclk_div_reconf.divider_number = 0;
        defparam refclk_div_reconf.refclk_coupling_termination = INT_CMU_REFCLK_DIV_COUPLING_TERMINATION;
    end
    
    // Generate other refclk divider
    if ((INT_RECONFIG_CMU_PLL_RECONFIG == "true") && (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX < 6) && (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX < reconfig_pll_inclk_width-1))
    begin
         tri0 [MAX_PLL_INCLK - 1 : 0] refclk_div_iqclk_in; 
        if ((INT_RECONFIG_CMU_PLL_RECONFIG == "true") && (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX != 7) && (reconfig_pll_inclk_width > 2))
            assign refclk_div_iqclk_in[reconfig_pll_inclk_width - 1 : INT_RECONFIG_PLL_REFCLK_DIV1_INDEX + 1] = pll_inclk_rx_cruclk[reconfig_pll_inclk_width - 1 : INT_RECONFIG_PLL_REFCLK_DIV1_INDEX + 1];
            
        for (refclk_div_count = (INT_RECONFIG_PLL_REFCLK_DIV1_INDEX + 1); refclk_div_count < 7; refclk_div_count = refclk_div_count + 1 ) begin:other_refclk_div 
            if (((refclk_div_count == 6) && (enable_pll_inclk6_divider == "true")) ||
                ((refclk_div_count == 5) && (enable_pll_inclk5_divider == "true")) ||
                ((refclk_div_count == 4) && (enable_pll_inclk4_divider == "true")) ||
                ((refclk_div_count == 3) && (enable_pll_inclk3_divider == "true")) ||
                ((refclk_div_count == 2) && (enable_pll_inclk2_divider == "true")))
            begin
                  stratixiigx_hssi_refclk_divider refclk_div_iqclk  (   .inclk (refclk_div_iqclk_in[refclk_div_count]),
                                                                        .clkout(cmu_refclk_div_other_out[(num_quad * 8) + refclk_div_count])
                                                                    );
                  defparam refclk_div_iqclk.enable_divider = INT_CMU_REFCLK_RECONFIG_DIVIDER_ENABLE;
                  defparam refclk_div_iqclk.divider_number = 0;
                  defparam refclk_div_iqclk.refclk_coupling_termination = INT_CMU_REFCLK_DIV_COUPLING_TERMINATION;
            
            end
            else if (refclk_div_count < reconfig_pll_inclk_width)
                assign cmu_refclk_div_other_out[(num_quad * 8) + refclk_div_count] = pll_inclk_rx_cruclk[refclk_div_count];
         end
        // End For loop for refclk divider
        
        assign cmu_refclk_div_other_out[(num_quad * 8) + INT_RECONFIG_PLL_REFCLK_DIV1_INDEX : (num_quad * 8)] = pll_inclk_rx_cruclk[ INT_RECONFIG_PLL_REFCLK_DIV1_INDEX : 0];
        
    end
    else
        if (INT_RECONFIG_CMU_PLL_RECONFIG == "true")
            assign cmu_refclk_div_other_out[(num_quad * 7) + (reconfig_pll_inclk_width - 1) : (num_quad * 7)] = pll_inclk_rx_cruclk[(reconfig_pll_inclk_width - 1) : 0];
     

    if (((operation_mode == "tx") || (operation_mode == "duplex")) && ((INT_BI_QUAD_BONDED != "true") || (INT_QUAD_BONDED != "true")))
    begin
         
         if (INT_RECONFIG_DPRIO_MODE != 0)
         begin
            if (cmu_pll_log_index == 1)
            begin
                assign tx_pllfastclk_in[(num_quad * 2) + 1] = pll0_out[num_quad];
                assign tx_pllfastclk_in[(num_quad * 2)] = pll1_out[num_quad];
            end
            else
            begin
                assign tx_pllfastclk_in[(num_quad * 2)] = pll0_out[num_quad];
                assign tx_pllfastclk_in[(num_quad * 2) + 1] = pll1_out[num_quad];
            end
         end
         else
            assign tx_pllfastclk_in[(num_quad * 2)] = pll0_out[num_quad];
    end
    
    if ((num_quad % 2) == 0)
    begin
        assign coreclkout_bi_quad_wire[num_quad/2] = coreclkout_wire[num_quad];
    end
    
   
end
endgenerate
// End generate for Quad Level


// Transmitter generation
generate for (num_tx=0; num_tx < number_of_channels; num_tx = num_tx + 1) begin:channel_tx
    if ((operation_mode != "rx") || (operation_mode == "duplex"))
    begin
          
        if (tx_channel_bonding == "indv")
            assign tx_digitalreset_in[num_tx] = tx_digitalreset[num_tx]; 
        else if (INT_TX_IS_QUAD_BONDED == "true")
            assign tx_digitalreset_in[num_tx] = tx_digitalreset[num_tx/NUMBER_CHANNELS_PER_QUAD];
        else
            assign tx_digitalreset_in[num_tx] = tx_digitalreset[num_tx/NUMBER_CHANNELS_PER_BI_QUAD];
            
        assign fixedclk_in[num_tx] = fixedclk;        
        assign debug_tx_phase_comp_fifo_error[num_tx] = tx_phfifooverflowout[num_tx] || tx_phfifounderflowout[num_tx];
        
        assign tx_phfifooverflow[num_tx] = tx_phfifooverflowout[num_tx];
        assign tx_phfifounderflow[num_tx] = tx_phfifounderflowout[num_tx];
        assign tx_clkout[num_tx] = (((INT_EN_CLOCK_SCHEME == "true") && (tx_reconfig_clk_scheme == "indv_clk_source")) || ((protocol == "cpri") && (INT_EN_CLOCK_SCHEME == "false")))? tx_clkout_int_wire[num_tx] : tx_core_clkout_wire[num_tx];  
        assign tx_core_clkout_wire[num_tx] = tx_clkout_int_wire[(num_tx % NUMBER_CHANNELS_PER_QUAD) == 0 ? num_tx : (num_tx/NUMBER_CHANNELS_PER_QUAD)*NUMBER_CHANNELS_PER_QUAD];    
        assign tx_coreclk_in[num_tx] =  (tx_use_coreclk == "true")? tx_coreclk[num_tx] :
                                        (INT_TX_IS_QUAD_BONDED == "true")? coreclkout_wire[num_tx/NUMBER_CHANNELS_PER_QUAD] :
                                        (INT_TX_IS_BI_QUAD_BONDED == "true")? coreclkout_bi_quad_wire[num_tx/NUMBER_CHANNELS_PER_BI_QUAD]:
                                        (((INT_EN_CLOCK_SCHEME == "true") && (tx_reconfig_clk_scheme == "indv_clk_source")) || ((protocol == "cpri") && (INT_EN_CLOCK_SCHEME == "false")))? tx_clkout_int_wire[num_tx] : tx_core_clkout_wire[num_tx];                                      
                    
        if (INT_RECONFIG_DPRIO_MODE != 0)
        begin
            assign tx_dprioin_wire[(num_tx * 150) + 99 : (num_tx * 150)] = cent_unit_txdprioout[(num_tx * 100) + ((num_tx / NUMBER_CHANNELS_PER_QUAD) * 200) + 99 : (num_tx * 100) + ((num_tx / NUMBER_CHANNELS_PER_QUAD) * 200)];
            assign tx_dprioin_wire[(num_tx * 150) + 149 : (num_tx * 150) + 100] = cent_unit_txdprioout[(num_tx * 50) + (((num_tx / NUMBER_CHANNELS_PER_QUAD) + 1) * 400) + 49 : (num_tx * 50) + (((num_tx / NUMBER_CHANNELS_PER_QUAD) + 1) * 400)];
            assign cent_unit_tx_dprioin[(num_tx * 100) + ((num_tx / NUMBER_CHANNELS_PER_QUAD) * 200) + 99 : (num_tx * 100) + ((num_tx / NUMBER_CHANNELS_PER_QUAD) * 200)] = tx_txdprioout[(num_tx * 150) + 99 : (num_tx * 150)];
            assign cent_unit_tx_dprioin[(num_tx * 50) + (((num_tx / NUMBER_CHANNELS_PER_QUAD) + 1) * 400)  + 49 : (num_tx * 50) + (((num_tx / NUMBER_CHANNELS_PER_QUAD) + 1) * 400)] = tx_txdprioout[(num_tx * 150) + 149  : (num_tx * 150) + 100];
        end
        else
        begin
            assign tx_dprioin_wire[(num_tx * 150) + 149 : (num_tx * 150)] = {150{1'b0}};
            assign cent_unit_tx_dprioin[(num_tx * 150) + 149 : (num_tx * 150)] = {150{1'b0}};
        end
                
        stratixiigx_hssi_transmitter transmit ( .datain(tx_datain_wire[(tx_channel_width *(num_tx + 1)) - 1 : (tx_channel_width*num_tx)]),
                                                .datainfull((INT_RECONFIG_CHANNEL_INTERFACE ==  "true")? tx_datainfull[(44 *(num_tx + 1)) - 1 : (44 * num_tx)] : 44'b0),
                                                .ctrlenable((tx_8b_10b_mode != "none")? (tx_ctrlenable[(INT_TX_DWIDTH_FACTOR * (num_tx + 1)) - 1 : (INT_TX_DWIDTH_FACTOR * num_tx)]) : {INT_TX_DWIDTH_FACTOR{1'b0}}),
                                                .forcedisp((tx_8b_10b_mode != "none")? (tx_forcedisp_wire[(INT_TX_DWIDTH_FACTOR * (num_tx + 1)) - 1 : (INT_TX_DWIDTH_FACTOR * num_tx)]) : {INT_TX_DWIDTH_FACTOR{1'b0}}),
                                                .dispval((tx_8b_10b_mode != "none")? (tx_dispval[(INT_TX_DWIDTH_FACTOR * (num_tx + 1)) - 1 : (INT_TX_DWIDTH_FACTOR * num_tx)]) : {INT_TX_DWIDTH_FACTOR{1'b0}}),
                                                .revserialfdbk((INT_TX_EN_REVSERIAL_LPBK == "true")? rx_revserialfdbkout[num_tx] : 1'b0),
                                                .revparallelfdbk((reverse_loopback_mode == "rplb")? (rx_revparallelfdbkdata[((20 * num_tx) + 19) : ( 20 * num_tx)]) : {20{1'b0}}),
                                                .enrevparallellpbk((reverse_loopback_mode == "rplb")? tx_revparallellpbken[num_tx] : 1'b0),
                                                .detectrxloop((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? tx_detectrxloop[num_tx] : 1'b0),
                                                .forceelecidle(((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")||(protocol == "6g_basic") ||(protocol == "3g_basic"))? tx_forceelecidle[num_tx] : 1'b0),
                                                .forcedispcompliance((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? tx_forcedispcompliance[num_tx]: 1'b0),
                                                .powerdn((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? powerdn[((num_tx + 1)*2) - 1 : num_tx * 2] : {2{1'b0}}),
                                                .digitalreset(tx_digitalreset_out[num_tx]),
                                                .phfiforeset(tx_phfiforeset[num_tx]),
                                                .invpol(tx_invpolarity[num_tx]),
                                                .coreclk(tx_coreclk_in[num_tx]),
                                                .pipestatetransdone((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? rx_pipestatetransdoneout[num_tx] : 1'b0),
                                                .phfifowrenable(1'b1),
                                                .phfiforddisable(1'b0),
                                                .phfifox4wrenable((INT_TX_IS_QUAD_BONDED == "true")? tx_phfifox4wrenable[num_tx / NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                .phfifox4rdenable((INT_TX_IS_QUAD_BONDED == "true")? tx_phfifox4rdenable[num_tx / NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                .phfifox4rdclk((INT_TX_IS_QUAD_BONDED == "true")? tx_phfifox4rdclk[num_tx / NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                .phfifox4bytesel((INT_TX_IS_QUAD_BONDED == "true")? tx_phfifox4bytesel[num_tx / NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                .phfifox8wrenable((INT_TX_IS_BI_QUAD_BONDED == "true")? tx_phfifox8wrenable[num_tx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b1),
                                                .phfifox8rdenable((INT_TX_IS_BI_QUAD_BONDED == "true")? tx_phfifox8rdenable[num_tx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b1),
                                                .phfifox8rdclk((INT_TX_IS_BI_QUAD_BONDED == "true")? tx_phfifox8rdclk[num_tx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b1),
                                                .phfifox8bytesel((INT_TX_IS_BI_QUAD_BONDED == "true")? tx_phfifox8bytesel[num_tx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b0),
                                                .pllfastclk(tx_pllfastclk_in[((num_tx / NUMBER_CHANNELS_PER_QUAD) * 2) + 1 : (num_tx / NUMBER_CHANNELS_PER_QUAD) * 2]),
                                                .analogx4refclk(((INT_TX_IS_BI_QUAD_BONDED == "true") && ((num_tx % NUMBER_CHANNELS_PER_BI_QUAD) <= 3)) || ((tx_channel_bonding != "x8") && (INT_TX_SERIALIZER_CLK_SELECT == "analogx4refclk"))? 
                                                                 analogrefclkout[(num_tx / NUMBER_CHANNELS_PER_QUAD)] : 1'b0),
                                                .analogx4fastrefclk(((INT_TX_IS_BI_QUAD_BONDED == "true") && ((num_tx % NUMBER_CHANNELS_PER_BI_QUAD) <= 3)) || ((tx_channel_bonding != "x8") && (INT_TX_SERIALIZER_CLK_SELECT == "analogx4refclk"))? 
                                                                    analogfastrefclkout[(num_tx / NUMBER_CHANNELS_PER_QUAD)] : 1'b0),
                                                .analogx8refclk(((INT_TX_IS_BI_QUAD_BONDED == "true") && (((num_tx % NUMBER_CHANNELS_PER_BI_QUAD) > 3)))? analogrefclkout[(num_tx / NUMBER_CHANNELS_PER_BI_QUAD) * 2] : 1'b0),
                                                .analogx8fastrefclk(((INT_TX_IS_BI_QUAD_BONDED == "true")&& ((num_tx % NUMBER_CHANNELS_PER_BI_QUAD) > 3))?  analogfastrefclkout[(num_tx / NUMBER_CHANNELS_PER_BI_QUAD) * 2] : 1'b0),
                                                .refclk(refclk_pma[(num_tx / NUMBER_CHANNELS_PER_QUAD)]),
                                                .quadreset(cent_unit_quadresetout[(num_tx / NUMBER_CHANNELS_PER_QUAD)]),
                                                .analogreset(tx_analogreset_out[num_tx]),
                                                .obpowerdn(cent_unit_txobpowerdn[num_tx]),
                                                .dividerpowerdn(cent_unit_txdividerpowerdn[num_tx]),
                                                .detectrxpowerdn(cent_unit_txdetectrxpowerdn[num_tx]),
                                                .xgmdatain(cent_unit_tx_xgmdataout[(8 * num_tx) + 7 : (8 * num_tx)]),
                                                .xgmctrl(cent_unit_txctrlout[num_tx]),
                                                .dprioin(tx_dprioin_wire[(num_tx * 150) + 149 : (num_tx * 150)]),
                                                .dpriodisable((INT_RECONFIG_DPRIO_MODE != 0)? cent_unit_dpriodisableout[num_tx/NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                // Output Port
                                                .clkout(tx_clkout_int_wire[num_tx]),
                                                .dataout(tx_dataout[num_tx]),
                                                .refclkout(tx_localrefclk[num_tx]),
                                                .serialfdbkout(tx_serialfdbkout[num_tx]),
                                                .parallelfdbkout(tx_parallelfdbkout[((20 * num_tx) + 19) : (num_tx * 20)]),
                                                .xgmdataout(tx_xgmdataout[(8 * num_tx) + 7 : (8 * num_tx)]),
                                                .xgmctrlenable(tx_xgmctrlenable[num_tx]),
                                                .rdenablesync(tx_rdenablesync[num_tx]),
                                                .pipepowerstateout(tx_pipepowerstateout[(4 * num_tx) + 3 :(4 * num_tx)]),
                                                .pipepowerdownout(tx_pipepowerdownout[(2 * num_tx) + 1 : (2 * num_tx)]),
                                                .rxfoundout(tx_rxfoundout[(num_tx * 2) + 1 : (num_tx * 2)]),
                                                .phfifooverflow(tx_phfifooverflowout[num_tx]),
                                                .phfifounderflow(tx_phfifounderflowout[num_tx]),
                                                .phfifowrenableout(tx_phfifowrenableout[num_tx]),
                                                .phfifordenableout(tx_phfifordenableout[num_tx]),
                                                .phfifordclkout(tx_phfifordclkout[num_tx]),
                                                .phfifobyteselout(tx_phfifobyteselout[num_tx]),
                                                .rxdetectvalidout(tx_rxdetectvalidout[num_tx]),    
                                                .dprioout(tx_txdprioout[(num_tx * 150) + 149 : (num_tx * 150)])                                           
                                              );
        defparam transmit.channel_width = tx_channel_width;
        defparam transmit.transmit_protocol = INT_TX_TRANSMIT_PROTOCOL;
        defparam transmit.dprio_mode = tx_dprio_mode;
        defparam transmit.dprio_config_mode = INT_RECONFIG_DPRIO_MODE;
        defparam transmit.channel_bonding = INT_TX_CHANNEL_BONDING;
        defparam transmit.protocol_hint = INT_PROTOCOL_HINT;
        defparam transmit.channel_number = (starting_channel_number + num_tx) % NUMBER_CHANNELS_PER_QUAD;
        defparam transmit.use_double_data_mode = tx_use_double_data_mode;
        defparam transmit.use_serializer_double_data_mode = tx_use_serializer_double_data_mode;
        defparam transmit.enc_8b_10b_mode = tx_8b_10b_mode;
        defparam transmit.enc_8b_10b_compatibility_mode = INT_TX_ENC_8B_10B_COMPATIBILITY_MODE;
        defparam transmit.enable_idle_selection = INT_TX_ENABLE_IDLE_SELECTION;
        defparam transmit.force_kchar = tx_force_kchar;
        defparam transmit.force_echar = tx_force_echar;
        defparam transmit.rxdetect_ctrl = tx_rxdetect_ctrl;
        defparam transmit.low_speed_test_select = tx_low_speed_test_select;
        defparam transmit.allow_polarity_inversion = tx_allow_polarity_inversion;
        defparam transmit.disparity_mode = INT_TX_DISPARITY_MODE;
        defparam transmit.enable_symbol_swap = tx_enable_symbol_swap;
        defparam transmit.enable_bit_reversal = tx_enable_bit_reversal;
        defparam transmit.enable_reverse_parallel_loopback = INT_ENABLE_REVERSE_PARALLEL_LOOPBACK;
        defparam transmit.enable_reverse_serial_loopback = ((reverse_loopback_mode == "precdr_rslb") || (reverse_loopback_mode == "postcdr_rslb"))? "true" : "false";
        defparam transmit.divider_refclk_select_pll_fast_clk0 = INT_TX_DIVIDER_REFCLK_SELECT_PLL_FAST_CLK0;
        defparam transmit.refclk_divide_by = (en_local_clk_div_ctrl == "true")? tx_refclk_divide_by : INT_REQUIRED_TX_REFCLK_DIVIDE_BY;
        defparam transmit.refclk_select = INT_TX_REFCLK_SELECT;
        defparam transmit.wr_clk_mux_select = (tx_enable_self_test_mode == "true")? "int_clk" : "core_clk";
        defparam transmit.serializer_clk_select = ((INT_TX_IS_BI_QUAD_BONDED == "true") && ((num_tx % NUMBER_CHANNELS_PER_BI_QUAD) <= 3))?  "analogx4refclk" : INT_TX_SERIALIZER_CLK_SELECT;
        defparam transmit.vod_selection = vod_ctrl_setting;
        defparam transmit.enable_slew_rate = tx_enable_slew_rate;
        defparam transmit.disable_ph_low_latency_mode = INT_TX_DISABLE_PH_LOW_LATENCY_MODE;
        defparam transmit.preemp_tap_1 = preemphasis_ctrl_1stposttap_setting;
        defparam transmit.preemp_tap_2 = preemphasis_ctrl_2ndposttap_setting;
        defparam transmit.preemp_pretap = preemphasis_ctrl_pretap_setting;
        defparam transmit.preemp_tap_2_inv = preemphasis_ctrl_2ndposttap_inv_setting;
        defparam transmit.preemp_pretap_inv = preemphasis_ctrl_pretap_inv_setting;
        defparam transmit.enable_self_test_mode = tx_enable_self_test_mode;
        defparam transmit.self_test_mode = tx_self_test_mode;
        defparam transmit.termination = transmitter_termination;
        defparam transmit.use_termvoltage_signal = "false";
        defparam transmit.common_mode = INT_TX_COMMON_MODE;
        defparam transmit.analog_power = tx_analog_power;
        defparam transmit.dprio_width = 150;

        
        if (tx_force_disparity_mode == "true")
        begin
            assign tx_forcedisp_wire[(INT_TX_DWIDTH_FACTOR * (num_tx + 1)) - 1 : (INT_TX_DWIDTH_FACTOR * num_tx)] = 
                                                                        tx_forcedisp[(INT_TX_DWIDTH_FACTOR * (num_tx + 1)) - 1 : (INT_TX_DWIDTH_FACTOR * num_tx)];
        end
        else 
        begin
            if ((protocol == "pipe") && (INT_RECONFIG_CHANNEL_INTERFACE != "true"))
                    assign tx_forcedisp_wire[INT_TX_DWIDTH_FACTOR * num_tx] = tx_forcedispcompliance[num_tx];
                   
        
        end
        
        if (((num_tx % NUMBER_CHANNELS_PER_QUAD) == 0) && (tx_channel_bonding == "x4"))
        begin
            assign cent_unit_rdenablesync[num_tx/NUMBER_CHANNELS_PER_QUAD] = tx_rdenablesync[num_tx];
            assign tx_phfifox4wrenable[num_tx/NUMBER_CHANNELS_PER_QUAD] = tx_phfifowrenableout[num_tx];
            assign tx_phfifox4rdenable[num_tx/NUMBER_CHANNELS_PER_QUAD] = tx_phfifordenableout[num_tx];
            assign tx_phfifox4rdclk[num_tx/NUMBER_CHANNELS_PER_QUAD] = tx_phfifordclkout[num_tx];
            assign tx_phfifox4bytesel[num_tx/NUMBER_CHANNELS_PER_QUAD] = tx_phfifobyteselout[num_tx];
        end
        
        if (((num_tx % NUMBER_CHANNELS_PER_BI_QUAD) == 0) && (tx_channel_bonding == "x8"))
        begin
            assign tx_phfifox8wrenable[num_tx/NUMBER_CHANNELS_PER_BI_QUAD] = tx_phfifowrenableout[num_tx];
            assign tx_phfifox8rdenable[num_tx/NUMBER_CHANNELS_PER_BI_QUAD] = tx_phfifordenableout[num_tx];
            assign tx_phfifox8rdclk[num_tx/NUMBER_CHANNELS_PER_BI_QUAD] = tx_phfifordclkout[num_tx];
            assign tx_phfifox8bytesel[num_tx/NUMBER_CHANNELS_PER_BI_QUAD]  = tx_phfifobyteselout[num_tx];
        end
        
        if (tx_flip_tx_in == "true")
        begin
            for (tx_byte_cnt=(num_tx * INT_TX_DWIDTH_FACTOR); tx_byte_cnt < ((num_tx + 1) * INT_TX_DWIDTH_FACTOR); tx_byte_cnt = tx_byte_cnt + 1) begin:channel_byte_tx
                
                for (tx_bit_cnt=0; tx_bit_cnt < TX_BYTE_SIZE; tx_bit_cnt = tx_bit_cnt + 1) begin:channel_wid_tx
                    assign tx_datain_wire[(tx_byte_cnt * TX_BYTE_SIZE) + tx_bit_cnt] = tx_datain[((tx_byte_cnt + 1 ) * TX_BYTE_SIZE) - 1 - tx_bit_cnt];
                end
                
            end
            
        end 
        else
        begin
             assign tx_datain_wire[((num_tx + 1) * tx_channel_width) - 1:(num_tx * tx_channel_width)] =  tx_datain[(((num_tx + 1) * tx_channel_width) - 1) : (num_tx * tx_channel_width)];
        end
        
    end
    else 
    begin
        assign tx_dataout[num_tx] = 1'b0;
        assign tx_clkout[num_tx] = 1'b0;
        assign tx_phfifooverflow[num_tx] = 1'b0;
        assign tx_phfifounderflow[num_tx] = 1'b0;
        assign tx_core_clkout_wire[num_tx] = 1'b0;
        assign debug_tx_phase_comp_fifo_error[num_tx] = 1'b0;

    end       
end
endgenerate
//End generate for transmitter


//Receiver Generation
generate for (num_rx=0; num_rx < number_of_channels; num_rx = num_rx + 1) begin:channel_rec
     
    if ((operation_mode != "tx") || (operation_mode == "duplex"))
    begin
    
        if (rx_channel_bonding == "indv")
        begin
            assign rx_analogreset_in[num_rx] = rx_analogreset[num_rx];
            assign rx_digitalreset_in[num_rx] = rx_digitalreset[num_rx];
        end
        else if (INT_RX_IS_QUAD_BONDED == "true")
        begin
            assign rx_analogreset_in[num_rx] = rx_analogreset[num_rx/NUMBER_CHANNELS_PER_QUAD];
            assign rx_digitalreset_in[num_rx] = rx_digitalreset[num_rx/NUMBER_CHANNELS_PER_QUAD];
        end
        else
        begin
            assign rx_analogreset_in[num_rx] = rx_analogreset[num_rx/NUMBER_CHANNELS_PER_BI_QUAD];
            assign rx_digitalreset_in[num_rx] = rx_digitalreset[num_rx/NUMBER_CHANNELS_PER_BI_QUAD];
        end
            
        if (operation_mode == "rx")
            assign fixedclk_in[num_rx] = fixedclk;
            
        assign debug_rx_phase_comp_fifo_error[num_rx] = rx_phfifooverflowout[num_rx] || rx_phfifounderflowout[num_rx];
        
        assign rx_phfifooverflow[num_rx] = rx_phfifooverflowout[num_rx];
        assign rx_phfifounderflow[num_rx] = rx_phfifounderflowout[num_rx];
        assign rx_powerdown_in[num_rx] = rx_powerdown[num_rx];
        assign rx_recovclkout[num_rx] = rx_recovclkout_wire[num_rx];
        assign rx_pll_locked[num_rx] = rx_phaselockloss_out[num_rx];
        assign rx_coreclk_in[num_rx] = (rx_use_coreclk == "true")? rx_coreclk[num_rx] :
                                       (INT_RX_IS_QUAD_BONDED == "true")? coreclkout_wire[num_rx/NUMBER_CHANNELS_PER_QUAD] :
                                       (INT_RX_IS_BI_QUAD_BONDED == "true")? coreclkout_bi_quad_wire[num_rx/NUMBER_CHANNELS_PER_BI_QUAD]:
                                       (((INT_RX_USE_LOCALREFCLK == "true") || (INT_RX_PIPEX1_NO_RATE_MATCH_FIFO == "true")) && (INT_EN_CLOCK_SCHEME == "false") && (protocol != "cpri"))? tx_core_clkout_wire[num_rx] : 
                                       ((INT_EN_CLOCK_SCHEME == "true") && (rx_reconfig_clk_scheme == "tx_ch0_clk_to_rx"))? tx_core_clkout_wire[num_rx] : 
                                       ((INT_EN_CLOCK_SCHEME == "true") && (rx_reconfig_clk_scheme == "tx_clk_to_rx"))? tx_clkout_int_wire[num_rx] : rx_clkout_wire[num_rx]; 
        assign rx_signaldetect[num_rx] = rx_signaldetect_wire[num_rx];                                       
                                                                             
        if (INT_RECONFIG_CHANNEL_INTERFACE == "true")
            assign rx_dataoutfull[ ((num_rx + 1) * 64) - 1 : (num_rx * 64)] =  rx_dataoutfull_wire[ ((num_rx + 1) * 64) - 1 : (num_rx * 64)];            
        else
            assign rx_dataoutfull[ ((num_rx + 1) * 64) - 1 : (num_rx * 64)] = 64'b0;         
            
        if (INT_RECONFIG_DPRIO_MODE != 0)
        begin
            assign rx_dprioin_wire[(num_rx * 300) + 199 : (num_rx * 300)] = cent_unit_rxdprioout[(num_rx * 200) + ((num_rx / NUMBER_CHANNELS_PER_QUAD) * 400) + 199 : (num_rx * 200) + ((num_rx / NUMBER_CHANNELS_PER_QUAD) * 400)];
            assign rx_dprioin_wire[(num_rx * 300) + 299 : (num_rx * 300) + 200] = cent_unit_rxdprioout[(num_rx * 100) + (((num_rx / NUMBER_CHANNELS_PER_QUAD) + 1) * 800) + 99 : (num_rx * 100) + (((num_rx / NUMBER_CHANNELS_PER_QUAD) + 1) * 800)];
            assign cent_unit_rx_dprioin[(num_rx * 200) + ((num_rx / NUMBER_CHANNELS_PER_QUAD) * 400) + 199 : (num_rx * 200) + ((num_rx / NUMBER_CHANNELS_PER_QUAD) * 400)] = rx_rxdprioout[(num_rx * 300) + 199 : (num_rx * 300)];
            assign cent_unit_rx_dprioin[(num_rx * 100) + (((num_rx / NUMBER_CHANNELS_PER_QUAD) + 1) * 800) + 99 : (num_rx * 100) + (((num_rx / NUMBER_CHANNELS_PER_QUAD) + 1) * 800)] = rx_rxdprioout[(num_rx * 300) + 299  : (num_rx * 300) + 200];
        end
        else
        begin
             assign rx_dprioin_wire[(num_rx * 300) + 299 : (num_rx * 300)] = {300{1'b0}};
             assign cent_unit_rx_dprioin[(num_rx * 300) + 299 : (num_rx * 300)] = {300{1'b0}};
        end         
        
        tri0 [(number_of_channels * 4) - 1 : 0] testsel_in;
        
        if (rx_adaptive_equalization_mode == "continuous")
        begin
            assign testsel_in[(num_rx * 4) + 3 : (num_rx * 4)] = aeq_togxb[(num_rx * 4) + 3 : (num_rx * 4)];
            assign aeq_fromgxb[(num_rx * 6) + 5 : (num_rx * 6)] = rx_analogtestbus_out[(num_rx * 8) + 7 : (num_rx * 8) + 2];
        end
        else
        begin
            assign testsel_in[(num_rx * 4) + 3 : (num_rx * 4)] = 4'b0;
            assign aeq_fromgxb[(num_rx * 6) + 5 : (num_rx * 6)] = 6'b0;
        end
                                     
        
        // instantiate RX
        
        if (INT_IS_PIPE_GEN_2 == "true")
        begin
            stratixiigx_hssi_receiver   receive (   .datain(rx_datain[num_rx]),
                                                    .cruclk(rx_cruclk_in[(num_rx * 9) + 8 : (num_rx * 9)]),
                                                    .locktodata(rx_locktodata_wire[num_rx]),
                                                    .locktorefclk(rx_locktorefclk_wire[num_rx]),
                                                    .quadreset(cent_unit_quadresetout[(num_rx / NUMBER_CHANNELS_PER_QUAD)]),
                                                    .analogreset(rx_analogreset_out[num_rx]),
                                                    .crureset(rx_rxcruresetout[num_rx]),
                                                    .adcereset(rx_rxadceresetout[num_rx]),
                                                    .adcepowerdn(cent_unit_rxadcepowerdn[num_rx]),
                                                    .crupowerdn(cent_unit_rxcrupowerdn[num_rx]),
                                                    .ibpowerdn(cent_unit_rxibpowerdn[num_rx]),
                                                    .serialfdbk ((INT_EN_SERIAL_LOOPBACK_CONNECT == "true")? tx_serialfdbkout[num_rx] : 1'b0),
                                                    .seriallpbken((INT_EN_SERIAL_LOOPBACK_CONNECT == "true")? rx_seriallpbken[num_rx]: 1'b0),
                                                    .parallelfdbk((loopback_mode == "plb")? tx_parallelfdbkout[((20 * num_rx) + 19) : (20 * num_rx)] : 20'b0),
                                                    .coreclk(rx_coreclk_in[num_rx]),
                                                    .masterclk((protocol == "xaui")? rx_masterclk[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .localrefclk((INT_RX_USE_LOCALREFCLK == "true")? tx_localrefclk[num_rx] : 1'b0),
                                                    .refclk(refclk_pma[num_rx/NUMBER_CHANNELS_PER_QUAD]),
                                                    .a1a2size((INT_RX_EN_A1A2SIZE_CONNECT == "true")? rx_a1a2size[num_rx] : 1'b0),
                                                    .enapatternalign((rx_enable_self_test_mode == "true")? 1'b0 : rx_enapatternalign[num_rx]),
                                                    .bitslip(rx_bitslip[num_rx]),
                                                    .pipe8b10binvpolarity((INT_RX_EN_PIPE8B10BINVPOLARITY_CONNECT == "true")? pipe8b10binvpolarity[num_rx] : 1'b0),
                                                    .rmfifordena((rx_rate_match_fifo_mode == "generic")? rx_rmfifordena[num_rx] : 1'b0),
                                                    .rmfifowrena((rx_rate_match_fifo_mode == "generic")? rx_int_rmfifowrena[num_rx] : 1'b0),
                                                    .enabyteord((INT_RX_EN_BYTEORD_CONNECT == "true")? rx_enabyteord[num_rx] : 1'b0),
                                                    .phfifordenable(rx_phfifordenable[num_rx]),
                                                    .phfifowrdisable(rx_phfifowrdisable[num_rx]),
                                                    .phfifox4wrenable((INT_RX_IS_QUAD_BONDED == "true")? rx_phfifox4wrenable[num_rx / NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                    .phfifox4rdenable((INT_RX_IS_QUAD_BONDED == "true")? rx_phfifox4rdenable[num_rx / NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                    .phfifox4wrclk((INT_RX_IS_QUAD_BONDED == "true")? rx_phfifox4wrclk[num_rx / NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                    .phfifox4bytesel((INT_RX_IS_QUAD_BONDED == "true")? rx_phfifox4bytesel[num_rx / NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .phfifox8wrenable((INT_RX_IS_BI_QUAD_BONDED == "true")? rx_phfifox8wrenable[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b1),
                                                    .phfifox8rdenable((INT_RX_IS_BI_QUAD_BONDED == "true")? rx_phfifox8rdenable[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b1),
                                                    .phfifox8wrclk((INT_RX_IS_BI_QUAD_BONDED == "true")? rx_phfifox8wrclk[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b1),
                                                    .phfifox8bytesel((INT_RX_IS_BI_QUAD_BONDED == "true")? rx_phfifox8bytesel[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b0),
                                                    .invpol((INT_RX_EN_INVPOLARITY == "true")? rx_invpolarity[num_rx] : 1'b0),
                                                    .revbitorderwa((INT_RX_ENABLE_BIT_REVERSAL == "true")? rx_revbitorderwa[num_rx] : 1'b0),
                                                    .revbyteorderwa((INT_RX_ENABLE_DEEP_ALIGN_BYTE_SWAP == "true")? rx_revbyteorderwa[num_rx] : 1'b0),
                                                    .digitalreset(rx_digitalreset_out[num_rx]), 
                                                    .phfiforeset(rx_phfiforeset[num_rx]),
                                                    .rmfiforeset((rx_rate_match_fifo_mode != "none")? rx_rmfiforeset[num_rx] : 1'b0),
                                                    .dprioin(rx_dprioin_wire[(num_rx * 300) + 299 : (num_rx * 300)]),
                                                    .dpriodisable((INT_RECONFIG_DPRIO_MODE != 0)? cent_unit_dpriodisableout[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                    .pipepowerstate((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? (tx_pipepowerstateout[(4 * num_rx) + 3 :(4 * num_rx)]) : {4{1'b0}}),
                                                    .pipepowerdown((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? (tx_pipepowerdownout[(2 * num_rx) + 1 : (2 * num_rx)]) : {2{1'b0}}),
                                                    .rxfound((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? (tx_rxfoundout[(2 * num_rx) + 1 : (2 * num_rx)]) : {2{1'b0}}),
                                                    .rxdetectvalid((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? tx_rxdetectvalidout[num_rx] : 1'b0),
                                                    .alignstatus((protocol == "xaui")? rx_channelaligned_in[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .disablefifordin((protocol == "xaui")? rx_disablefifordin_in[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .disablefifowrin((protocol == "xaui")? rx_disablefifowrin_in[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .fifordin((protocol == "xaui")? rx_fifordin_in[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .alignstatussync((protocol == "xaui")? rx_alignstatussync[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .enabledeskew((protocol == "xaui")? enabledeskew[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .fiforesetrd((protocol == "xaui")? rx_fiforesetrd[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .xgmdatain((protocol == "xaui")? (cent_unit_rx_xgmdataout[(8 * num_rx) + 7 : (num_rx * 8)]) : {8{1'b0}}),
                                                    .xgmctrlin((protocol == "xaui")? rx_xgmctrlin[num_rx] : 1'b0),
                                                    .testsel(testsel_in[(num_rx * 4) + 3 : (num_rx * 4)]),
                                                     // Output Port
                                                    .dataout(rx_out_wire[ ((num_rx + 1) * rx_channel_width) - 1 : (num_rx * rx_channel_width)]),
                                                    .dataoutfull(rx_dataoutfull_wire[ ((num_rx + 1) * 64) - 1 : (num_rx * 64)]),
                                                    .syncstatus(rx_syncstatus[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .patterndetect(rx_patterndetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .a1a2sizeout(rx_a1a2sizeout[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .a1detect(rx_a1detect[(INT_RX_WORD_ALIGNER_NUM_BYTE * (num_rx + 1)) - 1 : (num_rx * INT_RX_WORD_ALIGNER_NUM_BYTE)]),
                                                    .a2detect(rx_a2detect[(INT_RX_WORD_ALIGNER_NUM_BYTE * (num_rx + 1)) - 1 : (num_rx * INT_RX_WORD_ALIGNER_NUM_BYTE)]),
                                                    .k1detect(rx_k1detect[(INT_RX_WORD_ALIGNER_NUM_BYTE * (num_rx + 1)) - 1 : (num_rx * INT_RX_WORD_ALIGNER_NUM_BYTE)]),
                                                    .k2detect(rx_k2detect[(num_rx * 2) + 1 : (num_rx * 2)]),
                                                    .ctrldetect(rx_ctrldetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]), 
                                                    .errdetect(rx_errdetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),                                                
                                                    .disperr(rx_disperr[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),   
                                                    .runningdisp(rx_runningdisp[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),                                                
                                                    .syncstatusdeskew(rx_syncstatusdeskew[num_rx]),
                                                    .adetectdeskew(rx_adetectdeskew[num_rx]),
                                                    .rdalign(rx_rdalign[num_rx]),
                                                    .xgmdataout(rx_xgmdataout[(8 * num_rx) + 7 : (8 * num_rx)]),
                                                    .xgmctrldet(cent_unit_rx_ctrl[num_rx]),
                                                    .xgmrunningdisp(rx_xgmrunningdisp[num_rx]),
                                                    .xgmdatavalid(rx_xgmdatavalid[num_rx]),
                                                    .rmfifofull(rx_rmfifofull[num_rx]),
                                                    .rmfifoalmostfull(rx_rmfifoalmostfull[num_rx]),
                                                    .rmfifoempty(rx_rmfifoempty[num_rx]),
                                                    .rmfifoalmostempty(rx_rmfifoalmostempty[num_rx]),
                                                    .rmfifodatainserted(rx_rmfifodatainserted[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .rmfifodatadeleted(rx_rmfifodatadeleted[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .revparallelfdbkdata(rx_revparallelfdbkdata[((20 * num_rx) + 19) : (num_rx * 20)]),
                                                    .clkout(rx_clkout_wire[num_rx]),
                                                    .recovclkout(rx_recovclkout_wire[num_rx]),
                                                    .byteorderalignstatus(rx_byteorderalignstatus[num_rx]),
                                                    .phfifooverflow(rx_phfifooverflowout[num_rx]),
                                                    .phfifounderflow(rx_phfifounderflowout[num_rx]),
                                                    .phfifowrenableout(rx_phfifowrenableout[num_rx]),
                                                    .phfifordenableout(rx_phfifordenableout[num_rx]),
                                                    .phfifowrclkout(rx_phfifowrclkout[num_rx]),
                                                    .phfifobyteselout(rx_phfifobyteselout[num_rx]),
                                                    .pipestatus(pipestatus[(3 * num_rx) + 2 : (3 * num_rx)]),
                                                    .pipephydonestatus(pipephydonestatus[num_rx]),
                                                    .pipedatavalid(pipedatavalid_out[num_rx]),
                                                    .pipeelecidle(pipeelecidle_out[num_rx]),
                                                    .pipestatetransdoneout(rx_pipestatetransdoneout[num_rx]),
                                                    .dprioout(rx_rxdprioout[(num_rx * 300) + 299 : (num_rx * 300)]),
                                                    .disablefifordout(rx_disablefifordout_wire[num_rx]),
                                                    .disablefifowrout(rx_disablefifowrout_wire[num_rx]),
                                                    .fifordout(rx_fifordout_wire[num_rx]),
                                                    .alignstatussyncout(rx_alignstatussyncout[num_rx]),
                                                    .rlv(rx_rlv[num_rx]),
                                                    .bisterr(rx_bisterr[num_rx]),
                                                    .bistdone(rx_bistdone[num_rx]),
                                                    .revserialfdbkout(rx_revserialfdbkout[num_rx]),
                                                    .signaldetect(rx_signaldetect_wire[num_rx]),
                                                    .phaselockloss(rx_phaselockloss_out[num_rx]),
                                                    .analogtestbus(rx_analogtestbus_out[(num_rx * 8) + 7 : (num_rx * 8)]),
                                                    .freqlock(rx_freqlocked[num_rx])
                                                                                       
                                                );
            defparam receive.dprio_mode = rx_dprio_mode;
            defparam receive.dprio_config_mode = INT_RECONFIG_DPRIO_MODE;
            defparam receive.datapath_protocol = INT_RX_DATAPATH_PROTOCOL;
            defparam receive.channel_bonding = INT_RX_CHANNEL_BONDING;
            defparam receive.channel_width = rx_channel_width;
            defparam receive.channel_number = (starting_channel_number + num_rx) % NUMBER_CHANNELS_PER_QUAD;
            defparam receive.use_double_data_mode = (rx_use_double_data_mode == "true")? "true" : "false";
            defparam receive.use_deserializer_double_data_mode = (INT_RX_USE_DESERIALIZER_DOUBLE_DATA_MODE == "true")? "true" : "false";
            defparam receive.enable_deep_align = INT_RX_ENABLE_DEEP_ALIGN;
            defparam receive.use_rising_edge_triggered_pattern_align = ((protocol == "cei_6g") && (use_global_clk_divider == "false"))? "true" : rx_use_rising_edge_triggered_pattern_align;
            defparam receive.disable_running_disp_in_word_align = rx_disable_running_disp_in_word_align;
            defparam receive.enable_true_complement_match_in_word_align = INT_RX_ENABLE_TRUE_COMPLEMENT_MATCH_WORD_ALIGN;
            defparam receive.align_pattern_length  = INT_RX_ALIGN_PATTERN_LENGTH;
            defparam receive.align_pattern = INT_RX_ALIGN_PATTERN;
            defparam receive.bit_slip_enable = rx_bitslip_enable;
            defparam receive.use_align_state_machine = INT_RX_USE_ALIGN_STATE_MACHINE;
            defparam receive.align_loss_sync_error_num  = INT_RX_ALIGN_LOSS_SYNC_ERROR_NUM;
            defparam receive.num_align_code_groups_in_ordered_set  = INT_RX_NUM_ALIGN_CODE_GROUPS_IN_ORDERED_SET;
            defparam receive.num_align_cons_good_data = INT_RX_NUM_ALIGN_CONS_GOOD_DATA;
            defparam receive.num_align_cons_pat  = INT_RX_NUM_ALIGN_CONS_PAT;
            defparam receive.disallow_kchar_after_pattern_ordered_set = INT_RX_DISALLOW_KCHAR_AFTER_PATTERN_ORDERED_SET;
            defparam receive.enable_deep_align_byte_swap  = INT_RX_ENABLE_DEEP_ALIGN_BYTE_SWAP;
            defparam receive.allow_align_polarity_inversion  = rx_allow_align_polarity_inversion;
            defparam receive.enable_bit_reversal = rx_enable_bit_reversal;
            defparam receive.use_deskew_fifo = (protocol == "xaui")? "true" : rx_use_deskew_fifo;
            defparam receive.deskew_pattern = INT_RX_DESKEW_PATTERN;
            defparam receive.align_to_deskew_pattern_pos_disp_only = INT_RX_ALIGN_TO_DESKEW_POS_DISP;
            defparam receive.dec_8b_10b_mode = INT_RX_8B_10B_MODE;
            defparam receive.dec_8b_10b_compatibility_mode = INT_RX_DEC_8B_10B_COMPAT_MODE;
            defparam receive.infiniband_invalid_code  = rx_infiniband_invalid_code;
            defparam receive.rate_match_fifo_mode  = INT_RX_RATE_MATCH_FIFO_MODE;
            defparam receive.rate_match_pattern1  = INT_RX_RATE_MATCH_PATTERN1;
            defparam receive.rate_match_pattern2  = INT_RX_RATE_MATCH_PATTERN2;
            defparam receive.use_rate_match_pattern1_only = INT_RX_USE_RATE_MATCH_PATTERN1_ONLY;
            defparam receive.rate_match_almost_empty_threshold  = rx_rate_match_almost_empty_threshold;
            defparam receive.rate_match_almost_full_threshold  = rx_rate_match_almost_full_threshold;
            defparam receive.rate_match_pattern_size  = INT_RX_RATE_MATCH_PATTERN_SIZE;
            defparam receive.rate_match_skip_set_based  = (INT_RX_RATE_MATCH_FIFO_MODE != "none")? INT_RATE_MATCH_SKIP_SET_BASED : "false";
            defparam receive.rate_match_back_to_back  = (INT_RX_RATE_MATCH_FIFO_MODE != "none")? INT_RATE_MATCH_BACK_TO_BACK : "false";
            defparam receive.rate_match_ordered_set_based = INT_RX_RATE_MATCH_ORDERED_SET_BASED;
            defparam receive.use_parallel_loopback  = INT_RX_USE_PARALLEL_LOOPBACK;
            defparam receive.send_direct_reverse_serial_loopback  = (reverse_loopback_mode == "postcdr_rslb")? "false" : "true";
            defparam receive.byte_ordering_mode  = rx_byte_ordering_mode;
            defparam receive.byte_order_pattern  = rx_byte_order_pattern;
            defparam receive.byte_order_pad_pattern  = rx_byte_order_pad_pattern;
            defparam receive.allow_pipe_polarity_inversion  = rx_allow_pipe_polarity_inversion;
            defparam receive.disable_auto_idle_insertion  = rx_disable_auto_idle_insertion;
            defparam receive.disable_ph_low_latency_mode = INT_RX_DISABLE_PH_LOW_LATENCY_MODE;
            defparam receive.enable_self_test_mode  = rx_enable_self_test_mode;
            defparam receive.self_test_mode = rx_self_test_mode;
            defparam receive.run_length  = rx_run_length;
            defparam receive.run_length_enable  = rx_run_length_enable;
            defparam receive.recovered_clk_mux_select  = INT_RX_RECOVERED_CLK_MUX_SELECT;
            defparam receive.clk1_mux_select  = INT_RX_CLK1_MUX_SELECT;
            defparam receive.clk2_mux_select  = INT_RX_CLK2_MUX_SELECT;
            defparam receive.rd_clk_mux_select  = INT_RX_RD_CLK_MUX_SELECT;
            defparam receive.force_signal_detect  = rx_force_signal_detect;
            defparam receive.ppmselect = rx_ppmselect;
            defparam receive.force_freq_det_low = rx_force_freq_det_low;
            defparam receive.force_freq_det_high = rx_force_freq_det_high;
            defparam receive.force_signal_detect_dig = INT_RX_FORCE_SIGNAL_DETECT_DIG;
            defparam receive.rx_detect_bypass = INT_RX_DETECT_BYPASS;
            defparam receive.insert_pad_on_underflow = rx_insert_pad_on_underflow;
            defparam receive.bandwidth_mode  = rx_bandwidth_mode;
            defparam receive.enable_dc_coupling  = rx_enable_dc_coupling;
            defparam receive.allow_serial_loopback  = INT_RX_ALLOW_SERIAL_LOOPBACK;
            defparam receive.signal_detect_threshold  = INT_RX_SIGNAL_DETECT_THRESHOLD;
            defparam receive.equalizer_ctrl_a  = equalizer_ctrl_a_setting;
            defparam receive.equalizer_ctrl_b  = equalizer_ctrl_b_setting;
            defparam receive.equalizer_ctrl_c  = equalizer_ctrl_c_setting;
            defparam receive.equalizer_ctrl_d  = equalizer_ctrl_d_setting;
            defparam receive.equalizer_ctrl_v  = equalizer_ctrl_v_setting;
            defparam receive.equalizer_dc_gain = equalizer_dcgain_setting;
            defparam receive.adaptive_equalization_mode  = rx_adaptive_equalization_mode;
            defparam receive.eq_adapt_seq_control = INT_RX_EQ_ADAPT_SEG_CONTROL;
            defparam receive.eq_max_gradient_control  = INT_RX_EQ_MAX_GRADIENT_CONTROL;
            defparam receive.ignore_lock_detect  = rx_ignore_lock_detect;
            defparam receive.enable_lock_to_refclk_sig  = rx_enable_lock_to_refclk_sig;
            defparam receive.enable_lock_to_data_sig  = rx_enable_lock_to_data_sig;
            defparam receive.cru_multiply_by  = INT_RX_CRU_MULTIPLY_BY;
            defparam receive.cru_divide_by  = 1;
            defparam receive.cru_pre_divide_by  = INT_CRU_PRE_DIVIDE_BY;
            defparam receive.cruclk0_period  = INT_RX_CRU0_INCLOCK_PERIOD;
            defparam receive.cruclk1_period = INT_RX_CRU1_INCLOCK_PERIOD;
            defparam receive.cruclk2_period = INT_RX_CRU2_INCLOCK_PERIOD;
            defparam receive.cruclk3_period  = INT_RX_CRU3_INCLOCK_PERIOD;
            defparam receive.cruclk4_period = INT_RX_CRU4_INCLOCK_PERIOD;
            defparam receive.cruclk5_period = INT_RX_CRU5_INCLOCK_PERIOD;
            defparam receive.cruclk6_period = INT_RX_CRU6_INCLOCK_PERIOD;
            defparam receive.cru_clock_select = rx_cru_log_index;
            defparam receive.sim_rxpll_clkout_phase_shift = rx_pll_sim_clkout_phase_shift;
            defparam receive.use_termvoltage_signal = "false";
            defparam receive.common_mode = rx_common_mode;
            defparam receive.termination = receiver_termination;
            defparam receive.protocol_hint = INT_PROTOCOL_HINT;
            defparam receive.dprio_width = 300;
            defparam receive.loop_filter_resistor_control = 3;
            defparam receive.charge_pump_current_control = 2;
            defparam receive.vco_range = "high";
            
        end 
        else
        begin
            stratixiigx_hssi_receiver   receive (   .datain(rx_datain[num_rx]),
                                                    .cruclk(rx_cruclk_in[(num_rx * 9) + 8 : (num_rx * 9)]),
                                                    .locktodata(rx_locktodata_wire[num_rx]),
                                                    .locktorefclk(rx_locktorefclk_wire[num_rx]),
                                                    .quadreset(cent_unit_quadresetout[(num_rx / NUMBER_CHANNELS_PER_QUAD)]),
                                                    .analogreset(rx_analogreset_out[num_rx]),
                                                    .crureset(rx_rxcruresetout[num_rx]),
                                                    .adcereset(rx_rxadceresetout[num_rx]),
                                                    .adcepowerdn(cent_unit_rxadcepowerdn[num_rx]),
                                                    .crupowerdn(cent_unit_rxcrupowerdn[num_rx]),
                                                    .ibpowerdn(cent_unit_rxibpowerdn[num_rx]),
                                                    .serialfdbk ((INT_EN_SERIAL_LOOPBACK_CONNECT == "true")? tx_serialfdbkout[num_rx] : 1'b0),
                                                    .seriallpbken((INT_EN_SERIAL_LOOPBACK_CONNECT == "true")? rx_seriallpbken[num_rx]: 1'b0),
                                                    .parallelfdbk((loopback_mode == "plb")? tx_parallelfdbkout[((20 * num_rx) + 19) : (20 * num_rx)] : 20'b0),
                                                    .coreclk(rx_coreclk_in[num_rx]),
                                                    .masterclk((protocol == "xaui")? rx_masterclk[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .localrefclk((INT_RX_USE_LOCALREFCLK == "true")? tx_localrefclk[num_rx] : 1'b0),
                                                    .refclk(refclk_pma[num_rx/NUMBER_CHANNELS_PER_QUAD]),
                                                    .a1a2size((INT_RX_EN_A1A2SIZE_CONNECT == "true")? rx_a1a2size[num_rx] : 1'b0),
                                                    .enapatternalign((rx_enable_self_test_mode == "true")? 1'b0 : rx_enapatternalign[num_rx]),
                                                    .bitslip(rx_bitslip[num_rx]),
                                                    .pipe8b10binvpolarity((INT_RX_EN_PIPE8B10BINVPOLARITY_CONNECT == "true")? pipe8b10binvpolarity[num_rx] : 1'b0),
                                                    .rmfifordena((rx_rate_match_fifo_mode == "generic")? rx_rmfifordena[num_rx] : 1'b0),
                                                    .rmfifowrena((rx_rate_match_fifo_mode == "generic")? rx_int_rmfifowrena[num_rx] : 1'b0),
                                                    .enabyteord((INT_RX_EN_BYTEORD_CONNECT == "true")? rx_enabyteord[num_rx] : 1'b0),
                                                    .phfifordenable(rx_phfifordenable[num_rx]),
                                                    .phfifowrdisable(rx_phfifowrdisable[num_rx]),
                                                    .phfifox4wrenable((INT_RX_IS_QUAD_BONDED == "true")? rx_phfifox4wrenable[num_rx / NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                    .phfifox4rdenable((INT_RX_IS_QUAD_BONDED == "true")? rx_phfifox4rdenable[num_rx / NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                    .phfifox4wrclk((INT_RX_IS_QUAD_BONDED == "true")? rx_phfifox4wrclk[num_rx / NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                    .phfifox4bytesel((INT_RX_IS_QUAD_BONDED == "true")? rx_phfifox4bytesel[num_rx / NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .phfifox8wrenable((INT_RX_IS_BI_QUAD_BONDED == "true")? rx_phfifox8wrenable[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b1),
                                                    .phfifox8rdenable((INT_RX_IS_BI_QUAD_BONDED == "true")? rx_phfifox8rdenable[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b1),
                                                    .phfifox8wrclk((INT_RX_IS_BI_QUAD_BONDED == "true")? rx_phfifox8wrclk[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b1),
                                                    .phfifox8bytesel((INT_RX_IS_BI_QUAD_BONDED == "true")? rx_phfifox8bytesel[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] : 1'b0),
                                                    .invpol((INT_RX_EN_INVPOLARITY == "true")? rx_invpolarity[num_rx] : 1'b0),
                                                    .revbitorderwa((INT_RX_ENABLE_BIT_REVERSAL == "true")? rx_revbitorderwa[num_rx] : 1'b0),
                                                    .revbyteorderwa((INT_RX_ENABLE_DEEP_ALIGN_BYTE_SWAP == "true")? rx_revbyteorderwa[num_rx] : 1'b0),
                                                    .digitalreset(rx_digitalreset_out[num_rx]), 
                                                    .phfiforeset(rx_phfiforeset[num_rx]),
                                                    .rmfiforeset((rx_rate_match_fifo_mode != "none")? rx_rmfiforeset[num_rx] : 1'b0),
                                                    .dprioin(rx_dprioin_wire[(num_rx * 300) + 299 : (num_rx * 300)]),
                                                    .dpriodisable((INT_RECONFIG_DPRIO_MODE != 0)? cent_unit_dpriodisableout[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b1),
                                                    .pipepowerstate((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? (tx_pipepowerstateout[(4 * num_rx) + 3 :(4 * num_rx)]) : {4{1'b0}}),
                                                    .pipepowerdown((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? (tx_pipepowerdownout[(2 * num_rx) + 1 : (2 * num_rx)]) : {2{1'b0}}),
                                                    .rxfound((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? (tx_rxfoundout[(2 * num_rx) + 1 : (2 * num_rx)]) : {2{1'b0}}),
                                                    .rxdetectvalid((INT_TX_RX_PIPE_INTERNAL_SIGNAL == "true")? tx_rxdetectvalidout[num_rx] : 1'b0),
                                                    .alignstatus((protocol == "xaui")? rx_channelaligned_in[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .disablefifordin((protocol == "xaui")? rx_disablefifordin_in[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .disablefifowrin((protocol == "xaui")? rx_disablefifowrin_in[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .fifordin((protocol == "xaui")? rx_fifordin_in[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .alignstatussync((protocol == "xaui")? rx_alignstatussync[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .enabledeskew((protocol == "xaui")? enabledeskew[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .fiforesetrd((protocol == "xaui")? rx_fiforesetrd[num_rx/NUMBER_CHANNELS_PER_QUAD] : 1'b0),
                                                    .xgmdatain((protocol == "xaui")? (cent_unit_rx_xgmdataout[(8 * num_rx) + 7 : (num_rx * 8)]) : {8{1'b0}}),
                                                    .xgmctrlin((protocol == "xaui")? rx_xgmctrlin[num_rx] : 1'b0),
                                                    .testsel(testsel_in[(num_rx * 4) + 3 : (num_rx * 4)]),
                                                     // Output Port
                                                    .dataout(rx_out_wire[ ((num_rx + 1) * rx_channel_width) - 1 : (num_rx * rx_channel_width)]),
                                                    .dataoutfull(rx_dataoutfull_wire[ ((num_rx + 1) * 64) - 1 : (num_rx * 64)]),
                                                    .syncstatus(rx_syncstatus[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .patterndetect(rx_patterndetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .a1a2sizeout(rx_a1a2sizeout[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .a1detect(rx_a1detect[(INT_RX_WORD_ALIGNER_NUM_BYTE * (num_rx + 1)) - 1 : (num_rx * INT_RX_WORD_ALIGNER_NUM_BYTE)]),
                                                    .a2detect(rx_a2detect[(INT_RX_WORD_ALIGNER_NUM_BYTE * (num_rx + 1)) - 1 : (num_rx * INT_RX_WORD_ALIGNER_NUM_BYTE)]),
                                                    .k1detect(rx_k1detect[(INT_RX_WORD_ALIGNER_NUM_BYTE * (num_rx + 1)) - 1 : (num_rx * INT_RX_WORD_ALIGNER_NUM_BYTE)]),
                                                    .k2detect(rx_k2detect[(num_rx * 2) + 1 : (num_rx * 2)]),
                                                    .ctrldetect(rx_ctrldetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]), 
                                                    .errdetect(rx_errdetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),                                                
                                                    .disperr(rx_disperr[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),   
                                                    .runningdisp(rx_runningdisp[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),                                                
                                                    .syncstatusdeskew(rx_syncstatusdeskew[num_rx]),
                                                    .adetectdeskew(rx_adetectdeskew[num_rx]),
                                                    .rdalign(rx_rdalign[num_rx]),
                                                    .xgmdataout(rx_xgmdataout[(8 * num_rx) + 7 : (8 * num_rx)]),
                                                    .xgmctrldet(cent_unit_rx_ctrl[num_rx]),
                                                    .xgmrunningdisp(rx_xgmrunningdisp[num_rx]),
                                                    .xgmdatavalid(rx_xgmdatavalid[num_rx]),
                                                    .rmfifofull(rx_rmfifofull[num_rx]),
                                                    .rmfifoalmostfull(rx_rmfifoalmostfull[num_rx]),
                                                    .rmfifoempty(rx_rmfifoempty[num_rx]),
                                                    .rmfifoalmostempty(rx_rmfifoalmostempty[num_rx]),
                                                    .rmfifodatainserted(rx_rmfifodatainserted[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .rmfifodatadeleted(rx_rmfifodatadeleted[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]),
                                                    .revparallelfdbkdata(rx_revparallelfdbkdata[((20 * num_rx) + 19) : (num_rx * 20)]),
                                                    .clkout(rx_clkout_wire[num_rx]),
                                                    .recovclkout(rx_recovclkout_wire[num_rx]),
                                                    .byteorderalignstatus(rx_byteorderalignstatus[num_rx]),
                                                    .phfifooverflow(rx_phfifooverflowout[num_rx]),
                                                    .phfifounderflow(rx_phfifounderflowout[num_rx]),
                                                    .phfifowrenableout(rx_phfifowrenableout[num_rx]),
                                                    .phfifordenableout(rx_phfifordenableout[num_rx]),
                                                    .phfifowrclkout(rx_phfifowrclkout[num_rx]),
                                                    .phfifobyteselout(rx_phfifobyteselout[num_rx]),
                                                    .pipestatus(pipestatus[(3 * num_rx) + 2 : (3 * num_rx)]),
                                                    .pipephydonestatus(pipephydonestatus[num_rx]),
                                                    .pipedatavalid(pipedatavalid_out[num_rx]),
                                                    .pipeelecidle(pipeelecidle_out[num_rx]),
                                                    .pipestatetransdoneout(rx_pipestatetransdoneout[num_rx]),
                                                    .dprioout(rx_rxdprioout[(num_rx * 300) + 299 : (num_rx * 300)]),
                                                    .disablefifordout(rx_disablefifordout_wire[num_rx]),
                                                    .disablefifowrout(rx_disablefifowrout_wire[num_rx]),
                                                    .fifordout(rx_fifordout_wire[num_rx]),
                                                    .alignstatussyncout(rx_alignstatussyncout[num_rx]),
                                                    .rlv(rx_rlv[num_rx]),
                                                    .bisterr(rx_bisterr[num_rx]),
                                                    .bistdone(rx_bistdone[num_rx]),
                                                    .revserialfdbkout(rx_revserialfdbkout[num_rx]),
                                                    .signaldetect(rx_signaldetect_wire[num_rx]),
                                                    .phaselockloss(rx_phaselockloss_out[num_rx]),
                                                    .analogtestbus(rx_analogtestbus_out[(num_rx * 8) + 7 : (num_rx * 8)]),
                                                    .freqlock(rx_freqlocked[num_rx])
                                                                                       
                                                );
            defparam receive.dprio_mode = rx_dprio_mode;
            defparam receive.dprio_config_mode = INT_RECONFIG_DPRIO_MODE;
            defparam receive.datapath_protocol = INT_RX_DATAPATH_PROTOCOL;
            defparam receive.channel_bonding = INT_RX_CHANNEL_BONDING;
            defparam receive.channel_width = rx_channel_width;
            defparam receive.channel_number = (starting_channel_number + num_rx) % NUMBER_CHANNELS_PER_QUAD;
            defparam receive.use_double_data_mode = (rx_use_double_data_mode == "true")? "true" : "false";
            defparam receive.use_deserializer_double_data_mode = (INT_RX_USE_DESERIALIZER_DOUBLE_DATA_MODE == "true")? "true" : "false";
            defparam receive.enable_deep_align = INT_RX_ENABLE_DEEP_ALIGN;
            defparam receive.use_rising_edge_triggered_pattern_align = (((protocol == "cei_6g") && (use_global_clk_divider == "false")) || ((protocol == "cpri") && (rx_channel_width >= 16))) ? "true" : rx_use_rising_edge_triggered_pattern_align;
            defparam receive.disable_running_disp_in_word_align = rx_disable_running_disp_in_word_align;
            defparam receive.enable_true_complement_match_in_word_align = INT_RX_ENABLE_TRUE_COMPLEMENT_MATCH_WORD_ALIGN;
            defparam receive.align_pattern_length  = INT_RX_ALIGN_PATTERN_LENGTH;
            defparam receive.align_pattern = INT_RX_ALIGN_PATTERN;
            defparam receive.bit_slip_enable = rx_bitslip_enable;
            defparam receive.use_align_state_machine = INT_RX_USE_ALIGN_STATE_MACHINE;
            defparam receive.align_loss_sync_error_num  = INT_RX_ALIGN_LOSS_SYNC_ERROR_NUM;
            defparam receive.num_align_code_groups_in_ordered_set  = INT_RX_NUM_ALIGN_CODE_GROUPS_IN_ORDERED_SET;
            defparam receive.num_align_cons_good_data = INT_RX_NUM_ALIGN_CONS_GOOD_DATA;
            defparam receive.num_align_cons_pat  = INT_RX_NUM_ALIGN_CONS_PAT;
            defparam receive.disallow_kchar_after_pattern_ordered_set = INT_RX_DISALLOW_KCHAR_AFTER_PATTERN_ORDERED_SET;
            defparam receive.enable_deep_align_byte_swap  = INT_RX_ENABLE_DEEP_ALIGN_BYTE_SWAP;
            defparam receive.allow_align_polarity_inversion  = rx_allow_align_polarity_inversion;
            defparam receive.enable_bit_reversal = rx_enable_bit_reversal;
            defparam receive.use_deskew_fifo = (protocol == "xaui")? "true" : rx_use_deskew_fifo;
            defparam receive.deskew_pattern = INT_RX_DESKEW_PATTERN;
            defparam receive.align_to_deskew_pattern_pos_disp_only = INT_RX_ALIGN_TO_DESKEW_POS_DISP;
            defparam receive.dec_8b_10b_mode = INT_RX_8B_10B_MODE;
            defparam receive.dec_8b_10b_compatibility_mode = INT_RX_DEC_8B_10B_COMPAT_MODE;
            defparam receive.infiniband_invalid_code  = rx_infiniband_invalid_code;
            defparam receive.rate_match_fifo_mode  = INT_RX_RATE_MATCH_FIFO_MODE;
            defparam receive.rate_match_pattern1  = INT_RX_RATE_MATCH_PATTERN1;
            defparam receive.rate_match_pattern2  = INT_RX_RATE_MATCH_PATTERN2;
            defparam receive.use_rate_match_pattern1_only = INT_RX_USE_RATE_MATCH_PATTERN1_ONLY;
            defparam receive.rate_match_almost_empty_threshold  = rx_rate_match_almost_empty_threshold;
            defparam receive.rate_match_almost_full_threshold  = rx_rate_match_almost_full_threshold;
            defparam receive.rate_match_pattern_size  = INT_RX_RATE_MATCH_PATTERN_SIZE;
            defparam receive.rate_match_skip_set_based  = (INT_RX_RATE_MATCH_FIFO_MODE != "none")? INT_RATE_MATCH_SKIP_SET_BASED : "false";
            defparam receive.rate_match_back_to_back  = (INT_RX_RATE_MATCH_FIFO_MODE != "none")? INT_RATE_MATCH_BACK_TO_BACK : "false";
            defparam receive.rate_match_ordered_set_based = INT_RX_RATE_MATCH_ORDERED_SET_BASED;
            defparam receive.use_parallel_loopback  = INT_RX_USE_PARALLEL_LOOPBACK;
            defparam receive.send_direct_reverse_serial_loopback  = (reverse_loopback_mode == "postcdr_rslb")? "false" : "true";
            defparam receive.byte_ordering_mode  = rx_byte_ordering_mode;
            defparam receive.byte_order_pattern  = rx_byte_order_pattern;
            defparam receive.byte_order_pad_pattern  = rx_byte_order_pad_pattern;
            defparam receive.allow_pipe_polarity_inversion  = rx_allow_pipe_polarity_inversion;
            defparam receive.disable_auto_idle_insertion  = rx_disable_auto_idle_insertion;
            defparam receive.disable_ph_low_latency_mode = INT_RX_DISABLE_PH_LOW_LATENCY_MODE;
            defparam receive.enable_self_test_mode  = rx_enable_self_test_mode;
            defparam receive.self_test_mode = rx_self_test_mode;
            defparam receive.run_length  = rx_run_length;
            defparam receive.run_length_enable  = rx_run_length_enable;
            defparam receive.recovered_clk_mux_select  = INT_RX_RECOVERED_CLK_MUX_SELECT;
            defparam receive.clk1_mux_select  = INT_RX_CLK1_MUX_SELECT;
            defparam receive.clk2_mux_select  = INT_RX_CLK2_MUX_SELECT;
            defparam receive.rd_clk_mux_select  = INT_RX_RD_CLK_MUX_SELECT;
            defparam receive.force_signal_detect  = rx_force_signal_detect;
            defparam receive.ppmselect = rx_ppmselect;
            defparam receive.force_freq_det_low = rx_force_freq_det_low;
            defparam receive.force_freq_det_high = rx_force_freq_det_high;
            defparam receive.force_signal_detect_dig = INT_RX_FORCE_SIGNAL_DETECT_DIG;
            defparam receive.rx_detect_bypass = INT_RX_DETECT_BYPASS;
            defparam receive.insert_pad_on_underflow = rx_insert_pad_on_underflow;
            defparam receive.bandwidth_mode  = rx_bandwidth_mode;
            defparam receive.enable_dc_coupling  = rx_enable_dc_coupling;
            defparam receive.allow_serial_loopback  = INT_RX_ALLOW_SERIAL_LOOPBACK;
            defparam receive.signal_detect_threshold  = INT_RX_SIGNAL_DETECT_THRESHOLD;
            defparam receive.equalizer_ctrl_a  = equalizer_ctrl_a_setting;
            defparam receive.equalizer_ctrl_b  = equalizer_ctrl_b_setting;
            defparam receive.equalizer_ctrl_c  = equalizer_ctrl_c_setting;
            defparam receive.equalizer_ctrl_d  = equalizer_ctrl_d_setting;
            defparam receive.equalizer_ctrl_v  = equalizer_ctrl_v_setting;
            defparam receive.equalizer_dc_gain = equalizer_dcgain_setting;
            defparam receive.adaptive_equalization_mode  = rx_adaptive_equalization_mode;
            defparam receive.eq_adapt_seq_control = INT_RX_EQ_ADAPT_SEG_CONTROL;
            defparam receive.eq_max_gradient_control  = INT_RX_EQ_MAX_GRADIENT_CONTROL;
            defparam receive.ignore_lock_detect  = rx_ignore_lock_detect;
            defparam receive.enable_lock_to_refclk_sig  = rx_enable_lock_to_refclk_sig;
            defparam receive.enable_lock_to_data_sig  = rx_enable_lock_to_data_sig;
            defparam receive.cru_multiply_by  = INT_RX_CRU_MULTIPLY_BY;
            defparam receive.cru_divide_by  = 1;
            defparam receive.cru_pre_divide_by  = INT_CRU_PRE_DIVIDE_BY;
            defparam receive.cruclk0_period  = INT_RX_CRU0_INCLOCK_PERIOD;
            defparam receive.cruclk1_period = INT_RX_CRU1_INCLOCK_PERIOD;
            defparam receive.cruclk2_period = INT_RX_CRU2_INCLOCK_PERIOD;
            defparam receive.cruclk3_period  = INT_RX_CRU3_INCLOCK_PERIOD;
            defparam receive.cruclk4_period = INT_RX_CRU4_INCLOCK_PERIOD;
            defparam receive.cruclk5_period = INT_RX_CRU5_INCLOCK_PERIOD;
            defparam receive.cruclk6_period = INT_RX_CRU6_INCLOCK_PERIOD;
            defparam receive.cru_clock_select = rx_cru_log_index;
            defparam receive.sim_rxpll_clkout_phase_shift = rx_pll_sim_clkout_phase_shift;
            defparam receive.use_termvoltage_signal = "false";
            defparam receive.common_mode = rx_common_mode;
            defparam receive.termination = receiver_termination;
            defparam receive.protocol_hint = INT_PROTOCOL_HINT;
            defparam receive.dprio_width = 300;
        end
        // End of RX instantiation
        
        if ((rx_use_clkout == "true") || ((INT_EN_CLOCK_SCHEME == "true") && (rx_reconfig_clk_scheme == "indv_clk_source")))
        begin
            assign rx_clkout[num_rx] = rx_clkout_wire[num_rx]; 
        end
        else if (rx_rate_match_fifo_mode_manual_control == "none" && protocol == "gige")
        begin
            assign rx_clkout[num_rx] = rx_clkout_wire[num_rx]; 
        end
        else
        begin
            assign rx_clkout[num_rx] = 1'b0;
        end
        
        if ((num_rx % NUMBER_CHANNELS_PER_QUAD) == 0)
        begin
            assign rx_masterclk[num_rx/NUMBER_CHANNELS_PER_QUAD] = rx_recovclkout_wire[num_rx];
            assign rx_disablefifordin_in[num_rx/NUMBER_CHANNELS_PER_QUAD] = rx_disablefifordout_wire[num_rx]; 
            assign rx_disablefifowrin_in[num_rx/NUMBER_CHANNELS_PER_QUAD] = rx_disablefifowrout_wire[num_rx];
            assign rx_fifordin_in[num_rx/NUMBER_CHANNELS_PER_QUAD] = rx_fifordout_wire[num_rx];
            assign rx_phfifox4wrenable[num_rx/NUMBER_CHANNELS_PER_QUAD] = rx_phfifowrenableout[num_rx];
            assign rx_phfifox4rdenable[num_rx/NUMBER_CHANNELS_PER_QUAD] = rx_phfifordenableout[num_rx];
            assign rx_phfifox4wrclk[num_rx/NUMBER_CHANNELS_PER_QUAD] = rx_phfifowrclkout[num_rx];
            assign rx_phfifox4bytesel[num_rx/NUMBER_CHANNELS_PER_QUAD] = rx_phfifobyteselout[num_rx];
            assign rx_alignstatussync[num_rx/NUMBER_CHANNELS_PER_QUAD] = rx_alignstatussyncout[num_rx];
        end
        
        if ((num_rx % NUMBER_CHANNELS_PER_BI_QUAD) == 0)
        begin
            assign rx_phfifox8wrenable[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] = rx_phfifowrenableout[num_rx];
            assign rx_phfifox8rdenable[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] = rx_phfifordenableout[num_rx];
            assign rx_phfifox8wrclk[num_rx/NUMBER_CHANNELS_PER_BI_QUAD] = rx_phfifowrclkout[num_rx];
            assign rx_phfifox8bytesel[num_rx/NUMBER_CHANNELS_PER_BI_QUAD]  = rx_phfifobyteselout[num_rx];
        end
        
        if (rx_flip_rx_out == "true")
        begin
            for (rx_byte_cnt = (num_rx * INT_RX_DWIDTH_FACTOR); rx_byte_cnt < ((num_rx + 1) * INT_RX_DWIDTH_FACTOR); rx_byte_cnt = rx_byte_cnt + 1) begin:channel_byte
                
                for (rx_bit_cnt=0; rx_bit_cnt < RX_BYTE_SIZE; rx_bit_cnt = rx_bit_cnt + 1) begin:channel_wid
                    assign rx_dataout[(rx_byte_cnt * RX_BYTE_SIZE) + rx_bit_cnt] = rx_out_wire[((rx_byte_cnt + 1 ) * RX_BYTE_SIZE) - 1 - rx_bit_cnt];
                end
                
            end
            
        end 
        else
        begin
             assign rx_dataout[((num_rx + 1) * rx_channel_width) - 1:(num_rx * rx_channel_width)] =  rx_out_wire[(((num_rx + 1) * rx_channel_width) - 1) : (num_rx * rx_channel_width)];
        end
        
        if ((rx_add_generic_fifo_we_synch_register == "true") && (rx_rate_match_fifo_mode == "generic"))
        begin
            wire dffe_pre0_out;
            // Instantiate 2 register in series for the rate matching FIFO write enable
            DFFE dffe_pre0 (    .d(rx_rmfifowrena[num_rx]),
                                .clk(rx_coreclk[num_rx]),
                                //Output port
                                .q(dffe_pre0_out)
                            );
            DFFE dffe_pre1 (    .d(dffe_pre0_out),
                                .clk(rx_coreclk[num_rx]),
                                //Output Port
                                .q(rx_int_rmfifowrena[num_rx])
                            );
        end
        else
        begin
            assign rx_int_rmfifowrena[num_rx] = rx_rmfifowrena[num_rx];
        end

        if (INT_RX_CRU_CLOCK_SELECT == 0)
        begin
            if ((INT_BI_QUAD_BONDED == "true") && (((num_rx/NUMBER_CHANNELS_PER_QUAD) % 2) != 0))
            begin
                assign analogrefclkout_wire[num_rx/NUMBER_CHANNELS_PER_QUAD] = analogrefclkout[(num_rx/NUMBER_CHANNELS_PER_QUAD) - 1];
            end
            else
            begin
                assign analogrefclkout_wire[num_rx/NUMBER_CHANNELS_PER_QUAD] = analogrefclkout[num_rx/NUMBER_CHANNELS_PER_QUAD];
            end
 
            assign rx_pldcruclk_in[num_rx] = analogrefclkout_wire[num_rx/NUMBER_CHANNELS_PER_QUAD];
        end
        else if (INT_RX_CRU_CLOCK_SELECT == 1)
        begin
            if (INT_RX_CRU_DRIVEN_BY_INPUT_PORT == "true")
            begin
                if (INT_RECONFIG_DPRIO_MODE != 0)
                    if ((gen_reconfig_pll == "true") && (rx_cruclk_width > number_of_channels))
                    begin
                        if (rx_cru_log_index == 1)
                            assign rx_pldcruclk_in[num_rx] = rx_cruclk[(num_rx * 9) + 1];
                        else
                            assign rx_pldcruclk_in[num_rx] = rx_cruclk[(num_rx * 9)];
                    end
                    else
                        if (enable_pll_inclk_drive_rx_cru == "true")
                            assign rx_pldcruclk_in[num_rx] = pll_inclk;
                        else
                            assign rx_pldcruclk_in[num_rx] = rx_cruclk[num_rx];  
                else
                     if (enable_pll_inclk_drive_rx_cru == "true")
                        assign rx_pldcruclk_in[num_rx] = pll_inclk;
                     else
                        assign rx_pldcruclk_in[num_rx] = rx_cruclk[num_rx];
                
            end
            else
                if (enable_pll_inclk_drive_rx_cru == "true")
                    assign rx_pldcruclk_in[num_rx] = pll_inclk;
        end
        else
        begin
             assign rx_pldcruclk_in[num_rx] = rx_cru_refclk_div_out[num_rx];
        end
       
        if (INT_RECONFIG_DPRIO_MODE != 0)
        begin

            if (INT_RECONFIG_CMU_PLL_RECONFIG == "true")
            begin
                if (enable_reconfig_pll_inclk_drive_rx == "true")
                    assign rx_cruclk_in[(num_rx * 9) + 8 : (num_rx * 9)] = {1'b0, pll0_clkin[(num_rx/4 * 8) + 7 : (num_rx/4 * 8)]};
                else
                    assign rx_cruclk_in[(num_rx * 9) + 8 : (num_rx * 9)] = {2'b0, rx_cruclk[(num_rx * 7) + 6 : (num_rx * 7)]};
            end
            else
            begin
                if (rx_cru_log_index == 1)
                    assign rx_cruclk_in[(num_rx * 9) + 8 : (num_rx * 9)] = {7'b0,rx_pldcruclk_in[num_rx], rx_pldcruclk_reconfig_in[num_rx]};
                else
                    assign rx_cruclk_in[(num_rx * 9) + 8 : (num_rx * 9)] = {7'b0,rx_pldcruclk_reconfig_in[num_rx], rx_pldcruclk_in[num_rx]};
            end
            
        end
        else
        begin
            assign rx_cruclk_in[(num_rx * 9) + 8 : (num_rx * 9)] = {8'b0, rx_pldcruclk_in[num_rx]};
        end  
        
       if (INT_RX_CRU_REFCLK_DIV_GEN == "true")
       begin
            tri0 [number_of_channels -1 : 0 ] refclk_div_inclk;
            
            if ((enable_reconfig_pll_inclk_drive_rx == "false") && (rx_cruclk_width > number_of_channels))
            begin
                assign refclk_div_inclk[num_rx] = rx_cruclk[(num_rx * 9) + rx_cru_log_index];
            end
            else
            begin
                if (enable_pll_inclk_drive_rx_cru == "true")
                    assign refclk_div_inclk[num_rx] = pll_inclk;
                else
                    assign refclk_div_inclk[num_rx] = rx_cruclk[num_rx];
            end
                
            stratixiigx_hssi_refclk_divider refclk_div  (   .inclk (refclk_div_inclk[num_rx]),
                                                            .clkout(rx_cru_refclk_div_out[num_rx])
                                                         );
            defparam refclk_div.enable_divider = INT_RX_CRU_NEED_REFCLK_DIV;
            defparam refclk_div.divider_number = 0;
            defparam refclk_div.refclk_coupling_termination = INT_CMU_REFCLK_DIV_COUPLING_TERMINATION;
        end   
       
        
        if (INT_RX_CRU_RECONFIG_REFCLK_DIV_GEN == "true")
        begin
            tri0 [number_of_channels -1 : 0 ] refclk_div_reconfig_inclk;
            
            if (gen_reconfig_pll == "true")
            begin
                if (rx_cruclk_width > number_of_channels)
                begin
                    if (rx_cru_log_index == 1)
                        assign refclk_div_reconfig_inclk[num_rx] = rx_cruclk[(num_rx * 9)];
                     else
                        assign refclk_div_reconfig_inclk[num_rx] = rx_cruclk[(num_rx * 9) + 1];
                end
                else
                begin
                    if (enable_pll_inclk_alt_drive_rx_cru == "true")
                        assign refclk_div_reconfig_inclk[num_rx] = pll_inclk_alt; 
                    else
                        assign refclk_div_reconfig_inclk[num_rx] = rx_cruclk_alt[num_rx];    
                end                
            end
            else
                assign refclk_div_reconfig_inclk[num_rx] = 1'b0;
            
            assign rx_pldcruclk_reconfig_in[num_rx] = rx_cru_reconfig_refclk_div_out[num_rx];
            
            stratixiigx_hssi_refclk_divider refclk_div_reconfig  ( .inclk (refclk_div_reconfig_inclk[num_rx]),
                                                                    .clkout(rx_cru_reconfig_refclk_div_out[num_rx])
                                                                    );
            defparam refclk_div_reconfig.enable_divider = INT_RX_CRU_RECONFIG_NEED_REFCLK_DIV;
            defparam refclk_div_reconfig.divider_number = 0;
            defparam refclk_div_reconfig.refclk_coupling_termination = INT_CMU_REFCLK_DIV_COUPLING_TERMINATION;
        end
        else
        begin
            if (INT_RECONFIG_DPRIO_MODE != 0)
            begin
                if (gen_reconfig_pll == "true")
                begin
                    if (rx_cruclk_width > number_of_channels)
                    begin
                        if (rx_cru_log_index == 1)
                            assign rx_pldcruclk_reconfig_in[num_rx] = rx_cruclk[(num_rx * 9)];
                        else
                            assign rx_pldcruclk_reconfig_in[num_rx] = rx_cruclk[(num_rx * 9) + 1];
                    end
                    else
                    begin
                        if (enable_pll_inclk_alt_drive_rx_cru == "true")
                            assign rx_pldcruclk_reconfig_in[num_rx] = pll_inclk_alt;
                        else
                            assign rx_pldcruclk_reconfig_in[num_rx] = rx_cruclk_alt[num_rx];
                    end
                end
                else
                    assign  rx_pldcruclk_reconfig_in[num_rx] = 1'b0;
            end
           
                
        end     
        
        // Fast Recovery PCI Mode IP generation
        if ( enable_fast_recovery_pci_mode == "true")
        begin
    
            tri0 [15 : 0] nfts_rxdata_in;
            tri0 [1:0] nfts_rxdatak_in;
              
            assign rx_locktorefclk_wire[num_rx] =  nfts_ltr_out[num_rx];
            assign rx_locktodata_wire[num_rx] = nfts_ltd_out[num_rx];
            
            if (INT_RX_DWIDTH_FACTOR == 1)
            begin
                assign nfts_rxdata_in = {8'b0, rx_out_wire[(((num_rx + 1) * rx_channel_width) - 1) : (num_rx * rx_channel_width)]};
                assign nfts_rxdatak_in = {1'b0, rx_ctrldetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]};
            end
            else
            begin
                assign nfts_rxdata_in = rx_out_wire[(((num_rx + 1) * rx_channel_width) - 1) : (num_rx * rx_channel_width)];
                assign nfts_rxdatak_in = rx_ctrldetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)];
            end
            
            
            nfts_recovery_ip nfts_core (    .pld_rx_clk ((rx_channel_bonding == "indv")? tx_core_clkout_wire[num_rx] : coreclkout_wire[num_rx/NUMBER_CHANNELS_PER_QUAD]  ),
                                            .pma_reset (rx_analogreset_in[num_rx]),
                                            .pcs_reset (rx_digitalreset_in[num_rx]),
                                            .width ((INT_RX_DWIDTH_FACTOR == 1)? 1'b0 : 1'b1),
                                            .wait_count((rx_use_double_data_mode == "false")? 12'h64 : 12'h32),
                                            .ltd_count((rx_use_double_data_mode == "false")? 16'h3e8 : 16'h1f4),
                                            .rxdata(nfts_rxdata_in),
                                            .rxdatak(nfts_rxdatak_in),
                                            .sigdet(rx_signaldetect_wire[num_rx]),
                                            .rxelecidle_ctrl_ena(1'b1),
                                            .rxvalid_ctrl_ena(1'b1),
                                            .rxvalid_pcs(pipedatavalid_out[num_rx]),
                                            .rxelecidle_pcs(pipeelecidle_out[num_rx]),
                                            .mask_threshold((rx_use_double_data_mode == "false")? 12'h320 : 12'h190),
                                            // Output Port
                                            .ltr(nfts_ltr_out[num_rx]),
                                            .ltd(nfts_ltd_out[num_rx]),
                                            .rxelecidle(pipeelecidle[num_rx]),
                                            .rxvalid(pipedatavalid[num_rx])
                                        );
            
        end
        else
        begin
        
            assign rx_locktorefclk_wire[num_rx] =  rx_locktorefclk[num_rx];
            assign rx_locktodata_wire[num_rx] = rx_locktodata[num_rx];
            assign pipedatavalid[num_rx] = pipedatavalid_out[num_rx];
            assign pipeelecidle[num_rx] = pipeelecidle_out[num_rx];
            
        end
    end 
    else
    begin
        assign rx_dataout[((num_rx + 1) * rx_channel_width) - 1 : (num_rx * rx_channel_width)] = {rx_channel_width{1'b0}};
        assign rx_dataoutfull[ ((num_rx + 1) * 64) - 1 : (num_rx * 64)] = 64'b0;         
        assign rx_clkout[num_rx] = 1'b0;
        assign rx_recovclkout[num_rx] = 1'b0;
        assign rx_pll_locked[num_rx] = 1'b0;
        assign rx_freqlocked[num_rx] = 1'b0;
        assign rx_rlv[num_rx] = 1'b0;
        assign rx_syncstatus[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)] = {INT_RX_DWIDTH_FACTOR{1'b0}};
        assign rx_a1a2sizeout[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)] = {INT_RX_DWIDTH_FACTOR{1'b0}};
        assign rx_a1detect[(INT_RX_WORD_ALIGNER_NUM_BYTE * (num_rx + 1)) - 1 : (num_rx * INT_RX_WORD_ALIGNER_NUM_BYTE)] = {INT_RX_WORD_ALIGNER_NUM_BYTE{1'b0}};
        assign rx_a2detect[(INT_RX_WORD_ALIGNER_NUM_BYTE * (num_rx + 1)) - 1 : (num_rx * INT_RX_WORD_ALIGNER_NUM_BYTE)] = {INT_RX_WORD_ALIGNER_NUM_BYTE{1'b0}};
        assign rx_k1detect[(INT_RX_WORD_ALIGNER_NUM_BYTE * (num_rx + 1)) - 1 : (num_rx * INT_RX_WORD_ALIGNER_NUM_BYTE)]= {INT_RX_WORD_ALIGNER_NUM_BYTE{1'b0}};
        assign rx_k2detect[(num_rx * 2) + 1 : (num_rx * 2)] = {2{1'b0}};
        assign rx_ctrldetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)] =  {INT_RX_DWIDTH_FACTOR{1'b0}};
        assign rx_errdetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)] =  {INT_RX_DWIDTH_FACTOR{1'b0}};
        assign rx_disperr[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)] =  {INT_RX_DWIDTH_FACTOR{1'b0}};
        assign rx_patterndetect[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)] = {INT_RX_DWIDTH_FACTOR{1'b0}};
        assign rx_runningdisp[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)] = {INT_RX_DWIDTH_FACTOR{1'b0}};
        assign rx_rmfifodatainserted[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)]= {INT_RX_DWIDTH_FACTOR{1'b0}};
        assign rx_rmfifodatadeleted[((num_rx + 1) * INT_RX_DWIDTH_FACTOR) - 1:(num_rx * INT_RX_DWIDTH_FACTOR)] = {INT_RX_DWIDTH_FACTOR{1'b0}};
        assign rx_rmfifoalmostempty[num_rx] = 1'b0;
        assign rx_rmfifoempty[num_rx] = 1'b0;
        assign rx_rmfifofull[num_rx] = 1'b0;
        assign rx_rmfifoalmostfull[num_rx] = 1'b0;
        assign rx_bisterr[num_rx] = 1'b0;
        assign rx_bistdone[num_rx] = 1'b0;
        assign rx_byteorderalignstatus[num_rx] = 1'b0;
        assign rx_phfifooverflow[num_rx] = 1'b0;
        assign rx_phfifounderflow[num_rx] = 1'b0;
        assign rx_signaldetect[num_rx] = 1'b0;
        assign pipestatus[(3 * num_rx) + 2 : (3 * num_rx)] = {3{1'b0}};
        assign pipedatavalid[num_rx] = 1'b0;
        assign pipeelecidle[num_rx] = 1'b0;
        assign pipephydonestatus[num_rx] = 1'b0;
        assign debug_rx_phase_comp_fifo_error[num_rx] = 1'b0;
        assign aeq_fromgxb[(num_rx * 6) + 5 : (num_rx * 6)] = 6'b0;
      
    end  
           
end
endgenerate 
// End generate for receiver


//Lastly, generate a calibration block if it is needed
generate

    if (use_calibration_block == "true")
        stratixiigx_hssi_calibration_block cal_blk  (
                                                        .clk(cal_blk_clk),
                                                        .powerdn(cal_blk_powerdown),
                                                        .calibrationstatus(cal_blk_calibrationstatus)
                                                    );
    else
        assign cal_blk_calibrationstatus[4:0] = {5{1'b0}};
endgenerate

// Error checkings for alt2gxb. 
initial /* synthesis enable_verilog_initial_construct */
begin
    
    if ((starting_channel_number % 4) != 0)
    begin
        $display("Error: Parameter starting_channel_number can only have values in multiple 4.");
    end
    
       
    if ((rx_add_generic_fifo_we_synch_register != "true") && (rx_add_generic_fifo_we_synch_register != "false"))
    begin
        $display("Error: %s is illegal value for parameter rx_add_generic_fifo_we_synch_register", rx_add_generic_fifo_we_synch_register);
    end
    
    if ((rx_rate_match_fifo_mode != "generic") && (rx_add_generic_fifo_we_synch_register == "true"))
    begin
        $display("Error: rx_rate_match_fifo_mode need to be set as GENERIC for rx_add_generic_fifo_we_synch_register feature");

    end
    
    if (RX_DESERIALIZATION_FACTOR == 8)
    begin
        if ((rx_run_length % 4) != 0)
        begin
            $display ("Error: rx_run_length parameter need to be divisible by 4 if deserialization factor is 8");     

        end  
         
        if ((rx_use_deserializer_double_data_mode == "false") && (rx_run_length > 256))
        begin
            $display("Error:Value of rx_run_length parameter need to be less or equal to 256");

        end
        else if ((rx_use_deserializer_double_data_mode == "true") && (rx_run_length > 512))
        begin
             $display("Error:Value of rx_run_length parameter need to be less or equal to 512");

        end
    end
    else 
    begin
        if ((rx_run_length % 5) != 0)
        begin
          $display ("Error: rx_run_length parameter need to be divisible by 5 if deserialization factor is 10");  

        end
  
        if ((rx_use_deserializer_double_data_mode == "false") && (rx_run_length > 320))
        begin
            $display("Error:Value of rx_run_length parameter need to be less or equal to 320");

        end
        else if ((rx_use_deserializer_double_data_mode == "true") && (rx_run_length > 640))
        begin
            $display("Error:Value of rx_run_length parameter need to be less or equal to 640");

        end
    end

    if ((rx_use_pipe8b10binvpolarity  == "true") && (rx_allow_align_polarity_inversion == "true" ))
    begin
          $display ("Error:Either pipe8b10binvpolarity or rx_invpolarity input ports are used");

    end 
    
    if ((operation_mode != "rx") && (operation_mode != "tx") && (operation_mode != "duplex"))
    begin
        $display ("Error: Parameter value for operation_mode can only be rx, tx or duplex.");
    end
    
    if ((loopback_mode != "slb") && (loopback_mode != "plb") && (loopback_mode != "none"))
    begin
        $display("Error: Parameter value for loopback_mode can only be slb, plb or none");
    end
    
    if ((reverse_loopback_mode != "none") && (reverse_loopback_mode != "precdr_rslb") && (reverse_loopback_mode != "postcdr_rslb") &&
        (reverse_loopback_mode != "rplb"))
    begin
        $display ("Error: Parameter value for reverse_loopback_mode can only be none, precdr_rslb, postcdr_rslb or rplb.");
    end
    
    if ((protocol != "xaui") && (protocol != "gige") && (protocol != "cei_6g") && (protocol != "5g_scrambled") &&
        (protocol != "5g_scrambled") && (protocol != "pipe") && (protocol != "sonet") && (protocol != "3g_basic") &&
        (protocol != "6g_basic") && (protocol != "cpri"))
    begin
        $display ("Error: Parameter value for protocol can only be xaui, gige, sonet, cei_6g, 5g_scrambled, 6g_basic, 3g_basic, pipe and cpri");
    end
    
    if ((rx_reconfig_clk_scheme != "indv_clk_source") && (rx_reconfig_clk_scheme != "tx_ch0_clk_to_rx") && (rx_reconfig_clk_scheme != "tx_clk_to_rx"))
    begin
        $display ("Error: rx_reconfig_clk_scheme can only have indv_clk_source, tx_ch0_clk_to_rx or tx_clk_to_rx as parameter value.");
    end
    
    if ((rx_channel_width  != 8) && (rx_channel_width != 10) && (rx_channel_width != 16) && (rx_channel_width != 20) &&
        (rx_channel_width != 32) && (rx_channel_width != 40))
    begin
        $display ("Error: rx_channel_width can only have 8, 10, 16, 20, 32 or 40 as parameter value.");
    end
    
    if ((rx_use_double_data_mode != "true") && (rx_use_double_data_mode != "false"))
    begin
        $display ("Error: rx_use_double_data_mode parameter can only be true or false.");
    end
    
    if ((rx_use_deserializer_double_data_mode != "true") && (rx_use_deserializer_double_data_mode != "false"))
    begin
        $display ("Error: rx_use_deserializer_double_data_mode parameter can only be true or false.");
    end
    
    if ((rx_dprio_mode != "none") && (rx_dprio_mode != "pma_electricals") && (rx_dprio_mode != "full"))
    begin
        $display ("Error: Parameter rx_dprio_mode parameter can only be none, pma_electricals or full.");
    end
    
    if ((rx_use_rising_edge_triggered_pattern_align != "true") && (rx_use_rising_edge_triggered_pattern_align != "false"))
    begin
        $display ("Error: rx_use_rising_edge_triggered_pattern_align parameter can only be true or false.");
    end
    
    if ((rx_disable_running_disp_in_word_align != "true") && (rx_disable_running_disp_in_word_align != "false"))
    begin
        $display ("Error: rx_disable_running_disp_in_word_align parameter can only be true or false.");
    end
    
    if ((rx_enable_true_complement_match_in_word_align != "true") && (rx_enable_true_complement_match_in_word_align != "false"))
    begin
        $display ("Error: rx_enable_true_complement_match_in_word_align parameter can only be true or false.");
    end
    
    if ((rx_bitslip_enable != "true") && (rx_bitslip_enable != "false"))
    begin
        $display ("Error: rx_bitslip_enable parameter can only be true or false.");
    end
    
    if ((rx_align_loss_sync_error_num < 1) || (rx_align_loss_sync_error_num > 8))
    begin
        $display ("Error: Invalid value for parameter rx_align_loss_sync_error_num. The parameter value can only be within 1-8.");
    end
        
    if ((rx_run_length_enable != "true") && (rx_run_length_enable != "false"))
    begin
        $display ("Error: rx_run_length_enable parameter can only be true or false.");
    end
    
    if ((rx_allow_align_polarity_inversion != "true") && (rx_allow_align_polarity_inversion != "false"))
    begin
        $display ("Error: rx_allow_align_polarity_inversion parameter can only be true or false.");
    end
    
    if ((rx_enable_bit_reversal != "true") && (rx_enable_bit_reversal != "false"))
    begin
        $display ("Error: rx_enable_bit_reversal parameter can only be true or false.");
    end
    
    if ((rx_enable_deep_align_byte_swap != "true") && (rx_enable_deep_align_byte_swap != "false"))
    begin
        $display ("Error: rx_enable_deep_align_byte_swap parameter can only be true or false.");
    end
    
    if ((rx_8b_10b_mode != "none") && (rx_8b_10b_mode != "normal") && (rx_8b_10b_mode != "cascaded"))
    begin
        $display ("Error: rx_8b_10b_mode parameter can only be none, normal or cascaded.");
    end
    
    if ((rx_infiniband_invalid_code < 0) || (rx_infiniband_invalid_code > 3))
    begin
        $display ("Error: rx_infiniband_invalid_code parameter value can only be 0,1,2, or 3.");
    end
    
    if ((rx_rate_match_fifo_mode != "none") && (rx_rate_match_fifo_mode != "normal") && (rx_rate_match_fifo_mode != "cascaded") &&
        (rx_rate_match_fifo_mode != "cascaded_generic") && (rx_rate_match_fifo_mode != "generic"))
    begin
        $display ("Error: rx_rate_match_fifo_mode paramater value can only be none, normal, generic or cascaded_generic.");
    end
    
    if ((rx_rate_match_almost_empty_threshold < 0) || (rx_rate_match_almost_empty_threshold > 15))
    begin
        $display ("Error: rx_rate_match_almost_empty_threshold parameter value can only be integer between 0 and 15.");
    end
      
    if ((rx_rate_match_almost_full_threshold  < 0) || (rx_rate_match_almost_full_threshold > 15))
    begin
        $display ("Error: rx_rate_match_almost_full_threshold parameter value can only be integer between 0 and 15.");
    end
    
    if ((rx_byte_ordering_mode != "none") && (rx_byte_ordering_mode != "pattern-based") && (rx_byte_ordering_mode != "syncstatus-based"))
    begin
        $display ("Error: rx_byte_ordering_mode parameter can only have none, pattern-based and syncstatus-based as parameter value.");
    end
    
       
    if ((rx_allow_pipe_polarity_inversion != "true") && (rx_allow_pipe_polarity_inversion != "false"))
    begin
        $display ("Error: rx_allow_pipe_polarity_inversion parameter can only be true or false.");
    end
    
       
    if ((rx_disable_auto_idle_insertion != "true") && (rx_disable_auto_idle_insertion != "false"))
    begin
        $display ("Error: rx_disable_auto_idle_insertion parameter can only be true or false.");
    end
    
    if ((rx_enable_self_test_mode != "true") && (rx_enable_self_test_mode != "false"))
    begin
        $display ("Error: rx_enable_self_test_mode parameter can only be true or false.");
    end
    
    if ((rx_self_test_mode != "prbs_7") && (rx_self_test_mode != "prbs_8") && (rx_self_test_mode != "prbs_10") &&
        (rx_self_test_mode != "prbs_23") && (rx_self_test_mode != "low_freq") && (rx_self_test_mode != "mixed_freq") &&
        (rx_self_test_mode != "high_freq") && (rx_self_test_mode != "incremental") && (rx_self_test_mode != "cjpat") &&
        (rx_self_test_mode != "crpat"))
    begin
        $display ("Error: rx_self_test_mode parameter can only have prbs_7, prbs_8, prbs_10, prbs_23, low_freq, mixed_freq, high_freq, incremental, cjpat and crpat as legal parameter values.");
    end
    
    if ((rx_force_signal_detect != "true") && (rx_force_signal_detect != "false"))
    begin
        $display ("Error: rx_force_signal_detect parameter can only be true or false.");
    end
    
    if ((rx_ppmselect < 0) || (rx_ppmselect > 63))
    begin
        $display ("Error: rx_ppmselect parameter value can only be integer value from 0 until 63.");
    end
    
    if ((rx_bandwidth_mode < 0) || (rx_bandwidth_mode > 3))
    begin
        $display ("Error: rx_bandwidth_mode parameter value can only be integer value from 0 until 3.");
    end
    
    if ((rx_enable_dc_coupling != "true") && (rx_enable_dc_coupling != "false"))
    begin
        $display ("Error: rx_enable_dc_coupling parameter value can only be true or false.");
    end
    
    if ((rx_signal_detect_threshold < 1) || (rx_signal_detect_threshold > 3))
    begin
        $display ("Warning: rx_signal_detect_threshold parameter value can only be integer value from 1 until 3.");
    end
    
    if ((equalizer_ctrl_a_setting < 0) || (equalizer_ctrl_a_setting > 7))
    begin
        $display ("Error: equalizer_ctrl_a_setting parameter value can only be integer value from 0 until 7.");
    end
    
    if ((equalizer_ctrl_b_setting < 0) || (equalizer_ctrl_b_setting > 7))
    begin
        $display ("Error: equalizer_ctrl_b_setting parameter value can only be integer value from 0 until 7.");
    end
    
    if ((equalizer_ctrl_c_setting < 0) || (equalizer_ctrl_c_setting > 7))
    begin
        $display ("Error: equalizer_ctrl_c_setting parameter value can only be integer value from 0 until 7.");
    end
    
    if ((equalizer_ctrl_d_setting < 0) || (equalizer_ctrl_d_setting > 7))
    begin
        $display ("Error: equalizer_ctrl_d_setting parameter value can only be integer value from 0 until 7.");
    end
    
    if ((equalizer_ctrl_v_setting < 0) || (equalizer_ctrl_v_setting > 7))
    begin
        $display ("Error: equalizer_ctrl_v_setting parameter value can only be integer value from 0 until 7.");
    end
    
    if ((equalizer_dcgain_setting < 0) || (equalizer_dcgain_setting > 3))
    begin
        $display ("Error: equalizer_dcgain_setting parameter value can only be integer value from 0 until 3.");
    end
    
    if ((rx_adaptive_equalization_mode != "continuous") && (rx_adaptive_equalization_mode != "none") && (rx_adaptive_equalization_mode != "stopped"))
    begin
        $display ("Error: rx_adaptive_equalization_mode parameter value can only be continuous, stopped or none.");
    end
    
    if ((rx_ignore_lock_detect != "true") && (rx_ignore_lock_detect != "false"))
    begin
        $display ("Error: rx_ignore_lock_detect parameter value can only be true or false.");
    end
    
    if ((rx_enable_lock_to_refclk_sig != "true") && (rx_enable_lock_to_refclk_sig != "false"))
    begin
        $display ("Error: rx_enable_lock_to_refclk_sig parameter value can only be true or false.");
    end
    
    if ((rx_enable_lock_to_data_sig != "true") && (rx_enable_lock_to_data_sig != "false"))
    begin
        $display ("Error: rx_enable_lock_to_data_sig parameter can only be true or false.");
    end
    
    if ((rx_use_cruclk != "true") && (rx_use_cruclk != "false"))
    begin
        $display ("Error: rx_use_cruclk parameter value can only be true or false.");
    end
    
    if ((rx_use_coreclk != "true") && (rx_use_coreclk != "false"))
    begin
        $display ("Error: rx_use_coreclk parameter value can only be true or false.");
    end
    
    if ((rx_use_clkout != "true") && (rx_use_clkout != "false"))
    begin
        $display ("Error: rx_use_clkout parameter value can only be true or false.");
    end
    
    if ((rx_use_pipe8b10binvpolarity != "true") && (rx_use_pipe8b10binvpolarity != "false"))
    begin
        $display ("Error: rx_use_pipe8b10binvpolarity parameter value can only be true or false.");
    end
    
    if ((rx_channel_bonding != "indv") && (rx_channel_bonding != "x4") && (rx_channel_bonding != "x8") && 
        (rx_channel_bonding != "x4_unbundled") && (rx_channel_bonding != "x8_unbundled"))
    begin
        $display ("Error: rx_channel_bonding parameter value can only be indv, x4, x8, x4_unbundled or x8_unbundled.");
    end
    
    if ((rx_force_signal_detect_dig != "true") && (rx_force_signal_detect_dig != "false"))
    begin
        $display ("Error: rx_force_signal_detect_dig parameter value can only be true or false.");
    end
    
    if ((rx_insert_pad_on_underflow != "true") && (rx_insert_pad_on_underflow != "false"))
    begin
        $display ("Error: rx_insert_pad_on_underflow parameter value can only be true or false.");
    end
    
    if ((cmu_clk_div_use_coreclk_out_post_divider != "true") && (cmu_clk_div_use_coreclk_out_post_divider != "false"))
    begin
        $display ("Error: cmu_clk_div_use_coreclk_out_post_divider parameter value can only be true or false.");
    end
    
    if ((rx_use_local_refclk != "true") && (rx_use_local_refclk != "false"))
    begin
        $display ("Error: rx_use_local_refclk parameter value can only be true or false.");
    end
    
    if ((tx_channel_width  != 8) && (tx_channel_width != 10) && (tx_channel_width != 16) && (tx_channel_width != 20) &&
        (tx_channel_width != 32) && (tx_channel_width != 40))
    begin
        $display ("Error: tx_channel_width can only have 8, 10, 16, 20, 32 or 40 as parameter value.");
    end
    
    if ((tx_use_double_data_mode != "true") && (tx_use_double_data_mode != "false"))
    begin
        $display ("Error: tx_use_double_data_mode parameter value can only be true or false.");
    end
    
    if ((tx_use_serializer_double_data_mode != "true") && (tx_use_serializer_double_data_mode != "false"))
    begin
        $display ("Error: tx_use_serializer_double_data_mode parameter can only be true or false.");
    end
    
    if ((tx_dprio_mode != "none") && (tx_dprio_mode != "pma_electricals") && (tx_dprio_mode != "full"))
    begin
        $display ("Error: Parameter tx_dprio_mode parameter can only be none, pma_electricals or full.");
    end
    
    if ((tx_reconfig_clk_scheme != "indv_clk_source") && (tx_reconfig_clk_scheme != "tx_ch0_clk_source"))
    begin
        $display ("Error: tx_reconfig_clk_scheme can only have indv_clk_source or tx_ch0_clk_source as parameter value.");
    end
    
    if ((tx_8b_10b_mode != "none") && (tx_8b_10b_mode != "normal") && (tx_8b_10b_mode != "cascaded"))
    begin
        $display ("Error: tx_8b_10b_mode parameter can only be none, normal or cascaded.");
    end
    
    if ((tx_force_disparity_mode != "true") && (tx_force_disparity_mode != "false"))
    begin
        $display ("Error: tx_force_disparity_mode parameter value can only be true or false.");
    end
    
    if ((tx_force_kchar != "true") && (tx_force_kchar != "false"))
    begin
        $display ("Error: tx_force_kchar parameter value can only be true or false.");
    end
    
    if ((tx_force_echar != "true") && (tx_force_echar != "false"))
    begin
        $display ("Error: tx_force_echar parameter value can only be true or false.");
    end
    
    if ((tx_allow_polarity_inversion != "true") && (tx_allow_polarity_inversion != "false"))
    begin
        $display ("Error: tx_allow_polarity_inversion parameter value can only be true or false.");
    end
    
    if ((tx_enable_symbol_swap != "true") && (tx_enable_symbol_swap != "false"))
    begin
        $display ("Error: tx_enable_symbol_swap parameter value can only be true or false.");
    end
    
    if ((tx_enable_bit_reversal != "true") && (tx_enable_bit_reversal != "false"))
    begin
        $display ("Error: tx_enable_bit_reversal parameter value can only be true or false.");
    end
    
    if ((tx_use_coreclk != "true") && (tx_use_coreclk != "false"))
    begin
        $display ("Error: tx_use_coreclk parameter value can only be true or false.");
    end
    
    if ((tx_enable_self_test_mode != "true") && (tx_enable_self_test_mode != "false"))
    begin
        $display ("Error: tx_enable_self_test_mode parameter value can only be true or false.");
    end
    
    if ((tx_self_test_mode != "prbs_7") && (tx_self_test_mode != "prbs_8") && (tx_self_test_mode != "prbs_10") &&
        (tx_self_test_mode != "prbs_23") && (tx_self_test_mode != "low_freq") && (tx_self_test_mode != "mixed_freq") &&
        (tx_self_test_mode != "high_freq") && (tx_self_test_mode != "incremental") && (tx_self_test_mode != "cjpat") &&
        (tx_self_test_mode != "crpat"))
    begin
        $display ("Error: tx_self_test_mode parameter can only have prbs_7, prbs_8, prbs_10, prbs_23, low_freq, mixed_freq, high_freq, incremental, cjpat and crpat as legal parameter values.");
    end
    
    if ((vod_ctrl_setting < 0) || (vod_ctrl_setting > 7))
    begin
        $display ("Error: vod_ctrl_setting parameter value can only be integer from 0 until 7. ");
    end
    
    if ((preemphasis_ctrl_pretap_setting < 0) || (preemphasis_ctrl_pretap_setting > 7))
    begin
         $display ("Error: preemphasis_ctrl_pretap_setting parameter value can only be integer from 0 until 7. ");
    end
    
    if ((preemphasis_ctrl_1stposttap_setting < 0) || (preemphasis_ctrl_1stposttap_setting > 15))
    begin
         $display ("Error: preemphasis_ctrl_1stposttap_setting parameter value can only be integer from 0 until 15. ");
    end
    
    if ((preemphasis_ctrl_2ndposttap_setting < 0) || (preemphasis_ctrl_2ndposttap_setting > 7))
    begin
         $display ("Error: preemphasis_ctrl_2ndposttap_setting parameter value can only be integer from 0 until 7. ");
    end
    
    if ((tx_channel_bonding != "indv") && (tx_channel_bonding != "x4") && (tx_channel_bonding != "x8") && (tx_channel_bonding != "x4_unbundled") && (tx_channel_bonding != "x8_unbundled"))
    begin
        $display ("Error: tx_channel_bonding parameter value can only be indv, x4, x8, x4_unbundled and x8_unbundled.");
    end
    
    if ((enable_fast_recovery_pci_mode != "true") && (enable_fast_recovery_pci_mode != "false"))
    begin
        $display ("Error: enable_fast_recovery_pci_mode parameter value can only be true or false.");
    end
    
    if ((enable_fast_recovery_pci_mode == "true") && (protocol != "pipe"))
    begin
        $display ("Error: enable_fast_recovery_pci_mode parameter can only be set to true when protocol is set to pipe.");
    end
    
    if ((tx_refclk_divide_by != 1) && (tx_refclk_divide_by != 2) && (tx_refclk_divide_by != 4))
    begin
        $display("Error: tx_refclk_divide_by parameter value can only be 1, 2 or 4");
    end
    
    if ((en_local_clk_div_ctrl != "true") && (en_local_clk_div_ctrl != "false"))
    begin
        $display("Error: en_local_clk_div_ctrl parameter value can only be true or false");
    end    
    
    if ((enforce_refclk_divider != "true") && (enforce_refclk_divider != "false") && (enforce_refclk_divider != "auto"))
    begin
        $display("Error: enforce_refclk_divider parameter value can only be true, false or auto");
    end
   
    
end
endmodule

////////////////////////////////////////////////////////////////////
//
//   nfts_recovery_ip core
//
//  Copyright (C) 1991-2013 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions  
//  and other software and tools, and its AMPP partner logic  
//  functions, and any output files from any of the foregoing  
//  (including device programming or simulation files), and any  
//  associated documentation or information are expressly subject  
//  to the terms and conditions of the Altera Program License  
//  Subscription Agreement, Altera MegaCore Function License  
//  Agreement, or other applicable license agreement, including,  
//  without limitation, that your use is for the sole purpose of  
//  programming logic devices manufactured by Altera and sold by  
//  Altera or its authorized distributors.  Please refer to the  
//  applicable agreement for further details. 
//  
//  Quartus II 13.1.1 Build 166 11/26/2013 
//
//
//
////////////////////////////////////////////////////////////////////

//************************************************************
// Description:
//
// This module contains nfts recovery ip core.
//************************************************************

`timescale 1 ns / 1 ps

module nfts_recovery_ip (

    // General signals
	pld_rx_clk,			// x1 mode = tx_clk
                        // x4 and x8 mode = refclk_out
                        // single width = 250 MHz
                        // double width mode = 125 MHz
    
	pma_reset,			// analog reset
	pcs_reset,			// digital reset
    
    // Configuration
	width,				// Single width = 1'b0, Double width = 1'b1
	
	rxelecidle_ctrl_ena,	// Enable the assertion/deassertion of RxElecIdle by 
						// the IP when asserted.  Otherwise, pass RxElecIdle
						// as generated by the PCS to the upper layer i.e. ~sigdet

	rxvalid_ctrl_ena,		// enable the assertion/deassertion of RxValid by the IP
						// when asserted.  Otherwise, pass RxValid as generated 
						// by the PCS to the upper layer
						
	wait_count,			// Wait Counter threshold = 12 bit limit
	mask_threshold,		// Programmable window in which the data is not examined when 
						// switching between forced ltr and forced ltd.  Begins when
						// ltd counter begins
	ltd_count,			// LTD Counter limit = 16 bit limit
    
    // Inputs from HSSI
	rxdata,				// PCIE RX Parallel Data
	rxdatak,				// PCIE RX parallel control code indicator
	rxvalid_pcs,			// PCIE Valid data indicator
    
	rxelecidle_pcs,		// RxElecIdle from the PCS
	
	sigdet,				// Signal detect port.  Indicates if a signal
                        // that meets the specified range is present at 
                        // the input of the receive buffer
    
	// Output to the Upper layer
	rxelecidle,			// RxElecIdle output to the Upper layer
	rxvalid,				// RxValid to the Upper layer
	
    // Outputs to HSSI
	ltr,					// Lock to reference control of the CDR
	ltd					// Lock to data control of the CDR
);


//********************************************************************************
// I/O SIGNALS
//********************************************************************************
    // General signals
input			pld_rx_clk;
input			pma_reset;
input			pcs_reset;

    // Configurations
input			width;

input			rxelecidle_ctrl_ena;
input			rxvalid_ctrl_ena;


input	[11:0]	wait_count;
input	[11:0]	mask_threshold;	// should set to 400 ns i.e. x32 for dw, x64 for sw
input	[15:0]	ltd_count;


    // HSSI inputs
input	[15:0]	rxdata;
input	[1:0]	rxdatak;
input			rxvalid_pcs;

input			rxelecidle_pcs;

input			sigdet;

	// Outputs to the upper layer;
output			rxelecidle;
output			rxvalid;

    // HSSI Outputs
output			ltr;
output			ltd;

    // Electrical Idle detector
wire 			elecidle_detected;

	// NFTS OS detector
wire 			nfts_os_detected;

    // Wait Counter
wire				reset_wait_counter;
wire				wait_counter_done;

    // LTD Counter
wire				reset_ltd_counter;
wire				ltd_counter_done;

wire                reset_n;

wire				reset_mask;
wire				mask_exp;	// asserted when 400 ns window expires, reset when counter
								// is reset

//********************************************************************************
// ASSIGN STATEMENTS
//********************************************************************************
assign reset_n = ~ (pma_reset | pcs_reset);

//********************************************************************************
// SUBMODULE INSTANTIATIONS
//********************************************************************************
electrical_idle_detector electrical_idle_detector(

    // General signals
	.clk									(pld_rx_clk),
	.reset_n								(reset_n),

	// Configuration
	.width								(width),

	// HSSI Input
	.rxdata								(rxdata),
	.rxdatak								(rxdatak),
	.rxvalid								(rxvalid),

	// FSM
	.elecidle_detected						(elecidle_detected)
);

nfts_os_detector nfts_os_detector (

	// General signals
	.clk									(pld_rx_clk),
	.reset_n								(reset_n),
    
    // Configuration
	.width								(width),
    
    // HSSI Input
	.rxdata								(rxdata),
	.rxdatak								(rxdatak),
	.rxvalid								(rxvalid_pcs),		// need to use rxvalid from WA otherwise NFTS will not
														// be detected i.e. LTR_LTD asserts rxvalid after NFTS detection
    
    // FSM
	.nfts_os_detected						(nfts_os_detected)
);

wait_counter wait_counter(

    // General signals
	.clk									(pld_rx_clk),
	.reset_n								(reset_n),
    
    // Control
	.threshold							(wait_count),
	.reset_wait_counter						(reset_wait_counter),

	.wait_counter_done						(wait_counter_done),
	
	.mask_threshold						(mask_threshold),
	.reset_mask							(reset_mask),
	.mask_exp								(mask_exp)


    
);

ltd_counter ltd_counter(

    // General signals
	.clk									(pld_rx_clk),
	.reset_n								(reset_n),
    
    // Control
	.threshold							(ltd_count),
	
	.reset_ltd_counter						(reset_ltd_counter),
	.ltd_counter_done						(ltd_counter_done)
);

ltr_ltd_fsm ltr_ltd_fsm(

    // General signals
	.clk									(pld_rx_clk),
	.reset_n								(reset_n),
    
    
	// Configuration
	.rxelecidle_ctrl_ena					(rxelecidle_ctrl_ena),
	.rxvalid_ctrl_ena						(rxvalid_ctrl_ena),
	
    // HSSI Interface
	.rxelecidle_pcs						(rxelecidle_pcs),
	.rxelecidle							(rxelecidle),
    
	.sigdet								(sigdet),

	.rxvalid_pcs							(rxvalid_pcs),
	.rxvalid								(rxvalid),

	.ltr									(ltr),
	.ltd									(ltd),
    
    // electrical idle detector
	.elecidle_detected						(elecidle_detected),

	// nfts os  detector
	.nfts_os_detected						(nfts_os_detected),
    
    // Wait counter
	.reset_wait_counter						(reset_wait_counter),
	.wait_counter_done						(wait_counter_done),

    //ltd counter
	.reset_ltd_counter						(reset_ltd_counter),
	.ltd_counter_done						(ltd_counter_done),
		
	.reset_mask							(reset_mask),
	.mask_exp								(mask_exp)
    
);



endmodule

`timescale 1 ns / 1 ps

module electrical_idle_detector(

    // General signals
	clk,					// x1 mode = tx_clk
                        // x4 and x8 mode = refclk_out
                        // single width = 250 MHz
                        // double width mode = 125 MHz
	reset_n,				// IP reset
    
    // Configuration
	width,				// Single width = 1'b0, Double width = 1'b1
    
	// HSSI Input
	rxdata,				// PCIE RX Parallel Data
	rxdatak,				// PCIE RX parallel control code indicator
	rxvalid,				// PCIE Valid data indicator
    
    // LTR LTD FSM
	elecidle_detected		// Indicates that an EIOS has been received
                        // on the RX parallel interface
);


//********************************************************************************
// I/O SIGNALS
//********************************************************************************
    // General signals
input			clk;
input			reset_n;
    
    // Configuration
input			width;

    // HSSI Input: PIPE signals
input	[15:0]	rxdata;
input	[1:0]	rxdatak;
input			rxvalid;

    
output			elecidle_detected;			// asserted for 1 cycle

parameter COM_SYMBOL = 8'hBC;
parameter IDLE_SYMBOL = 8'h7C;


    // FSM
reg				elecidle_detected;

    // Case: Double Width, COM on high byte
reg				com_detected_high_0;
reg				com_detected_high_1;
reg				com_detected_high_2;

reg				idle_detected_high_0;
reg				idle_detected_high_1;

reg				idle_detected_low_0;
reg				idle_detected_low_1;

    // Case: Double Width, COM on low byte
reg				com_detected_low_0;
reg				com_detected_low_1;

    // Single Width
reg				com_detected_low_2;
reg				com_detected_low_3;

reg				idle_detected_low_2;


wire		[7:0]	rxdata_low;
wire		[7:0]	rxdata_high;

//********************************************************************************
// ASSIGN STATEMENTS
//********************************************************************************
assign rxdata_low = rxdata[7:0];
assign rxdata_high = rxdata[15:8];

always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		com_detected_high_0		<= 1'b0;
		com_detected_low_0		<= 1'b0;
        
		idle_detected_high_0	<= 1'b0;
		idle_detected_low_0		<= 1'b0;
    end
    else
    begin
        if (rxdata_high == COM_SYMBOL)
			com_detected_high_0		<= rxdatak[1] & rxvalid;
        else
			com_detected_high_0		<= 1'b0;
            
        if (rxdata_low == COM_SYMBOL)
			com_detected_low_0		<= rxdatak[0] & rxvalid;
        else
			com_detected_low_0		<= 1'b0;
            
        if (rxdata_high == IDLE_SYMBOL)
			idle_detected_high_0	<= rxdatak[1] & rxvalid;
        else
			idle_detected_high_0	<= 1'b0;
            
        if (rxdata_low == IDLE_SYMBOL)
			idle_detected_low_0		<= rxdatak[0] & rxvalid;
        else
			idle_detected_low_0		<= 1'b0;
    end
end

always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		com_detected_high_1		<= 1'b0;
		com_detected_low_1		<= 1'b0;
        
		idle_detected_high_1	<= 1'b0;
		idle_detected_low_1		<= 1'b0;
    end
    else
    begin
		com_detected_high_1		<= com_detected_high_0;
		com_detected_low_1		<= com_detected_low_0;
        
		idle_detected_high_1	<= idle_detected_high_0;
		idle_detected_low_1		<= idle_detected_low_0;
    end
end


always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		com_detected_low_2		<= 1'b0;
		com_detected_high_2		<= 1'b0;
		idle_detected_low_2		<= 1'b0;
    end
    else
    begin
		com_detected_low_2		<= com_detected_low_1;
		com_detected_high_2		<= com_detected_high_1;
		idle_detected_low_2		<= idle_detected_low_1;
    end
end

always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		com_detected_low_3		<= 1'b0;
    end
    else
    begin
		com_detected_low_3		<= com_detected_low_2;
	end
end

always @ (posedge clk or negedge reset_n)
begin
	if (!reset_n)
	begin
		elecidle_detected	<= 1'b0;
	end
	else
	begin
		// Single Width C-I-I-X
		if (~width & com_detected_low_3 & idle_detected_low_2 & idle_detected_low_1)
			elecidle_detected	<= 1'b1;
		// Single Width C-I-X-I
		else if  (~width & com_detected_low_3 & idle_detected_low_2 & ~idle_detected_low_1 & idle_detected_low_0)
			elecidle_detected	<= 1'b1;
		// Single Width C-X-I-I
		else if (~width & com_detected_low_3 & ~idle_detected_low_2 & idle_detected_low_1 & idle_detected_low_0)
			elecidle_detected	<= 1'b1;
		
		// Double Width COM LOW C-I-I-X
		else if (width & com_detected_low_1 & idle_detected_high_1 & idle_detected_low_0)
			elecidle_detected	<= 1'b1;
		// Double Width COM LOW C-I-X-I
		else if (width & com_detected_low_1 & idle_detected_high_1 & ~idle_detected_low_0 & idle_detected_high_0)
			elecidle_detected	<= 1'b1;
		// Double Width COM LOW C-X-I-I
		else if (width & com_detected_low_1 & ~idle_detected_high_1 & idle_detected_low_0 & idle_detected_high_0)
			elecidle_detected	<= 1'b1;

		// Double Width COM HIGH C-I-I-X
		else if (width & com_detected_high_2 & idle_detected_low_1 & idle_detected_high_1)
			elecidle_detected	<= 1'b1;
		// Double Width COM HIGH C-I-X-I
		else if (width & com_detected_high_2 & idle_detected_low_1 & ~idle_detected_high_1 & idle_detected_low_0)
			elecidle_detected	<= 1'b1;
		// Double Width COM HIGH C-X-I-I
		else if (width & com_detected_high_2 & ~idle_detected_low_1 & idle_detected_high_1 & idle_detected_low_0)
			elecidle_detected	<= 1'b1;
		
        else
			elecidle_detected	<= 1'b0;
    end
end
endmodule

`timescale 1 ns / 1 ps

module ltd_counter(

    // General signals
	clk,					// x1 mode = tx_clk
                        // x4 and x8 mode = refclk_out
                        // single width = 250 MHz
                        // double width mode = 125 MHz
	reset_n,				// IP reset
    
    // Control
	threshold,			// Configurable: should remain static
    
	reset_ltd_counter,		// Resets counter: controlled by LTR LTD FSM


	ltd_counter_done		// Indicates when threshold delay has been reached.
                        // Remains asserted until reset_wait_counter is aserted

);


//********************************************************************************
// INCLUDE STATEMENTS
//********************************************************************************

//********************************************************************************
// I/O SIGNALS
//********************************************************************************
	// General signals
input			clk;
input			reset_n;
    
    // Control
input	[15:0]	threshold;

input			reset_ltd_counter;

output			ltd_counter_done;



    // output
reg				ltd_counter_done;

    // Counter
reg	[15:0]		threshold_reg;

reg	[15:0]		counter;


//********************************************************************************
// ASSIGN STATEMENTS
//********************************************************************************


// Register threshold
always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		threshold_reg		<= 16'h0;
    end
    else
    begin
		threshold_reg		<= threshold;
    end
end

//Counter: reset value is offset by 2 due to FSM reaction time
always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		counter	<= 16'h0;
    end
    else
    begin
        if (reset_ltd_counter)
			counter	<= 16'h0002;
        else
			counter	<= counter + 16'h0001;
    end
end

always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		ltd_counter_done	<= 1'b0;
    end
    else
    begin
        if (threshold_reg == 16'h0000)
			ltd_counter_done	<= 1'b1;
        else if (threshold_reg == 16'h0001)
			ltd_counter_done	<= 1'b1;
        else if (reset_ltd_counter)
			ltd_counter_done	<= 1'b0;
        else if (counter == threshold_reg)
			ltd_counter_done	<= 1'b1;
		else
			ltd_counter_done	<= ltd_counter_done;
			
    end
end
endmodule

`timescale 1 ns / 1 ps

module ltr_ltd_fsm(

    // General signals
	clk,								// x1 mode = tx_clk
                        // x4 and x8 mode = refclk_out
                        // single width = 250 MHz
                        // double width mode = 125 MHz
	reset_n,							// IP reset
	
	// Configuration
	rxelecidle_ctrl_ena,				// Enable the assertion/deassertion of RxElecIdle by 
									// the IP when asserted.  Otherwise, pass RxElecIdle
									// as generated by the PCS to the upper layer i.e. ~sigdet
	
	rxvalid_ctrl_ena,					// enable the assertion/deassertion of RxValid by the IP
									// when asserted.  Otherwise, pass RxValid as generated 
									// by the PCS to the upper layer
    
    // HSSI Interface
	rxelecidle_pcs,					// RxElecIdle from the PCS
	rxelecidle,						// RxElecIdle output to the Upper layer
	
	sigdet,							// Signal detect port.  Indicates if a signal
                        // that meets the specified range is present at 
                        // the input of the receive buffer

	rxvalid_pcs,						// RxValid from the PCS 
	rxvalid,							// RxValid output to the upper layer
	
	ltr,								// Lock to reference control of the CDR
	ltd,								// Lock to data control of the CDR
    
    // electrical idle detector
	elecidle_detected,					// Indicates that an EIOS has been received
									// on the RX parallel interface

	// NFTS OS detector
	nfts_os_detected,					// Indicates that an NFTS OS has been received
                        // on the RX parallel interface

    // Wait Counter
	reset_wait_counter,					// Resets wait counter
	wait_counter_done,					// Indicates when threshold delay for wait counter has 
									// been reached.  Remains asserted until reset_wait_counter
									// is asserted. The threshold should be set for the 
									// minimal time required for LTR to be asserted
									// such that rx_pll_lock is re-asserted								
    // LTD Counter
	reset_ltd_counter,					// Resets ltd counter
	ltd_counter_done,					// Indicates when threshold delay for ltd counter has
                        // been reached.  Remains asserted until reset_ltd_counter 
									// is asserted.  This is set to a maximum of 4 us from the point
									// that the wait counter has expired and sigdet is asserted
									
	reset_mask,						// Reset mask counter 
	mask_exp							// Unstable period of time after de-assertion of LTR to lock to data  
);


//********************************************************************************
// INCLUDE STATEMENTS
//********************************************************************************

//********************************************************************************
// I/O SIGNALS
//********************************************************************************
	// General signals
input			clk;
input			reset_n;
	
	// Configure
input			rxelecidle_ctrl_ena;
input			rxvalid_ctrl_ena;

    
    // HSSI
input			rxelecidle_pcs;
output			rxelecidle;

input			sigdet;

input			rxvalid_pcs;
output			rxvalid;

output			ltr;
output			ltd;

    // Electrical idle detector
input			elecidle_detected;

	// NFTS detector
input			nfts_os_detected;


    // Wait counter
output			reset_wait_counter;
input			wait_counter_done;

    // LTD counter
output			reset_ltd_counter;
input			ltd_counter_done;


	//LTD MASK	
output			reset_mask;
input			mask_exp;


	
//********************************************************************************
// PARAMETERS
//********************************************************************************
parameter	WAIT_FOR_EIOS					= 2'b00;
parameter	FORCE_LTR						= 2'b01;
parameter MASK_DATA						= 2'b10;
parameter AUTO_EI						= 2'b11;
//********************************************************************************
// DECLARATIONS
//********************************************************************************
    // HSSI
reg				rxelecidle_int;
wire				rxelecidle;

reg				rxvalid_int;
wire				rxvalid;

reg				ltr;
reg				ltd;

	// Wait counter
reg				reset_wait_counter;

	// LTD counter
reg				reset_ltd_counter;

	// LTD Mask counter
reg				reset_mask;

reg	[1:0]		state;
reg	[1:0]		next_state;
//********************************************************************************
// ASSIGN STATEMENTS
//********************************************************************************
assign rxelecidle = rxelecidle_ctrl_ena? (rxelecidle_int| rxelecidle_pcs): rxelecidle_pcs;
assign rxvalid = rxvalid_ctrl_ena? (rxvalid_int & rxvalid_pcs): rxvalid_pcs;

//********************************************************************************
// SUBMODULE INSTANTIATIONS
//********************************************************************************

//********************************************************************************
// MAIN CODE
//********************************************************************************
always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		state	<= WAIT_FOR_EIOS;
    end
    else
    begin
		state	<= next_state;
    end
end

always @ (state or elecidle_detected or nfts_os_detected or sigdet or   
		  wait_counter_done or mask_exp or ltd_counter_done )
begin
    case (state)
    WAIT_FOR_EIOS:
    begin
		rxelecidle_int					= 1'b0;
		rxvalid_int					= 1'b1;
		
		ltr							= 1'b0;
		ltd							= 1'b0;
        
		reset_wait_counter				= 1'b1;
		reset_ltd_counter				= 1'b1;
		reset_mask					= 1'b1;
        
        if (elecidle_detected)
			next_state	= FORCE_LTR;
        else
			next_state	= WAIT_FOR_EIOS;
	end
	
	FORCE_LTR:
	begin
		rxelecidle_int					= 1'b1;
		rxvalid_int					= 1'b0;
		
		ltr							= 1'b1;
		ltd							= 1'b0;
		
		reset_wait_counter				= 1'b0;
		reset_ltd_counter				= 1'b1;
		reset_mask					= 1'b1;
		
		if (sigdet & wait_counter_done)			
			next_state	= MASK_DATA;
		else
			next_state	= FORCE_LTR;
    end
    
	MASK_DATA:
    begin
		rxelecidle_int					= 1'b1;
		rxvalid_int					= 1'b0;
        
		ltr							= 1'b0;				
		ltd							= 1'b0;				
        
		reset_wait_counter				= 1'b1;
		reset_ltd_counter				= 1'b0;
		reset_mask					= 1'b0;
		
		if (nfts_os_detected & mask_exp)
			next_state	= AUTO_EI;
		else if (mask_exp & ~sigdet)
			next_state	= WAIT_FOR_EIOS;
		else if (mask_exp & elecidle_detected)
			next_state	= FORCE_LTR;
		else if (ltd_counter_done)					// L1/L2 exit
			next_state	= WAIT_FOR_EIOS;
        else
			next_state	= MASK_DATA;
    end
    
	AUTO_EI:
    begin
		rxelecidle_int					= 1'b0;
		rxvalid_int					= 1'b1;

		ltr							= 1'b0;				
		ltd							= 1'b0;				
        
		reset_wait_counter				= 1'b1;
		reset_ltd_counter				= 1'b0;
		reset_mask					= 1'b1;
        
		if (elecidle_detected)
			next_state	= FORCE_LTR;
		else if (ltd_counter_done)					// L1/L2 exit
			next_state	= WAIT_FOR_EIOS;
		else if (~sigdet)
			next_state	= WAIT_FOR_EIOS;
        else
			next_state	= AUTO_EI;
    end
    
    default:
    begin
		rxelecidle_int					= 1'b0;
		rxvalid_int					= 1'b1;
        
		ltr							= 1'b0;
		ltd							= 1'b0;

		reset_wait_counter				= 1'b1;
		reset_ltd_counter				= 1'b1;
		reset_mask					= 1'b1;

		next_state		= WAIT_FOR_EIOS;
    end
    endcase
end
endmodule

`timescale 1 ns / 1 ps

module wait_counter(

    // General signals
	clk,							// x1 mode = tx_clk
                        // x4 and x8 mode = refclk_out
                        // single width = 250 MHz
                        // double width mode = 125 MHz
	reset_n,						// IP reset
    
    // Control
	threshold,					// Configurable: should remain static
	reset_wait_counter,				// Resets counter: controlled by LTR LTD FSM	
	wait_counter_done,				// Indicates when threshold delay has been reached.
								// Remains asserted until reset_wait_counter is asserted
						
	mask_threshold,				/// Programmable window in which the data is not examined when 
								// switching between forced ltr and forced ltd.  Begins when
								// ltd is asserted

	reset_mask,					// Reset mask counter: reuse counter
	mask_exp						// Unstable period of time after de-assertion of LTR to lock to data  

);


    // General signals
input			clk;
input			reset_n;
    
    // Control
input	[11:0]	threshold;		
input			reset_wait_counter;

output			wait_counter_done;	

input	[11:0]	mask_threshold;
input			reset_mask;

output			mask_exp;

    // output
reg				wait_counter_done;
reg				mask_exp;

    // Counter
reg	[11:0]		threshold_reg;		//register threshold
reg	[11:0]		mask_threshold_reg;
reg	[11:0]		counter;

// register threshold
always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		threshold_reg			<= 12'h0;
		mask_threshold_reg		<= 12'h0;
    end
    else
    begin
		threshold_reg			<= threshold;
		mask_threshold_reg		<= mask_threshold;
    end
end

//update from state machine requires reset value be offset by 2
always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		counter	<= 12'h000;
    end
    else
    begin
		if (reset_wait_counter & reset_mask)
			counter	<= 12'h002;
        else
			counter	<= counter + 12'h001;
    end
end


// assertion of wait_counter_done to move LTR LTD FSM from LTR_EI to AUTO_EI if SigDet is asserted
always @ (posedge clk or negedge reset_n)
begin
    if (!reset_n)
    begin
		wait_counter_done				<= 1'b0;
		mask_exp						<= 1'b0;
    end
    else
    begin
        
        if (threshold_reg == 12'h000)
			wait_counter_done	<= 1'b1;
        else if (threshold_reg == 12'h001)
			wait_counter_done	<= 1'b0;
        else if (reset_wait_counter)
			wait_counter_done	<= 1'b0;
        else if (counter == threshold_reg)
			wait_counter_done	<= 1'b1;
		else
			wait_counter_done	<= wait_counter_done;
			
		
		if (mask_threshold_reg == 12'h000)
			mask_exp	<= 1'b1;
		else if (mask_threshold_reg == 12'h001)
			mask_exp	<= 1'b0;
		else if (reset_mask)
			mask_exp	<= 1'b0;
		else if (counter == mask_threshold_reg)
			mask_exp	<= 1'b1;
		else
			mask_exp	<= mask_exp;
	end
end
endmodule

`timescale 1 ns / 1 ps

module nfts_os_detector(

	// General signals
	clk,					// x1 mode = tx_clk
						// x4 and x8 mode = refclk_out
						// single width = 250 MHz
						// double width mode = 125 MHz
	reset_n,				// IP reset
	
	// Configuration
	width,				// Single width = 1'b0, Double width = 1'b1
	
	// HSSI Input
	rxdata,				// PCIE RX Parallel Data
	rxdatak,				// PCIE RX parallel control code indicator
	rxvalid,				// PCIE Valid data indicator
	
	// LTR LTD FSM
	nfts_os_detected		// Indicates that an NFTS OS has been received
						// on the RX parallel interface
);


//********************************************************************************
// INCLUDE STATEMENTS
//********************************************************************************

//********************************************************************************
// I/O SIGNALS
//********************************************************************************
	// General signals
input			clk;
input			reset_n;
	
	// Configuration
input			width;

	// HSSI Input: PIPE signals
input	[15:0]	rxdata;
input	[1:0]	rxdatak;
input			rxvalid;

	
output			nfts_os_detected;			// asserted for 1 cycle

//********************************************************************************
// PARAMETERS
//********************************************************************************
parameter COM_SYMBOL = 8'hBC;
parameter FTS_SYMBOL = 8'h3C;

//********************************************************************************
// DECLARATIONS
//********************************************************************************

	// FSM
reg				nfts_os_detected;

	// Case: Double Width, COM on high byte
reg				com_detected_high_0;
reg				com_detected_high_1;
reg				com_detected_high_2;

reg				fts_detected_high_0;
reg				fts_detected_high_1;

reg				fts_detected_low_0;
reg				fts_detected_low_1;

	// Case: Double Width, COM on low byte
reg				com_detected_low_0;
reg				com_detected_low_1;

	// Single Width
reg				com_detected_low_2;
reg				com_detected_low_3;

reg				fts_detected_low_2;


wire		[7:0]	rxdata_low;
wire		[7:0]	rxdata_high;

//********************************************************************************
// ASSIGN STATEMENTS
//********************************************************************************
assign rxdata_low = rxdata[7:0];
assign rxdata_high = rxdata[15:8];

//********************************************************************************
// SUBMODULE INSTANTIATIONS
//********************************************************************************

//********************************************************************************
// MAIN CODE
//********************************************************************************
always @ (posedge clk or negedge reset_n)
begin
	if (!reset_n)
	begin
		com_detected_high_0		<= 1'b0;
		com_detected_low_0		<= 1'b0;
		
		fts_detected_high_0		<= 1'b0;
		fts_detected_low_0		<= 1'b0;
	end
	else
	begin
		if (rxdata_high == COM_SYMBOL)
			com_detected_high_0		<= rxdatak[1] & rxvalid;
		else
			com_detected_high_0		<= 1'b0;
			
		if (rxdata_low == COM_SYMBOL)
			com_detected_low_0		<= rxdatak[0] & rxvalid;
		else
			com_detected_low_0		<= 1'b0;
			
		if (rxdata_high == FTS_SYMBOL)
			fts_detected_high_0	<= rxdatak[1] & rxvalid;
		else
			fts_detected_high_0	<= 1'b0;
			
		if (rxdata_low == FTS_SYMBOL)
			fts_detected_low_0		<= rxdatak[0] & rxvalid;
		else
			fts_detected_low_0		<= 1'b0;
	end
end

always @ (posedge clk or negedge reset_n)
begin
	if (!reset_n)
	begin
		com_detected_high_1		<= 1'b0;
		com_detected_low_1		<= 1'b0;
		
		fts_detected_high_1		<= 1'b0;
		fts_detected_low_1		<= 1'b0;
	end
	else
	begin
		com_detected_high_1		<= com_detected_high_0;
		com_detected_low_1		<= com_detected_low_0;
		
		fts_detected_high_1		<= fts_detected_high_0;
		fts_detected_low_1		<= fts_detected_low_0;
	end
end


always @ (posedge clk or negedge reset_n)
begin
	if (!reset_n)
	begin
		com_detected_low_2		<= 1'b0;
		com_detected_high_2		<= 1'b0;
		fts_detected_low_2		<= 1'b0;
	end
	else
	begin
		com_detected_low_2		<= com_detected_low_1;
		com_detected_high_2		<= com_detected_high_1;
		fts_detected_low_2		<= fts_detected_low_1;
	end
end

always @ (posedge clk or negedge reset_n)
begin
	if (!reset_n)
	begin
		com_detected_low_3		<= 1'b0;
	end
	else
	begin
		com_detected_low_3		<= com_detected_low_2;
	end
end

always @ (posedge clk or negedge reset_n)
begin
	if (!reset_n)
	begin
		nfts_os_detected	<= 1'b0;
	end
	else
	begin
		// Single Width C-N-N-N
		if (~width & com_detected_low_3 & fts_detected_low_2 & fts_detected_low_1 & fts_detected_low_0)
			nfts_os_detected	<= 1'b1;
		
		// Double Width COM LOW C-N-N-N
		else if (width & com_detected_low_1 & fts_detected_high_1 & fts_detected_low_0 & fts_detected_high_0)
			nfts_os_detected	<= 1'b1;

		// Double Width COM HIGH C-I-I-I
		else if (width & com_detected_high_2 & fts_detected_low_1 & fts_detected_high_1 & fts_detected_low_0)
			nfts_os_detected	<= 1'b1;
		
		else
			nfts_os_detected	<= 1'b0;
    end
end
endmodule
