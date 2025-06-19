module top;
    // import the UVM library
    // include the UVM macros
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // import the YAPP package
    import yapp_pkg::*;
    `include "router_tb.sv"
    `include "router_test_lib.sv"

    yapp_packet pkt1;
    yapp_packet pkt2;
initial begin
    run_test("base_test");
end

endmodule : top
