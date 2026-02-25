CC = gcc
SRC = $(wildcard src/*.c)
BIN = $(patsubst src/%.c, bin/%, $(SRC))

all: $(BIN)
	@echo "======= Compilation successful ======="

bin/%: src/%.c
	@mkdir -p bin
	@echo "Compiling $<"
	$(CC) $< -o $@

run: all
	@for prog in $(BIN); do \
		echo "Running $$prog..."; \
		./$$prog; \
		echo ""; \
	done

clean:
	rm -rf bin/*
