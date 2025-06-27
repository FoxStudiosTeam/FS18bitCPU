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

# Разбиваем команду на компоненты
read -r OUTPUT_FILE SOURCE_FILES <<< "$rawCommand"

# Компиляция в файл выходной файл
"$OSS_CAD_PATH/iverilog" -o "$OUTPUT_FILE" $SOURCE_FILES

# Запускаем симуляцию для генерации VCD файла
"$OSS_CAD_PATH/vvp" "$OUTPUT_FILE"

echo "Симуляция завершена. VCD файл сгенерирован."