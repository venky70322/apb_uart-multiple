class apb_monitor extends uvm_monitor;
  `uvm_component_utils(apb_monitor)
  uvm_analysis_port#(apb_item)mon_ap;
  virtual apb_if apb_vif;
  apb_item txn;
  function new(string name="apb_monitor",uvm_component parent);
    super.new(name,parent);
    mon_ap=new("mon_ap",this);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual apb_if)::get(this,"","apb_vif",apb_vif))
      `uvm_fatal("MON","VIF IS NOT CONNECTED")
      endfunction
      task run_phase(uvm_phase phase);
    forever begin
      txn=apb_item::type_id::create("txn");
      @(posedge apb_vif.clk);
      #1;
      txn.paddr=apb_vif.paddr;
      txn.pwdata=apb_vif.pwdata;
      txn.pwrite=apb_vif.pwrite;
      txn.prdata=apb_vif.prdata;
      txn.pready=apb_vif.pready;
      mon_ap.write(txn);
    end
    endtask
    endclass
  