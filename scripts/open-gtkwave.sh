#!/bin/bash
## Запуск симуляции для генерации VCD-файла
OSS_CAD_PATH="$HOME/oss-cad-suite/bin"

# Проверяем, передан ли параметр с именем VCD файла
if [[ $1 != "" ]]; then
  VCD_FILE=$1
elif [[ $VCD_FILE != "" ]]; then
  # Используем переменную, если она задана
  echo "Используем VCD файл: $VCD_FILE"
else
  # По умолчанию используем test.vcd
  VCD_FILE="test.vcd"
  echo "Используем файл по умолчанию: $VCD_FILE"
fi

# Проверяем существование файла
if [[ ! -f "$VCD_FILE" ]]; then
  echo "Ошибка: Файл $VCD_FILE не найден!"
  exit 1
fi

# Открываем файл в GTKWave
"$OSS_CAD_PATH/gtkwave" "$VCD_FILE"