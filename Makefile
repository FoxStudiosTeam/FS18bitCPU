setup-workspace:
	./scripts/setup-workspace.sh

#test - название модуля test.v - название исходника, test1_tb.v - название тестового контейнера
#example: COMMAND="test verilog/components/test/test.v verilog/components/test/test/test_tb.v" make compile-verilog
compile-verilog:
	./scripts/compile-verilog.sh

#test.vcd - результат выполнения test файла полученного после compile-verilog таска
#example: COMMAND="test.vcd" make open-gtkwave
open-gtkwave:
	./scripts/open-gtkwave.sh

# Компилятор Verilog
IVERILOG = iverilog
VVP = vvp
GTKWAVE = $(HOME)/oss-cad-suite/bin/gtkwave

# Исходные файлы
SRC_FILES = verilog/components/alu_8bit/alu_8bit.v verilog/components/control_unit/control_unit.v verilog/components/memory/memory.v verilog/components/register_l1/register_l1_file.v verilog/components/program_counter/program_counter.v verilog/run/processor_8bit.v verilog/run/processor_tb.v

# Результирующие файлы
OUTPUT = processor_test
VCD_FILE = processor.vcd

all: $(OUTPUT)

$(OUTPUT): $(SRC_FILES)
	$(IVERILOG) -o $(OUTPUT) $(SRC_FILES)

run: $(OUTPUT)
	$(VVP) $(OUTPUT)

wave: run
	$(GTKWAVE) $(VCD_FILE)

clean:
	rm -f $(OUTPUT) $(VCD_FILE)

.PHONY: all run wave clean
