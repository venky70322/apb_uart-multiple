// Code your testbench here
// or browse Examples
//`include "package.sv"
import uvm_pkg::*;
import pack::*;
//`include "apb_if.sv"
//`include "uart_if.sv"
////////////////////////////////////////////////////
module tb;
   logic clk;
    initial clk=0;
    always #5 clk=~clk;
  apb_if apb_vif(clk);
  uart_if uart_vif(clk);
  dut uut(.clk(clk),.rst(apb_vif.rst),.paddr(apb_vif.paddr),.pwdata(apb_vif.pwdata),.pwrite(apb_vif.pwrite),.prdata(apb_vif.prdata),.pready(apb_vif.pready),.tx(uart_vif.tx),.rx(uart_vif.rx),.tx_valid(uart_vif.tx_valid),.rx_valid(uart_vif.rx_valid));
  
  initial begin
    apb_vif.rst=1;
    uart_vif.rst=1;
    #45;
    apb_vif.rst=0;
    uart_vif.rst=0;
  end
  initial begin
    uvm_config_db#(virtual apb_if)::set(null,"*","apb_vif",apb_vif);
    uvm_config_db#(virtual uart_if)::set(null,"*","uart_vif",uart_vif);
    run_test("top_test");
  end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb);
  end
endmodule
