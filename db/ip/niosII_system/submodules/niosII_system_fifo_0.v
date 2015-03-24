//Legal Notice: (C)2015 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module niosII_system_fifo_0_dual_clock_fifo (
                                              // inputs:
                                               aclr,
                                               data,
                                               rdclk,
                                               rdreq,
                                               wrclk,
                                               wrreq,

                                              // outputs:
                                               q,
                                               rdempty,
                                               rdfull,
                                               rdusedw,
                                               wrempty,
                                               wrfull,
                                               wrusedw
                                            )
;

  output  [ 31: 0] q;
  output           rdempty;
  output           rdfull;
  output  [  6: 0] rdusedw;
  output           wrempty;
  output           wrfull;
  output  [  6: 0] wrusedw;
  input            aclr;
  input   [ 31: 0] data;
  input            rdclk;
  input            rdreq;
  input            wrclk;
  input            wrreq;

  wire             int_rdfull;
  wire             int_wrfull;
  wire    [ 31: 0] q;
  wire             rdempty;
  wire             rdfull;
  wire    [  6: 0] rdusedw;
  wire             wrempty;
  wire             wrfull;
  wire    [  6: 0] wrusedw;
  assign wrfull = (wrusedw >= 128-3) | int_wrfull;
  assign rdfull = (rdusedw >= 128-3) | int_rdfull;
  dcfifo dual_clock_fifo
    (
      .aclr (aclr),
      .data (data),
      .q (q),
      .rdclk (rdclk),
      .rdempty (rdempty),
      .rdfull (int_rdfull),
      .rdreq (rdreq),
      .rdusedw (rdusedw),
      .wrclk (wrclk),
      .wrempty (wrempty),
      .wrfull (int_wrfull),
      .wrreq (wrreq),
      .wrusedw (wrusedw)
    );

  defparam dual_clock_fifo.intended_device_family = "CYCLONEII",
           dual_clock_fifo.lpm_hint = "MAXIMIZE_SPEED=5,",
           dual_clock_fifo.lpm_numwords = 128,
           dual_clock_fifo.lpm_showahead = "OFF",
           dual_clock_fifo.lpm_type = "dcfifo",
           dual_clock_fifo.lpm_width = 32,
           dual_clock_fifo.lpm_widthu = 7,
           dual_clock_fifo.overflow_checking = "ON",
           dual_clock_fifo.rdsync_delaypipe = 4,
           dual_clock_fifo.underflow_checking = "ON",
           dual_clock_fifo.use_eab = "ON",
           dual_clock_fifo.wrsync_delaypipe = 4;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module niosII_system_fifo_0_dcfifo_with_controls (
                                                   // inputs:
                                                    data,
                                                    rdclk,
                                                    rdclk_control_slave_address,
                                                    rdclk_control_slave_read,
                                                    rdclk_control_slave_write,
                                                    rdclk_control_slave_writedata,
                                                    rdreq,
                                                    rdreset_n,
                                                    wrclk,
                                                    wrclk_control_slave_address,
                                                    wrclk_control_slave_read,
                                                    wrclk_control_slave_write,
                                                    wrclk_control_slave_writedata,
                                                    wrreq,
                                                    wrreset_n,

                                                   // outputs:
                                                    q,
                                                    rdclk_control_slave_readdata,
                                                    rdempty,
                                                    wrclk_control_slave_readdata,
                                                    wrfull
                                                 )
