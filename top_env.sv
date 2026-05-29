class top_env extends uvm_env;

  `uvm_component_utils(top_env)

  apb_env  apb_e[];
  uart_env uart_e[];
  int no_of_apb_env=3;
  int no_of_uart_env=2;
  virtual_sequencer vseqr;
  function new(string name="top_env",
               uvm_component parent);

    super.new(name,parent);

  endfunction


  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    apb_e  =new[no_of_apb_env];
    foreach(apb_e[i])begin
      apb_e[i]=apb_env::type_id::create($sformatf("apb_e[%0d]",i),this);
    end
    uart_e=new[no_of_uart_env];
    foreach(uart_e[i])begin
      uart_e[i]=uart_env::type_id::create($sformatf("uart_e[%0d]",i),this);
    end
    vseqr=virtual_sequencer::type_id::create("vseqr",this);

  endfunction
   function void connect_phase(uvm_phase phase);

    // connect APB sequencer
     vseqr.apb_seqr = apb_e[0].agt.seqr;

    // connect UART sequencer
     vseqr.uart_seqr = uart_e[0].agt.seqr;

  endfunction

endclass