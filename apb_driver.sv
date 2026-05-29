class apb_driver extends uvm_driver#(apb_item);
  `uvm_component_utils(apb_driver)
  virtual apb_if apb_vif;
  apb_item txn;
  function new(string name="apb_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual apb_if)::get(this,"","apb_vif",apb_vif))
      `uvm_fatal("DRV","VIF IS NOT CONNECTED")
      endfunction
      task run_phase(uvm_phase phase);
   
    apb_vif.paddr<=0;
    apb_vif.pwdata<=0;
    apb_vif.pwrite<=0;
    $display("before");
    wait(apb_vif.rst==0);
    $display("after");
     txn=apb_item::type_id::create("txn");
    forever begin
      seq_item_port.get_next_item(txn);
      $display("got");
      @(negedge apb_vif.clk);
      apb_vif.pwrite<=1;
      apb_vif.paddr<=txn.paddr;
      apb_vif.pwdata<=txn.pwdata;
      
      @(negedge apb_vif.clk);
      apb_vif.pwrite<=0;
      $display("ui");
      seq_item_port.item_done();
      $display("item");
    end
    endtask
    endclass
      