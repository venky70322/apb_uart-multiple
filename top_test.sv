class top_test extends uvm_test;

  `uvm_component_utils(top_test)

  top_env env;

  apb_sequence  apb_seq;

  uart_sequence uart_seq;
  apb_uart_vseq vseq;


  function new(string name="top_test",
               uvm_component parent);

    super.new(name,parent);

  endfunction


  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    env = top_env::type_id::create("env",this);

  endfunction
  function void end_of_elaboration_phase(uvm_phase phase);

   super.end_of_elaboration_phase(phase);

   uvm_top.print_topology();

endfunction


  task run_phase(uvm_phase phase);

    phase.raise_objection(this);

    //apb_seq  = apb_sequence::type_id::create("apb_seq");

   // uart_seq = uart_sequence::type_id::create("uart_seq");
     vseq = apb_uart_vseq::type_id::create("vseq");

    fork

      //apb_seq.start(env.apb_e[0].agt.seqr);

      //uart_seq.start(env.uart_e[0].agt.seqr);
      vseq.start(env.vseqr);

    join

    phase.drop_objection(this);

  endtask

endclass