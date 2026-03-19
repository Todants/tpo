# Проверка наличия компилятора g++
ifeq ($(shell which g++),)
$(error "g++ not found. Please install g++ (build-essential)")
endif

TARGET = fib
SOURCES = fib.cpp

all: $(TARGET)

$(TARGET): $(SOURCES)
	g++ -o $(TARGET) $(SOURCES)

clean:
	rm -f $(TARGET)

.PHONY: all clean
