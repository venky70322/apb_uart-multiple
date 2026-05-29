class uart_sequence extends uvm_sequence#(uart_item);
  `uvm_object_utils(uart_sequence)
  uart_item txn;
  function new(string name = "uart_sequence");
    super.new(name);
  endfunction
  task body();  
    repeat(5)begin
      txn=uart_item::type_id::create("txn");
      $display("(io");
      start_item(txn);
      void'(txn.randomize());
      finish_item(txn);
      $display("lop");
    end
  endtask
endclass
