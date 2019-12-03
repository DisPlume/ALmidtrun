.data
id1:  .asciz "Please Enter Student 1 ID:\n"
id2:  .asciz "Please Enter Student 2 ID:\n"
id3:  .asciz "Please Enter Student 3 ID:\n"
rid:  .asciz "%d"
ID:   .int   0
rid1: .asciz "%d"
ID1:  .int   0
rid2: .asciz "%d"
ID2:  .int   0
cmd:  .asciz "%s"
cmd1: .word  '0'
cmd2: .word  'P'
sum:  .asciz "\nID Summation = %d\n"
pid:  .asciz "Print Team ID and ID Summation:\n%d\n%d\n%d\n"
cmdp: .asciz "Please Enter Command:\n"
totalnum: .word 0

        .text

        .globl main
main:
        stmfd   sp!,{lr}

        @ start to read
        ldr     r0, =id1
        bl      printf
        ldr     r0, =rid
        ldr     r1, =ID
        bl      scanf
        ldr     r0, =id2
        bl      printf
        ldr     r0, =rid1
        ldr     r1, =ID1
        bl      scanf
        ldr     r0, =id3
        bl      printf
        ldr     r0, =rid2
        ldr     r1, =ID2
        bl      scanf

        @ finished reading all id
        @ read command

        ldr     r0, =cmdp
        bl      printf
        ldr     r0, =cmd
        ldr     r1, =cmd1
        bl      scanf
        ldr     r0, =cmd1
        ldr     r0, [r0]
        ldr     r1, =cmd2
        ldr     r1, [r1]
        cmp     r0, r1

        @ start to print

        ldr     r0, =pid
        ldr     r1, =ID
        ldr     r1, [r1]
        ldr     r2, =ID1
        ldr     r2, [r2]
        ldr     r3, =ID2
        ldr     r3, [r3]
        bl      printf

        @ add up ids
        mov     r0, #0
        ldr     r1, =ID
        ldr     r1, [r1]
        ldr     r2, =ID1
        ldr     r2, [r2]
        ldr     r3, =ID2
        ldr     r3, [r3]
        add     r0, r1, r2
        add     r0, r0, r3
        ldr     r1, =totalnum
        str     r0, [r1]
        ldr     r0, =sum
        ldr     r1, =totalnum
        ldr     r1, [r1]
        cmp     r2, r3
        blne    printf



        ldmfd   sp!,{lr}
        mov     pc, lr
