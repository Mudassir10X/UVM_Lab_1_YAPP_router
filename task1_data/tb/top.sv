module top;
    // import the UVM library
    // include the UVM macros
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // import the YAPP package
    import yapp_pkg::*;

    yapp_packet pkt1;
    yapp_packet pkt2;

    // generate 5 random packets and use the print method
    // to display the results
    initial begin
        // Create a packet object
        pkt1 = yapp_packet::type_id::create("pkt1");

        // Randomize the packet 5 times
        for (int i = 0; i < 5; i++) begin
            if (pkt1.randomize()) begin
                // Print the packet details
                pkt1.print();
            end else begin
                `uvm_error("PACKET", "Randomization failed")
            end
        end
        // experiment with the copy, clone and compare UVM method
        if (!$cast(pkt2, pkt1.clone())) begin
            `uvm_error("PACKET", "Clone failed")
        end
        pkt2.set_name("pkt2");
        if (pkt1.compare(pkt2)) begin
            `uvm_info("PACKET", "Packets are equal", UVM_LOW)
        end else begin
            `uvm_error("PACKET", "Packets are not equal")
        end
        // Display the contents of pkt1
        pkt1.print(uvm_default_tree_printer );
        // Display the contents of pkt2
        pkt2.print(uvm_default_tree_printer );
        // Display the parity of pkt1
        `uvm_info("PACKET", $sformatf("Parity of pkt1: %0d", pkt1.parity), UVM_LOW);
        // Display the parity of pkt2
        `uvm_info("PACKET", $sformatf("Parity of pkt2: %0d", pkt2.parity), UVM_LOW);

    end
endmodule : top
