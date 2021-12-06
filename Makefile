TOPTARGETS := all clean

SUBDIRS := $(wildcard */.)

$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
		$(MAKE) -C $@ $(MAKECMDGOALS)

setup:
	sudo apt -y install iverilog gtkwave yosys yosys-doc
	curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
	sudo apt -y install nodejs
	sudo npm install -g netlistsvg

.PHONY: $(TOPTARGETS) $(SUBDIRS)