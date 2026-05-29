class uart_item extends uvm_sequence_item;
  `uvm_object_utils(uart_item);
  rand bit tx;
  rand bit tx_valid;
  bit rx;
  bit rx_valid;
  function new(string name = "uart_item");
    super.new(name);
  endfunction
endclass
  