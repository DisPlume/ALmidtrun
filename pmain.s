.data

@ mission 1
nteam:  .asciz "Team: %d\n"
num11:  .int   0
name1:  .asciz "Paul Liu\n"
name2:  .asciz "Jason\n"
name3:  .asciz "Kevin\n"

@ mission 2
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
sum:  .asciz "\nID Summation = %d\n\n"
pid:  .asciz "Print Team ID and ID Summation:\n%d\n%d\n%d\n"
cmdp: .asciz "Please Enter Command:\n"
totalnum: .word 0


@ Main
aprint: .asciz "\nMain Function:\n*****Print All*****\n"

print1: .asciz "%d "
print2: .asciz "%d "
print3: .asciz "%d "
fun1:   .asciz "Function 1: Name\n*****Print Name*****\n"
fun2:   .asciz "Function 2: ID\n*****Input ID*****\n"
end1:   .asciz "*****End Print*****\n"
        .text
        .globl main

@ print names
mission1:
        push    {ip, lr}
        mov     r0, #17
        ldr     r1, =num11
        str     r0, [r1]
        ldr     r1, =num11
        ldr     r1, [r1]
        ldr     r0, =nteam
        bl      printf
        mov     r1, r0
        ldr     r0, =name1
        bl      printf
        ldr     r0, =name2
        bl      printf
        ldr     r0, =name3
        bl      printf
        pop     {ip, pc}

mission2:
        push    {ip, lr}


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


        pop     {ip, pc}

main:
        push    {ip, lr}

        @ run mission 1&2

        ldr     r0, =fun1
        bl      printf
        bl      mission1
        ldr     r0, =end1
        bl      printf
        ldr     r0, =fun2
        bl      printf
        bl      mission2
        ldr     r0, =end1
        bl      printf

        @ print Main
        ldr     r0, =aprint
        bl      printf

        @ print team

        ldr     r1, =num11
        ldr     r1, [r1]
        ldr     r0, =nteam
        bl      printf

        @print ID and names

        ldr     r0, =print1
        ldr     r1, =ID
        ldr     r1, [r1]
        bl      printf
        ldr     r0, =name1
        bl      printf


        ldr     r0, =print2
        ldr     r1, =ID1
        ldr     r1, [r1]
        bl      printf
        ldr     r0, =name2
        bl      printf


        ldr     r0, =print3
        ldr     r1, =ID2
        ldr     r1, [r1]
        bl      printf
        ldr     r0, =name3
        bl      printf

        @print sum
        ldr     r0, =sum
        ldr     r1, =totalnum
        ldr     r1, [r1]
        bl      printf


        ldr     r0, =end1
        bl      printf


        pop     {ip, pc}
