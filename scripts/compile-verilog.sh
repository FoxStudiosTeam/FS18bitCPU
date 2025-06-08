# Путь к Icarus Verilog и GTKWave из OSS CAD Suite
OSS_CAD_PATH="$HOME/oss-cad-suite/bin"

rawCommand=""

if [[ $COMMAND != "" ]]; then
  rawCommand=$COMMAND
elif [[ $C != "" ]]; then
  rawCommand=$C
else
  echo "u doesnt wrote anything in COMMAND or C variable"
  exit 1
fi

echo "предварительная команда $rawCommand"

# Компиляция
"$OSS_CAD_PATH/iverilog" -o $rawCommand

## Открытие результата в GTKWave
#"$OSS_CAD_PATH/gtkwave" test.vcd