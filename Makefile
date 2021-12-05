
NAME := fulladder
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
	yosys -q -p "prep -top fulladder; write_json $(JSON)" $(SRC) || exit 1
	netlistsvg $(JSON) -o $(SVG)

sim:
	gtkwave $(VCD)

setup:
	sudo apt -y install iverilog gtkwave yosys yosys-doc
	curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
	sudo apt -y install nodejs
	sudo npm install -g netlistsvg

clean:
	rm -rf *.o *.vcd *.json *.svg