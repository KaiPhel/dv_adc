import uvm_pkg::*;
`include "uvm_macros.svh"

`include "dut_if.sv"
`include "lib_test.sv"
`include "adc_dms_model.sv"

module top;

  //bit clk;
  
  //---------------------------------------
  //clock generation
  //---------------------------------------
  //always #5 clk = ~clk;
  

  dut_if intf();
  //instantiate adc

//---------------------------------------
//DUT instance
//---------------------------------------
  adc_dms_model DUT (
      .clk(intf.clk),
      .rst_n(intf.rst_n),
      .enable(intf.enable),
      .v_in(intf.v_in),
      .v_ref(intf.v_ref),
      .data_ready(intf.data_ready),
      .adc_q(intf.adc_q)
    );

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $shm_open("waves.shm");
    $shm_probe("ASM");
    //interface to database
    run_test(); //+UVM_TESTNAME=test_i2c_write
    //reset?
  end
  
  /*nitial begin
    //interface to database
    run_test(); //+UVM_TESTNAME=test_i2c_write
  end*/
    
endmodule : top
