class apb_item extends uvm_sequence_item;
  `uvm_object_utils(apb_item);
  rand bit [7:0]paddr;
  rand bit [7:0]pwdata;
  rand bit pwrite;
  bit [7:0] prdata;
  bit pready;
  function new(string name = "apb_item");
    super.new(name);
  endfunction
endclass
  