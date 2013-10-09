
all: a.img

start:
	bochs -q -f bochsrc

a.img: boot.bin
	rm -f a.img
	bximage -fd -size=1.44 -q a.img
	mkfs.msdos -F 12 a.img
	dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc

boot.bin: boot/*.asm boot/include/fat12hdr.inc
	nasm -I boot/ -I boot/include/ boot/boot.asm -o boot.bin

