class apb_sequence extends uvm_sequence#(apb_item);
  `uvm_object_utils(apb_sequence)
  apb_item txn;
  function new(string name = "apb_sequence");
    super.new(name);
  endfunction
  task body();  
    repeat(5)begin
      txn=apb_item::type_id::create("txn");
      $display("(io");
      start_item(txn);
      void'(txn.randomize());
      finish_item(txn);
      $display("lop");
    end
  endtask
endclass
