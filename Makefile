TARGET = hello
CC = arm-none-eabi-g++
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy

+CFLAGS = -mcpu=cortex-m3 -mthumb -nostdlib -Os -ffreestanding -fno-exceptions -fno-rtti
LDFLAGS = -T linker.ld

all: $(TARGET).elf

$(TARGET).elf: startup.s main.cpp linker.ld
	$(CC) $(CFLAGS) -c main.cpp -o main.o
	arm-none-eabi-as -mcpu=cortex-m3 -mthumb startup.s -o startup.o
	$(LD) $(LDFLAGS) main.o startup.o -o $(TARGET).elf

run: $(TARGET).elf
	qemu-system-arm -M lm3s6965evb -nographic -kernel $(TARGET).elf

clean:
	rm -f *.o *.elf