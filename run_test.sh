#!/bin/bash
set -e

echo "Starting tests..."

# Компилируем программу
make clean
make

# Запускаем unit-тест
cd tests
make clean
make
make test
cd ..

# Запускаем функциональный тест
./tests/test_func.sh

echo "All tests completed successfully."
