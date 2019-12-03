.data
nteam:  .asciz "Team: %d\n"

name1:  .asciz "Paul Liu\n"

name2:  .asciz "Jason\n"

name3:  .asciz "Kevin\n"

        .text
        .globl main
main:
        stmfd   sp!,{lr}
        mov     r3, #18
        mov     r4, #1
        sbcs    r0, r3, r4
        mov     r1, r0
        ldr     r0, =nteam
        bl      printf
        ldr     r0, =name1
        bl      printf
        ldr     r0, =name2
        bl      printf
        ldr     r0, =name3
        bl      printf
        mov     r0, #0
        ldmfd   sp!,{lr}
        mov     pc, lr
