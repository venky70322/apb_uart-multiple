class virtual_sequencer extends uvm_sequencer;
  `uvm_component_utils(virtual_sequencer)
  apb_sequencer apb_seqr;
  uart_sequencer uart_seqr;
  function new(string name="virtual sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction
endclass