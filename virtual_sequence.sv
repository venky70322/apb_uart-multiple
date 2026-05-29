class apb_uart_vseq extends uvm_sequence;

  `uvm_object_utils(apb_uart_vseq)

 `uvm_declare_p_sequencer(virtual_sequencer)

  apb_sequence  apb_seq;
  uart_sequence uart_seq;

  function new(string name = "apb_uart_vseq");
    super.new(name);
  endfunction

  task body();
  //  virtual_sequencer v_seqr;
    //$cast(v_seqr,m_sequencer);
    apb_seq  = apb_sequence::type_id::create("apb_seq");
    uart_seq = uart_sequence::type_id::create("uart_seq");
fork
    // STEP 1: APB first
  apb_seq.start(p_sequencer.apb_seqr);

    // STEP 2: UART after APB
  uart_seq.start(p_sequencer.uart_seqr);
join
  endtask

endclass