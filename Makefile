TARGET = fib
SOURCES = fib.cpp

all: $(TARGET)

$(TARGET): $(SOURCES)
	g++ -o $(TARGET) $(SOURCES)

clean:
	rm -f $(TARGET)

install:
	mkdir -p $(DESTDIR)/usr/bin
	install -m 755 $(TARGET) $(DESTDIR)/usr/bin/

.PHONY: all clean install
