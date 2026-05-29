class apb_env extends uvm_env;
  `uvm_component_utils(apb_env)
  apb_agent agt;
  // my_scoreboard sco;
  function new(string name="apb_env",uvm_component parent);
    super.new(name,parent);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt=apb_agent::type_id::create("agt",this);
    ///sco=my_scoreboard::type_id::create("sco",this);
  endfunction
   /*function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.mon_ap.connect(sco.sb_imp);
  endfunction*/
endclass
