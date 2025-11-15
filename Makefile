-include .env

SRC_DIR = src/components
VVP_EXT = vvp
VCD_EXT = vcd

# Все исходные модули Verilog (исключаем *_tb.v)
VERILOG_SRC := $(shell find $(SRC_DIR) -name "*.v" ! -name "*_tb.v")

# Найти все тестбенчи
TBS := $(shell find $(SRC_DIR) -name "*_tb.v")

.PHONY: all show clean

all: show

show: $(TBS) clean
	@for tb in $(TBS); do \
		dir=$$(dirname $$tb); \
		base=$$(basename $$tb _tb.v); \
		vvp_file=$$dir/$$base.vvp; \
		vcd_file=$$dir/$$base.vcd; \
		iverilog -g2012 -o $$vvp_file $(VERILOG_SRC) $$tb; \
		vvp $$vvp_file; \
		gtkwave $$vcd_file & \
	done

clean:
	@find $(SRC_DIR) -name "*.vvp" -delete
	@find $(SRC_DIR) -name "*.vcd" -delete
	@pkill gtkwave || true