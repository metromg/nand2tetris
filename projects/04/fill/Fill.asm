// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Pseudo code:
// while (true) {
//     if (keyboard == 0) fill = 0 (white) else fill = -1 (black)
//     addr = SCREEN
//     for (i=0; i<8192; i++) {
//         RAM[addr] = fill;
//         addr++;
//     }
// }

(START)
    @KBD
    D=M
    @FILLWHITE
    D;JEQ // if keyboard == 0 then fill white else fill black
    
(FILLBLACK)
    @fill
    M=-1 // fill = -1

    @FILL
    0;JMP // goto FILL

(FILLWHITE)
    @fill
    M=0 // fill = 0

    @FILL
    0;JMP // goto FILL

(FILL)
    @SCREEN
    D=A
    @addr
    M=D // addr = SCREEN

    @0
    D=A
    @i
    M=D // i = 0

(LOOP)
    @8192 // n = 8192 (512x256 screen resolution -> 16Bit * 32 * 256 -> 32*256=8192)
    D=A
    @i
    D=D-M
    @END
    D;JEQ // if i == n goto END

    @fill
    D=M
    @addr
    A=M
    M=D // M[addr] = fill

    @addr
    M=M+1 // addr++

    @i
    M=M+1 // i++

    @LOOP
    0;JMP // goto LOOP

(END)
    @START
    0;JMP // infinite loop