;

  output  [ 31: 0] q;
  output  [ 31: 0] rdclk_control_slave_readdata;
  output           rdempty;
  output  [ 31: 0] wrclk_control_slave_readdata;
  output           wrfull;
  input   [ 31: 0] data;
  input            rdclk;
  input   [  2: 0] rdclk_control_slave_address;
  input            rdclk_control_slave_read;
  input            rdclk_control_slave_write;
  input   [ 31: 0] rdclk_control_slave_writedata;
  input            rdreq;
  input            rdreset_n;
  input            wrclk;
  input   [  2: 0] wrclk_control_slave_address;
  input            wrclk_control_slave_read;
  input            wrclk_control_slave_write;
  input   [ 31: 0] wrclk_control_slave_writedata;
  input            wrreq;
  input            wrreset_n;

  wire    [ 31: 0] q;
  reg              rdclk_control_slave_almostempty_n_reg;
  wire             rdclk_control_slave_almostempty_pulse;
  wire             rdclk_control_slave_almostempty_signal;
  reg     [  7: 0] rdclk_control_slave_almostempty_threshold_register;
  reg              rdclk_control_slave_almostfull_n_reg;
  wire             rdclk_control_slave_almostfull_pulse;
  wire             rdclk_control_slave_almostfull_signal;
  reg     [  7: 0] rdclk_control_slave_almostfull_threshold_register;
  reg              rdclk_control_slave_empty_n_reg;
  wire             rdclk_control_slave_empty_pulse;
  wire             rdclk_control_slave_empty_signal;
  reg              rdclk_control_slave_event_almostempty_q;
  wire             rdclk_control_slave_event_almostempty_signal;
  reg              rdclk_control_slave_event_almostfull_q;
  wire             rdclk_control_slave_event_almostfull_signal;
  reg              rdclk_control_slave_event_empty_q;
  wire             rdclk_control_slave_event_empty_signal;
  reg              rdclk_control_slave_event_full_q;
  wire             rdclk_control_slave_event_full_signal;
  reg              rdclk_control_slave_event_overflow_q;
  wire             rdclk_control_slave_event_overflow_signal;
  wire    [  5: 0] rdclk_control_slave_event_register;
  reg              rdclk_control_slave_event_underflow_q;
  wire             rdclk_control_slave_event_underflow_signal;
  reg              rdclk_control_slave_full_n_reg;
  wire             rdclk_control_slave_full_pulse;
  wire             rdclk_control_slave_full_signal;
  reg     [  5: 0] rdclk_control_slave_ienable_register;
  wire    [  7: 0] rdclk_control_slave_level_register;
  wire    [ 31: 0] rdclk_control_slave_read_mux;
  reg     [ 31: 0] rdclk_control_slave_readdata;
  reg              rdclk_control_slave_status_almostempty_q;
  wire             rdclk_control_slave_status_almostempty_signal;
  reg              rdclk_control_slave_status_almostfull_q;
  wire             rdclk_control_slave_status_almostfull_signal;
  reg              rdclk_control_slave_status_empty_q;
  wire             rdclk_control_slave_status_empty_signal;
  reg              rdclk_control_slave_status_full_q;
  wire             rdclk_control_slave_status_full_signal;
  reg              rdclk_control_slave_status_overflow_q;
  wire             rdclk_control_slave_status_overflow_signal;
  wire    [  5: 0] rdclk_control_slave_status_register;
  reg              rdclk_control_slave_status_underflow_q;
  wire             rdclk_control_slave_status_underflow_signal;
  wire    [  7: 0] rdclk_control_slave_threshold_writedata;
  wire             rdempty;
  wire             rdfull;
  wire    [  7: 0] rdlevel;
  wire             rdoverflow;
  wire             rdunderflow;
  wire    [  6: 0] rdusedw;
  reg              wrclk_control_slave_almostempty_n_reg;
  wire             wrclk_control_slave_almostempty_pulse;
  wire             wrclk_control_slave_almostempty_signal;
  reg     [  7: 0] wrclk_control_slave_almostempty_threshold_register;
  reg              wrclk_control_slave_almostfull_n_reg;
  wire             wrclk_control_slave_almostfull_pulse;
  wire             wrclk_control_slave_almostfull_signal;
  reg     [  7: 0] wrclk_control_slave_almostfull_threshold_register;
  reg              wrclk_control_slave_empty_n_reg;
  wire             wrclk_control_slave_empty_pulse;
  wire             wrclk_control_slave_empty_signal;
  reg              wrclk_control_slave_event_almostempty_q;
  wire             wrclk_control_slave_event_almostempty_signal;
  reg              wrclk_control_slave_event_almostfull_q;
  wire             wrclk_control_slave_event_almostfull_signal;
  reg              wrclk_control_slave_event_empty_q;
  wire             wrclk_control_slave_event_empty_signal;
  reg              wrclk_control_slave_event_full_q;
  wire             wrclk_control_slave_event_full_signal;
  reg              wrclk_control_slave_event_overflow_q;
  wire             wrclk_control_slave_event_overflow_signal;
  wire    [  5: 0] wrclk_control_slave_event_register;
  reg              wrclk_control_slave_event_underflow_q;
  wire             wrclk_control_slave_event_underflow_signal;
  reg              wrclk_control_slave_full_n_reg;
  wire             wrclk_control_slave_full_pulse;
  wire             wrclk_control_slave_full_signal;
  reg     [  5: 0] wrclk_control_slave_ienable_register;
  wire    [  7: 0] wrclk_control_slave_level_register;
  wire    [ 31: 0] wrclk_control_slave_read_mux;
  reg     [ 31: 0] wrclk_control_slave_readdata;
  reg              wrclk_control_slave_status_almostempty_q;
  wire             wrclk_control_slave_status_almostempty_signal;
  reg              wrclk_control_slave_status_almostfull_q;
  wire             wrclk_control_slave_status_almostfull_signal;
  reg              wrclk_control_slave_status_empty_q;
  wire             wrclk_control_slave_status_empty_signal;
  reg              wrclk_control_slave_status_full_q;
  wire             wrclk_control_slave_status_full_signal;
  reg              wrclk_control_slave_status_overflow_q;
  wire             wrclk_control_slave_status_overflow_signal;
  wire    [  5: 0] wrclk_control_slave_status_register;
  reg              wrclk_control_slave_status_underflow_q;
  wire             wrclk_control_slave_status_underflow_signal;
  wire    [  7: 0] wrclk_control_slave_threshold_writedata;
  wire             wrempty;
  wire             wrfull;
  wire    [  7: 0] wrlevel;
  wire             wroverflow;
  wire             wrunderflow;
  wire    [  6: 0] wrusedw;
  //the_dcfifo, which is an e_instance
  niosII_system_fifo_0_dual_clock_fifo the_dcfifo
    (
      .aclr    (~wrreset_n),
      .data    (data),
      .q       (q),
      .rdclk   (rdclk),
      .rdempty (rdempty),
      .rdfull  (rdfull),
      .rdreq   (rdreq),
      .rdusedw (rdusedw),
      .wrclk   (wrclk),
      .wrempty (wrempty),
      .wrfull  (wrfull),
      .wrreq   (wrreq),
      .wrusedw (wrusedw)
    );

  assign wrlevel = {1'b0,
    wrusedw};

  assign wroverflow = wrreq & wrfull;
  assign wrunderflow = rdreq & wrempty;
  assign wrclk_control_slave_threshold_writedata = (wrclk_control_slave_writedata < 1) ? 1 :
    (wrclk_control_slave_writedata > 124) ? 124 :
    wrclk_control_slave_writedata[7 : 0];

  assign wrclk_control_slave_event_almostfull_signal = wrclk_control_slave_almostfull_pulse;
  assign wrclk_control_slave_event_almostempty_signal = wrclk_control_slave_almostempty_pulse;
  assign wrclk_control_slave_status_almostfull_signal = wrclk_control_slave_almostfull_signal;
  assign wrclk_control_slave_status_almostempty_signal = wrclk_control_slave_almostempty_signal;
  assign wrclk_control_slave_event_full_signal = wrclk_control_slave_full_pulse;
  assign wrclk_control_slave_event_empty_signal = wrclk_control_slave_empty_pulse;
  assign wrclk_control_slave_status_full_signal = wrclk_control_slave_full_signal;
  assign wrclk_control_slave_status_empty_signal = wrclk_control_slave_empty_signal;
  assign wrclk_control_slave_event_overflow_signal = wroverflow;
  assign wrclk_control_slave_event_underflow_signal = wrunderflow;
  assign wrclk_control_slave_status_overflow_signal = wroverflow;
  assign wrclk_control_slave_status_underflow_signal = wrunderflow;
  assign wrclk_control_slave_empty_signal = wrempty;
  assign wrclk_control_slave_empty_pulse = wrclk_control_slave_empty_signal & wrclk_control_slave_empty_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_empty_n_reg <= 0;
      else 
        wrclk_control_slave_empty_n_reg <= !wrclk_control_slave_empty_signal;
    end


  assign wrclk_control_slave_full_signal = wrfull;
  assign wrclk_control_slave_full_pulse = wrclk_control_slave_full_signal & wrclk_control_slave_full_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_full_n_reg <= 0;
      else 
        wrclk_control_slave_full_n_reg <= !wrclk_control_slave_full_signal;
    end


  assign wrclk_control_slave_almostempty_signal = wrlevel <= wrclk_control_slave_almostempty_threshold_register;
  assign wrclk_control_slave_almostempty_pulse = wrclk_control_slave_almostempty_signal & wrclk_control_slave_almostempty_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostempty_n_reg <= 0;
      else 
        wrclk_control_slave_almostempty_n_reg <= !wrclk_control_slave_almostempty_signal;
    end


  assign wrclk_control_slave_almostfull_signal = wrlevel >= wrclk_control_slave_almostfull_threshold_register;
  assign wrclk_control_slave_almostfull_pulse = wrclk_control_slave_almostfull_signal & wrclk_control_slave_almostfull_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostfull_n_reg <= 0;
      else 
        wrclk_control_slave_almostfull_n_reg <= !wrclk_control_slave_almostfull_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostempty_threshold_register <= 1;
      else if ((wrclk_control_slave_address == 5) & wrclk_control_slave_write)
          wrclk_control_slave_almostempty_threshold_register <= wrclk_control_slave_threshold_writedata;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostfull_threshold_register <= 124;
      else if ((wrclk_control_slave_address == 4) & wrclk_control_slave_write)
          wrclk_control_slave_almostfull_threshold_register <= wrclk_control_slave_threshold_writedata;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_ienable_register <= 0;
      else if ((wrclk_control_slave_address == 3) & wrclk_control_slave_write)
          wrclk_control_slave_ienable_register <= wrclk_control_slave_writedata[5 : 0];
    end


  assign wrclk_control_slave_level_register = wrlevel;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_underflow_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[5])
          wrclk_control_slave_event_underflow_q <= 0;
      else if (wrclk_control_slave_event_underflow_signal)
          wrclk_control_slave_event_underflow_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_overflow_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[4])
          wrclk_control_slave_event_overflow_q <= 0;
      else if (wrclk_control_slave_event_overflow_signal)
          wrclk_control_slave_event_overflow_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_almostempty_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[3])
          wrclk_control_slave_event_almostempty_q <= 0;
      else if (wrclk_control_slave_event_almostempty_signal)
          wrclk_control_slave_event_almostempty_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_almostfull_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[2])
          wrclk_control_slave_event_almostfull_q <= 0;
      else if (wrclk_control_slave_event_almostfull_signal)
          wrclk_control_slave_event_almostfull_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_empty_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[1])
          wrclk_control_slave_event_empty_q <= 0;
      else if (wrclk_control_slave_event_empty_signal)
          wrclk_control_slave_event_empty_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_full_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[0])
          wrclk_control_slave_event_full_q <= 0;
      else if (wrclk_control_slave_event_full_signal)
          wrclk_control_slave_event_full_q <= -1;
    end


  assign wrclk_control_slave_event_register = {wrclk_control_slave_event_underflow_q,
    wrclk_control_slave_event_overflow_q,
    wrclk_control_slave_event_almostempty_q,
    wrclk_control_slave_event_almostfull_q,
    wrclk_control_slave_event_empty_q,
    wrclk_control_slave_event_full_q};

  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_underflow_q <= 0;
      else 
        wrclk_control_slave_status_underflow_q <= wrclk_control_slave_status_underflow_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_overflow_q <= 0;
      else 
        wrclk_control_slave_status_overflow_q <= wrclk_control_slave_status_overflow_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_almostempty_q <= 0;
      else 
        wrclk_control_slave_status_almostempty_q <= wrclk_control_slave_status_almostempty_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_almostfull_q <= 0;
      else 
        wrclk_control_slave_status_almostfull_q <= wrclk_control_slave_status_almostfull_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_empty_q <= 0;
      else 
        wrclk_control_slave_status_empty_q <= wrclk_control_slave_status_empty_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_full_q <= 0;
      else 
        wrclk_control_slave_status_full_q <= wrclk_control_slave_status_full_signal;
    end


  assign wrclk_control_slave_status_register = {wrclk_control_slave_status_underflow_q,
    wrclk_control_slave_status_overflow_q,
    wrclk_control_slave_status_almostempty_q,
    wrclk_control_slave_status_almostfull_q,
    wrclk_control_slave_status_empty_q,
    wrclk_control_slave_status_full_q};

  assign wrclk_control_slave_read_mux = ({32 {(wrclk_control_slave_address == 0)}} & wrclk_control_slave_level_register) |
    ({32 {(wrclk_control_slave_address == 1)}} & wrclk_control_slave_status_register) |
    ({32 {(wrclk_control_slave_address == 2)}} & wrclk_control_slave_event_register) |
    ({32 {(wrclk_control_slave_address == 3)}} & wrclk_control_slave_ienable_register) |
    ({32 {(wrclk_control_slave_address == 4)}} & wrclk_control_slave_almostfull_threshold_register) |
    ({32 {(wrclk_control_slave_address == 5)}} & wrclk_control_slave_almostempty_threshold_register) |
    ({32 {(~((wrclk_control_slave_address == 0))) && (~((wrclk_control_slave_address == 1))) && (~((wrclk_control_slave_address == 2))) && (~((wrclk_control_slave_address == 3))) && (~((wrclk_control_slave_address == 4))) && (~((wrclk_control_slave_address == 5)))}} & wrclk_control_slave_level_register);

  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_readdata <= 0;
      else if (wrclk_control_slave_read)
          wrclk_control_slave_readdata <= wrclk_control_slave_read_mux;
    end


  assign rdlevel = {1'b0,
    rdusedw};

  assign rdoverflow = wrreq & rdfull;
  assign rdunderflow = rdreq & rdempty;
  assign rdclk_control_slave_threshold_writedata = (rdclk_control_slave_writedata < 1) ? 1 :
    (rdclk_control_slave_writedata > 124) ? 124 :
    rdclk_control_slave_writedata[7 : 0];

  assign rdclk_control_slave_event_almostfull_signal = rdclk_control_slave_almostfull_pulse;
  assign rdclk_control_slave_event_almostempty_signal = rdclk_control_slave_almostempty_pulse;
  assign rdclk_control_slave_status_almostfull_signal = rdclk_control_slave_almostfull_signal;
  assign rdclk_control_slave_status_almostempty_signal = rdclk_control_slave_almostempty_signal;
  assign rdclk_control_slave_event_full_signal = rdclk_control_slave_full_pulse;
  assign rdclk_control_slave_event_empty_signal = rdclk_control_slave_empty_pulse;
  assign rdclk_control_slave_status_full_signal = rdclk_control_slave_full_signal;
  assign rdclk_control_slave_status_empty_signal = rdclk_control_slave_empty_signal;
  assign rdclk_control_slave_event_overflow_signal = rdoverflow;
  assign rdclk_control_slave_event_underflow_signal = rdunderflow;
  assign rdclk_control_slave_status_overflow_signal = rdoverflow;
  assign rdclk_control_slave_status_underflow_signal = rdunderflow;
  assign rdclk_control_slave_empty_signal = rdempty;
  assign rdclk_control_slave_empty_pulse = rdclk_control_slave_empty_signal & rdclk_control_slave_empty_n_reg;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_empty_n_reg <= 0;
      else 
        rdclk_control_slave_empty_n_reg <= !rdclk_control_slave_empty_signal;
    end


  assign rdclk_control_slave_full_signal = rdfull;
  assign rdclk_control_slave_full_pulse = rdclk_control_slave_full_signal & rdclk_control_slave_full_n_reg;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_full_n_reg <= 0;
      else 
        rdclk_control_slave_full_n_reg <= !rdclk_control_slave_full_signal;
    end


  assign rdclk_control_slave_almostempty_signal = rdlevel <= rdclk_control_slave_almostempty_threshold_register;
  assign rdclk_control_slave_almostempty_pulse = rdclk_control_slave_almostempty_signal & rdclk_control_slave_almostempty_n_reg;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_almostempty_n_reg <= 0;
      else 
        rdclk_control_slave_almostempty_n_reg <= !rdclk_control_slave_almostempty_signal;
    end


  assign rdclk_control_slave_almostfull_signal = rdlevel >= rdclk_control_slave_almostfull_threshold_register;
  assign rdclk_control_slave_almostfull_pulse = rdclk_control_slave_almostfull_signal & rdclk_control_slave_almostfull_n_reg;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_almostfull_n_reg <= 0;
      else 
        rdclk_control_slave_almostfull_n_reg <= !rdclk_control_slave_almostfull_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_almostempty_threshold_register <= 1;
      else if ((rdclk_control_slave_address == 5) & rdclk_control_slave_write)
          rdclk_control_slave_almostempty_threshold_register <= rdclk_control_slave_threshold_writedata;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_almostfull_threshold_register <= 124;
      else if ((rdclk_control_slave_address == 4) & rdclk_control_slave_write)
          rdclk_control_slave_almostfull_threshold_register <= rdclk_control_slave_threshold_writedata;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_ienable_register <= 0;
      else if ((rdclk_control_slave_address == 3) & rdclk_control_slave_write)
          rdclk_control_slave_ienable_register <= rdclk_control_slave_writedata[5 : 0];
    end


  assign rdclk_control_slave_level_register = rdlevel;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_underflow_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[5])
          rdclk_control_slave_event_underflow_q <= 0;
      else if (rdclk_control_slave_event_underflow_signal)
          rdclk_control_slave_event_underflow_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_overflow_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[4])
          rdclk_control_slave_event_overflow_q <= 0;
      else if (rdclk_control_slave_event_overflow_signal)
          rdclk_control_slave_event_overflow_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_almostempty_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[3])
          rdclk_control_slave_event_almostempty_q <= 0;
      else if (rdclk_control_slave_event_almostempty_signal)
          rdclk_control_slave_event_almostempty_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_almostfull_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[2])
          rdclk_control_slave_event_almostfull_q <= 0;
      else if (rdclk_control_slave_event_almostfull_signal)
          rdclk_control_slave_event_almostfull_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_empty_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[1])
          rdclk_control_slave_event_empty_q <= 0;
      else if (rdclk_control_slave_event_empty_signal)
          rdclk_control_slave_event_empty_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_full_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[0])
          rdclk_control_slave_event_full_q <= 0;
      else if (rdclk_control_slave_event_full_signal)
          rdclk_control_slave_event_full_q <= -1;
    end


  assign rdclk_control_slave_event_register = {rdclk_control_slave_event_underflow_q,
    rdclk_control_slave_event_overflow_q,
    rdclk_control_slave_event_almostempty_q,
    rdclk_control_slave_event_almostfull_q,
    rdclk_control_slave_event_empty_q,
    rdclk_control_slave_event_full_q};

  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_underflow_q <= 0;
      else 
        rdclk_control_slave_status_underflow_q <= rdclk_control_slave_status_underflow_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_overflow_q <= 0;
      else 
        rdclk_control_slave_status_overflow_q <= rdclk_control_slave_status_overflow_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_almostempty_q <= 0;
      else 
        rdclk_control_slave_status_almostempty_q <= rdclk_control_slave_status_almostempty_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_almostfull_q <= 0;
      else 
        rdclk_control_slave_status_almostfull_q <= rdclk_control_slave_status_almostfull_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_empty_q <= 0;
      else 
        rdclk_control_slave_status_empty_q <= rdclk_control_slave_status_empty_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_full_q <= 0;
      else 
        rdclk_control_slave_status_full_q <= rdclk_control_slave_status_full_signal;
    end


  assign rdclk_control_slave_status_register = {rdclk_control_slave_status_underflow_q,
    rdclk_control_slave_status_overflow_q,
    rdclk_control_slave_status_almostempty_q,
    rdclk_control_slave_status_almostfull_q,
    rdclk_control_slave_status_empty_q,
    rdclk_control_slave_status_full_q};

  assign rdclk_control_slave_read_mux = ({32 {(rdclk_control_slave_address == 0)}} & rdclk_control_slave_level_register) |
    ({32 {(rdclk_control_slave_address == 1)}} & rdclk_control_slave_status_register) |
    ({32 {(rdclk_control_slave_address == 2)}} & rdclk_control_slave_event_register) |
    ({32 {(rdclk_control_slave_address == 3)}} & rdclk_control_slave_ienable_register) |
    ({32 {(rdclk_control_slave_address == 4)}} & rdclk_control_slave_almostfull_threshold_register) |
    ({32 {(rdclk_control_slave_address == 5)}} & rdclk_control_slave_almostempty_threshold_register) |
    ({32 {(~((rdclk_control_slave_address == 0))) && (~((rdclk_control_slave_address == 1))) && (~((rdclk_control_slave_address == 2))) && (~((rdclk_control_slave_address == 3))) && (~((rdclk_control_slave_address == 4))) && (~((rdclk_control_slave_address == 5)))}} & rdclk_control_slave_level_register);

  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_readdata <= 0;
      else if (rdclk_control_slave_read)
          rdclk_control_slave_readdata <= rdclk_control_slave_read_mux;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module niosII_system_fifo_0_map_avalonst_to_avalonmm (
                                                       // inputs:
                                                        avalonst_data,

                                                       // outputs:
                                                        avalonmm_data
                                                     )
