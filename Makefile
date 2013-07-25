
all: a.img

start:
	bochs -q -f bochsrc

a.img: boot.bin
	rm -f a.img
	bximage -fd -size=1.44 -q a.img
	dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc

boot.bin: boot/boot.asm
	nasm boot/boot.asm -o boot.bin

