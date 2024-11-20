`ifndef _DUT_IF
`define _DUT_IF

interface dut_if();
  logic reset_n;	//chip reset

   //internal variables to manage inout signals
  logic enable;
  logic V_in;
  logic V_ref;
  logic data_ready;
  logic [7:0] adc_q;

endinterface

`endif // _DUT_IF
