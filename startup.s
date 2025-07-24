    .syntax unified
    .cpu cortex-m3
    .thumb

    .section .isr_vector, "a", %progbits
    .word _estack
    .word Reset_Handler

    .text
    .thumb_func
    .global Reset_Handler
Reset_Handler:
    /* Copy .data section from flash to RAM */
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, =_edata
copy_data:
    cmp r1, r2
    bcs init_bss              /* If start >= end, skip copying */
    ldr r3, [r0], #4
    str r3, [r1], #4
    b copy_data

init_bss:
    /* Zero .bss section */
    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0
zero_bss:
    cmp r0, r1
    bcs call_main             /* If start >= end, skip zeroing */
    str r2, [r0], #4
    adds r0, r0, #4
    b zero_bss

call_main:
    bl main
    b .
