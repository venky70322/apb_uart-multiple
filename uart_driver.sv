class uart_driver extends uvm_driver#(uart_item);
  `uvm_component_utils(uart_driver)
  virtual uart_if uart_vif;
  uart_item txn;
  function new(string name="uart_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual uart_if)::get(this,"","uart_vif",uart_vif))
      `uvm_fatal("DRV","VIF IS NOT CONNECTED")
      endfunction
      task run_phase(uvm_phase phase);
    txn=uart_item::type_id::create("txn");
   uart_vif.tx<=0;
    uart_vif.tx_valid<=0;
    forever begin
      seq_item_port.get_next_item(txn);
      @(posedge uart_vif.clk);
      uart_vif.tx=txn.tx;
      uart_vif.tx_valid=txn.tx_valid;
     seq_item_port.item_done();
    end
    endtask
    endclass
    
      
    