;

  output  [ 31: 0] avalonmm_data;
  input   [ 31: 0] avalonst_data;

  wire    [ 31: 0] avalonmm_data;
  assign avalonmm_data[31 : 0] = avalonst_data[31 : 0];

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module niosII_system_fifo_0 (
                              // inputs:
                               avalonmm_read_slave_address,
                               avalonmm_read_slave_read,
                               avalonst_sink_data,
                               avalonst_sink_valid,
                               rdclk_control_slave_address,
                               rdclk_control_slave_read,
                               rdclk_control_slave_write,
                               rdclk_control_slave_writedata,
                               rdclock,
                               rdreset_n,
                               wrclk_control_slave_address,
                               wrclk_control_slave_read,
                               wrclk_control_slave_write,
                               wrclk_control_slave_writedata,
                               wrclock,
                               wrreset_n,

                              // outputs:
                               avalonmm_read_slave_readdata,
                               rdclk_control_slave_readdata,
                               wrclk_control_slave_readdata
                            )
;

  output  [ 31: 0] avalonmm_read_slave_readdata;
  output  [ 31: 0] rdclk_control_slave_readdata;
  output  [ 31: 0] wrclk_control_slave_readdata;
  input            avalonmm_read_slave_address;
  input            avalonmm_read_slave_read;
  input   [ 31: 0] avalonst_sink_data;
  input            avalonst_sink_valid;
  input   [  2: 0] rdclk_control_slave_address;
  input            rdclk_control_slave_read;
  input            rdclk_control_slave_write;
  input   [ 31: 0] rdclk_control_slave_writedata;
  input            rdclock;
  input            rdreset_n;
  input   [  2: 0] wrclk_control_slave_address;
  input            wrclk_control_slave_read;
  input            wrclk_control_slave_write;
  input   [ 31: 0] wrclk_control_slave_writedata;
  input            wrclock;
  input            wrreset_n;

  wire    [ 31: 0] avalonmm_map_data_out;
  wire    [ 31: 0] avalonmm_read_slave_readdata;
  wire    [ 31: 0] avalonst_map_data_in;
  wire    [ 31: 0] data;
  wire    [ 31: 0] q;
  wire             rdclk;
  wire    [ 31: 0] rdclk_control_slave_readdata;
  wire             rdempty;
  wire             rdreq;
  wire             rdreq_driver;
  wire             rdreset_to_be_optimized;
  wire             wrclk;
  wire    [ 31: 0] wrclk_control_slave_readdata;
  wire             wrfull;
  wire             wrreq;
  assign rdreset_to_be_optimized = rdreset_n;
  //the_dcfifo_with_controls, which is an e_instance
  niosII_system_fifo_0_dcfifo_with_controls the_dcfifo_with_controls
    (
      .data                          (data),
      .q                             (q),
      .rdclk                         (rdclk),
      .rdclk_control_slave_address   (rdclk_control_slave_address),
      .rdclk_control_slave_read      (rdclk_control_slave_read),
      .rdclk_control_slave_readdata  (rdclk_control_slave_readdata),
      .rdclk_control_slave_write     (rdclk_control_slave_write),
      .rdclk_control_slave_writedata (rdclk_control_slave_writedata),
      .rdempty                       (rdempty),
      .rdreq                         (rdreq),
      .rdreset_n                     (rdreset_n),
      .wrclk                         (wrclk),
      .wrclk_control_slave_address   (wrclk_control_slave_address),
      .wrclk_control_slave_read      (wrclk_control_slave_read),
      .wrclk_control_slave_readdata  (wrclk_control_slave_readdata),
      .wrclk_control_slave_write     (wrclk_control_slave_write),
      .wrclk_control_slave_writedata (wrclk_control_slave_writedata),
      .wrfull                        (wrfull),
      .wrreq                         (wrreq),
      .wrreset_n                     (wrreset_n)
    );

  //out, which is an e_avalon_slave
  //the_map_avalonst_to_avalonmm, which is an e_instance
  niosII_system_fifo_0_map_avalonst_to_avalonmm the_map_avalonst_to_avalonmm
    (
      .avalonmm_data (avalonmm_map_data_out),
      .avalonst_data (avalonst_map_data_in)
    );

  assign wrclk = wrclock;
  assign rdclk = rdclock;
  assign rdreq_driver = (avalonmm_read_slave_address == 0) & avalonmm_read_slave_read;
  assign avalonst_map_data_in = q;
  assign rdreq = rdreq_driver;
  assign data = avalonst_sink_data;
  assign wrreq = avalonst_sink_valid;
  assign avalonmm_read_slave_readdata = avalonmm_map_data_out;
  //in, which is an e_atlantic_slave
  //in_csr, which is an e_avalon_slave
  //out_csr, which is an e_avalon_slave

endmodule

