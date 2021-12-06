
NAME := counter
SRC := $(NAME).v
TB := $(NAME)_tb.v
VCD := $(NAME)_tb.vcd
OUT := $(NAME).o
JSON := $(NAME).json
SVG := $(NAME).svg

target:
	iverilog -o $(OUT) $(SRC) $(TB) || exit 1
	vvp $(OUT)

netlist:
	yosys -q -p "prep -top counter; write_json $(JSON)" $(SRC) || exit 1
	netlistsvg $(JSON) -o $(SVG)

sim:
	gtkwave $(VCD)

clean:
	rm -rf *.o *.vcd *.json *.svg