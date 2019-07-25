// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Pseudo code:
// R2 = 0;
// for (i=0; i<R0; i++) {
//     R2 += R1;
// }

    @0
    D=A
    @R2
    M=D // R2 = 0
    @i
    M=D // i = 0

(LOOP)
    @R0
    D=M
    @i
    D=D-M
    @END
    D;JEQ // if i == R0 goto END

    @R1
    D=M
    @R2
    M=M+D // R2 += R1

    @i
    M=M+1 // i++

    @LOOP
    0;JMP // goto LOOP

(END)
    @END
    0;JMP // goto END