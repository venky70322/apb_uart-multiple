class uart_monitor extends uvm_monitor;
  `uvm_component_utils(uart_monitor)
  uvm_analysis_port#(uart_item)mon_ap;
  virtual uart_if uart_vif;
  uart_item txn;
  function new(string name="uart_monitor",uvm_component parent);
    super.new(name,parent);
    mon_ap=new("mon_ap",this);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual uart_if)::get(this,"","uart_vif",uart_vif))
      `uvm_fatal("MON","VIF IS NOT CONNECTED")
      endfunction
      task run_phase(uvm_phase phase);
    forever begin
      txn=uart_item::type_id::create("txn");
      @(posedge uart_vif.clk);
      txn.tx=uart_vif.tx;
      txn.rx=uart_vif.rx;
      txn.tx_valid=uart_vif.tx_valid;
      txn.rx_valid=uart_vif.rx_valid;
      mon_ap.write(txn);
      
    end
    endtask
    endclass