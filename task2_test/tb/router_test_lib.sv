`include "uvm_macros.svh"
import uvm_pkg::*;

class base_test extends uvm_test;
    `uvm_component_utils(base_test)

    router_tb tb;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tb = router_tb::type_id::create("tb", this);
        `uvm_info("BUILD_PHASE", "Executing build_phase of base_test", UVM_HIGH)
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
    endfunction

endclass

class test2 extends base_test;
    `uvm_component_utils(test2)
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "Executing run_phase of test2", UVM_HIGH)
        `uvm_info("RUN_PHASE", "Packets sent in test2", UVM_HIGH)
    endtask
endclass