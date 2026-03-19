all: unit-test1

unit-test1: sourceTest1.cpp
	g++ -o unit-test1 sourceTest1.cpp

test: unit-test1
	./unit-test1

clean:
	rm -f unit-test1

.PHONY: all test clean
