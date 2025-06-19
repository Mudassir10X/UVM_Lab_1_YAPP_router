#!/bin/csh

source ~/cshrc

xrun -access +rwc -uvm -f ../tb/file.f +UVM_TESTNAME=test2 +UVM_VERBOSITY=UVM_LOW