setup-workspace:
	./scripts/setup-workspace.sh

#test - название модуля test.v - название исходника, test1_tb.v - название тестового контейнера
#example: COMMAND="test verilog/components/test/test.v verilog/components/test/test/test_tb.v" make compile-verilog
compile-verilog:
	./scripts/compile-verilog.sh
open-gtkwave:
	./scripts/open-gtkwave.sh