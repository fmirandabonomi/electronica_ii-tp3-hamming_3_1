ifeq ($(suffix $(SHELL)),.exe)
	rm = del
else
	rm = rm
endif

entidad = hamming_3_1_tb
params = --std=08 
cf = work-obj08.cf 
all : $(cf)
	ghdl -m $(params) $(entidad)
	ghdl -r $(params) $(entidad)
 $(cf) : *.vhd
	ghdl -i $(params) *.vhd
clean : 
	ghdl clean
	$(rm) $(cf) *.o $(entidad).exe
