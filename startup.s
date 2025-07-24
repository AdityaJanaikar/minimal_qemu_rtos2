.section .isr_vector, "a", %progbits
    .word   _estack         /* Initial Stack Pointer */
    .word   Reset_Handler   /* Reset Handler */

    .text
    .global Reset_Handler
Reset_Handler:
    bl main
    b .