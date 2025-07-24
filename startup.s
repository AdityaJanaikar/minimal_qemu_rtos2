    .section .isr_vector, "a", %progbits
    .word _estack                 /* initial stack pointer */
    .word Reset_Handler          /* reset vector */

    .text
    .global Reset_Handler
Reset_Handler:
    /* Copy .data section */
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, =_edata
copy_data:
    cmp r1, r2
    ittt lt
    ldrlt r3, [r0], #4
    strlt r3, [r1], #4
    blt copy_data

    /* Zero .bss section */
    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0
zero_bss:
    cmp r0, r1
    itt lt
    strlt r2, [r0], #4
    addlt r0, r0, #4
    blt zero_bss

    /* Call main */
    bl main
    b .
