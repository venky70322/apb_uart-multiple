
///////////////////////////////////////////
// SIMPLE DUT
///////////////////////////////////////////

module dut(

   // APB signals
   input  logic        clk,
   input  logic        rst,

   input  logic [7:0]  paddr,
   input  logic [7:0]  pwdata,
   input  logic        pwrite,

   output logic [7:0]  prdata,
  output logic        pready,

   // UART signals
   input  logic        tx,
   output logic        rx,

   input  logic        tx_valid,
   output logic        rx_valid
);

   ///////////////////////////////////////
   // APB logic
   ///////////////////////////////////////

   always_ff @(posedge clk) begin
     
      if(rst) begin
         prdata <= 0;
         pready <= 0;
      end

      else begin

         pready <= 1;

        if(pwrite)
            prdata <= pwdata;
      end
   end
   always @(posedge clk)begin
          #1;
          $display("DUT: pwrite=%0b pwdata=%0h prdata=%0h",pwrite,pwdata,prdata);
      end


   ///////////////////////////////////////
   // UART logic
   ///////////////////////////////////////

  always_ff @(posedge clk) begin

      if(rst) begin
         rx       <= 0;
         rx_valid <= 0;
      end

      else begin

         rx       <= tx;
         rx_valid <= tx_valid;

      end
   end 

endmodule



