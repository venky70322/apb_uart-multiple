interface apb_if(input bit clk);
  logic rst;
  logic [7:0] paddr;
  logic [7:0] pwdata;
  logic [7:0] prdata;
  logic pready;
  logic pwrite;
endinterface
