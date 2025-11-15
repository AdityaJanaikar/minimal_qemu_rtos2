extern "C" int main() {
    volatile unsigned int* UART0DR = (unsigned int*)0x4000C000;
    const char* message = "Hello from QEMU!\n";
    while (*message) {
        *UART0DR = (unsigned int)(*message);
        message++;
    }
    //while (1);
}