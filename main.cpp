extern "C" void putchar(char c) {
    volatile unsigned int* UART0DR = (unsigned int*)0x4000C000;
    *UART0DR = (unsigned int)c;
}

extern "C" int main() {
    const char* msg = "Hello from QEMU!\n";
    while (*msg) {
        putchar(*msg++);
    }
    while (1);
}
