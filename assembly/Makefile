.DEFAULT_GOAL := compile

compile:
	nasm -f macho64 hello_world.asm
	ld -macosx_version_min 10.15.0 -lSystem -o hello_world hello_world.o	
