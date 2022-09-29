.SHELLFLAGS += -e
.ONESHELL:
.PHONY: all build release debug run run_release clean

all: debug

export_compile_commands:
	mkdir -p build
	cd build
	cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug ../
	cp compile_commands.json ../compile_commands.json

debug: | build
	mkdir -p build
	cd build
	cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug ../
	cp compile_commands.json ../compile_commands.json
	make -j8

release: | build
	mkdir -p build
	cd build
	cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Release ../
	cp compile_commands.json ../compile_commands.json
	make -j8

run: debug
	./build/hello

run_release: release
	./build/hello

clean:
	mkdir -p build
	cd build
	make clean
