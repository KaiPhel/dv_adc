import uvm_pkg::*;
`include "uvm_macros.svh"

`include "dut_if.sv"
`include "lib_test.sv"
`include "adc_dms_model.sv"

module top;

  bit clk;
  
  //---------------------------------------
  //clock generation
  //---------------------------------------
  always #5 clk = ~clk;
  

  dut_if dut_if();
  //instantiate adc

//---------------------------------------
//DUT instance
//---------------------------------------
  memory DUT (
      .clk(intf.clk),
      .reset(intf.rst_n),
      .enable(intf.enable),
      .V_in(intf.V_in),
      .V_ref(intf.V_ref),
      .data_ready(intf.data_ready),
      .adc_q(intf.adc_q)
    );

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $shm_open("waves.shm");
    $shm_probe("ASM");
    //reset?
  end
  
  //clock?
  
  initial begin
    //interface to database
    run_test(); //+UVM_TESTNAME=test_i2c_write
  end
    
endmodule : top
