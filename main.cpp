extern "C" void putchar(char c);

extern "C" void main() {
    const char* msg = "Hello from QEMU!\n";
    while (*msg) {
        putchar(*msg++);
    }
    while (1); // Infinite loop
}