class uart_env extends uvm_env;
  `uvm_component_utils(uart_env)
  uart_agent agt;
  // my_scoreboard sco;
  function new(string name="uart_env",uvm_component parent);
    super.new(name,parent);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt=uart_agent::type_id::create("agt",this);
    ///sco=my_scoreboard::type_id::create("sco",this);
  endfunction
   /*function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.mon_ap.connect(sco.sb_imp);
  endfunction*/
endclass