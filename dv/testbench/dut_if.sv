`ifndef _DUT_IF
`define _DUT_IF

interface dut_if();
  logic rst_n;	//chip reset
  logic clk;
   //internal variables to manage inout signals
  logic enable;
  real v_in;
  real v_ref;
  logic data_ready;
  logic [7:0] adc_q;

endinterface

`endif // _DUT_IF
