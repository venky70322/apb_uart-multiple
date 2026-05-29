interface uart_if(input bit clk);
  logic rst;
  logic tx;
  logic rx;
  logic tx_valid;
  logic rx_valid;
endinterface