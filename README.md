# Minimal QEMU Firmware Project (C++ for ARM Cortex-M3)

This project builds a tiny "Hello from QEMU" firmware that runs on a simulated Cortex-M3 using QEMU.

## 🧰 Requirements

- QEMU (with ARM support)
- arm-none-eabi toolchain (GCC)
- Git Bash / WSL / Linux (for Make)

## 🚀 Build and Run

```bash
make
make run
```

You should see: `Hello from QEMU!`