.model small
.stack 100h
.data
msg1 db "                    ......WELCOME TO QUIZ GAME......$"
msg2 db "Rules :$"
msg3 db "x. For every correct answer you will get 1 point.$"
msg4 db "x. For every wrong answer 1 point will be deducted.$"
msg5 db "Press Enter to start quiz :$"
msg6 db "Correct answer$"
msg7 db "Wrong answer$"
msg8 db "You have successfully completed your quiz$"
msg9 db "Total Score: $"
msg10 db "Press 1 to re-attempt quiz or 0 to exit$"       
msg11 db "                     ......Thank You!......$"
Q1 db "1) 2 + 3 = ?$"
QA1 db "    a) 5   b) 6    c) 7$"
Q2 db "2) 5 + 6 = ?$"
QA2 db "    a) 10   b) 11   c) 12$"
Q3 db "3) 15 - 12 = ?$"
QA3 db "    a) 5    b) 3    c) 1$"
Q4 db "4) 3 x 6 = ?$"
QA4 db "    a) 10   b) 18   c) 12$"
Q5 db "5) 6 / 3 = ?$"
QA5 db "    a) 2    b) 1    c) 12$"
Q6 db "6) 8 - 8 = ?$"
QA6 db "    a) -1   b) -2   c) 0$"
Q7 db "7) 3 x 12 = ?$"
QA7 db "    a) 33   b) 36   c) 38$"
Q8 db "8) 9 x 9 = ?$"
QA8 db "    a) 72   b) 91   c) 81$"
Q9 db "9) 11 + 13 = ?$"
QA9 db "    a) 24   b) 26   c) 19$"
.code
main proc
    mov ax, @data
    mov ds, ax
    mov dx, offset msg1
    mov ah, 9
    int 21h
    call NL
    mov dx, offset msg2
    mov ah, 9
    int 21h
    call NL
    mov dx, offset msg3
    mov ah, 9
    int 21h
    call NL
    mov dx, offset msg4
    mov ah, 9
    int 21h
START:
    mov bl, 0
    call NL
    mov dx, offset msg5
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    cmp al, 13
    je QSN1
    jmp START
QSN1:
    call NL
    call QN1
QSN2:
    call NL
    call QN2
QSN3:
    call NL
    call QN3
QSN4:
    call NL
    call QN4
QSN5:
    call NL
    call QN5
QSN6:
    call NL
    call QN6
QSN7:
    call NL
    call QN7
QSN8:
    call NL
    call QN8
QSN9:
    call NL
    call QN9            
SHOW_SCORE:
    call NL
    mov dx, offset msg8
    mov ah, 9
    int 21h
    call NL
    mov dx, offset msg9
    mov ah, 9
    int 21h
    add bl, 48
    mov ah, 2
    mov dl, bl
    int 21h
    jmp EXIT1
EXIT1:
    call NL
    call NL
    mov dx, offset msg10
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    cmp al, '1'
    je START
    call NL
    call NL
    mov dx, offset msg11
    mov ah, 9
    int 21h
    mov ah, 4ch
    int 21h
NL:
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h
    ret
QN1:
    mov dx, offset Q1
    mov ah, 9
    int 21h
    call NL
    mov dx, offset QA1
    mov ah, 9
    int 21h
    call NL
    call INPUT
    cmp al, 'a'
    je Right
    cmp al, 'a'
    je QSN2
    call NL
    mov dx, offset msg7
    mov ah, 9
    int 21h
    call NL
    dec bl
    jmp QSN1
QN2:
    mov dx, offset Q2
    mov ah, 9
    int 21h
    call NL
    mov dx, offset QA2
    mov ah, 9
    int 21h
    call NL
    call INPUT
    cmp al, 'b'
    je Right
    cmp al, 'b'
    je QSN3
    call NL
    mov dx, offset msg7
    mov ah, 9
    int 21h
    call NL
    dec bl
    jmp QSN2
QN3:
    mov dx, offset Q3
    mov ah, 9
    int 21h
    call NL
    mov dx, offset QA3
    mov ah, 9
    int 21h
    call NL
    call INPUT
    cmp al, 'b'
    je Right
    cmp al, 'b'
    je QSN4
    call NL
    mov dx, offset msg7
    mov ah, 9
    int 21h
    call NL
    dec bl
    jmp QSN3
QN4:
    mov dx, offset Q4
    mov ah, 9
    int 21h
    call NL
    mov dx, offset QA4
    mov ah, 9
    int 21h
    call NL
    call INPUT
    cmp al, 'b'
    je Right
    cmp al, 'b'
    je QSN5
    call NL
    mov dx, offset msg7
    mov ah, 9
    int 21h
    call NL
    dec bl
    jmp QSN4
QN5:
    mov dx, offset Q5
    mov ah, 9
    int 21h
    call NL
    mov dx, offset QA5
    mov ah, 9
    int 21h
    call NL
    call INPUT
    cmp al, 'a'
    je Right
    cmp al, 'a'
    je QSN6
    call NL
    mov dx, offset msg7
    mov ah, 9
    int 21h
    call NL
    dec bl
    jmp QSN5
QN6:
    mov dx, offset Q6
    mov ah, 9
    int 21h
    call NL
    mov dx, offset QA6
    mov ah, 9
    int 21h
    call NL
    call INPUT
    cmp al, 'c'
    je Right
    cmp al, 'c'
    je QSN7
    call NL
    mov dx, offset msg7
    mov ah, 9
    int 21h
    call NL
    dec bl
    jmp QSN6
QN7:
    mov dx, offset Q7
    mov ah, 9
    int 21h
    call NL
    mov dx, offset QA7
    mov ah, 9
    int 21h
    call NL
    call INPUT
    cmp al, 'b'
    je Right
    cmp al, 'b'
    je QSN8
    call NL
    mov dx, offset msg7
    mov ah, 9
    int 21h
    call NL
    dec bl
    jmp QSN7
QN8:
    mov dx, offset Q8
    mov ah, 9
    int 21h
    call NL
    mov dx, offset QA8
    mov ah, 9
    int 21h
    call NL
    call INPUT
    cmp al, 'c'
    je Right
    cmp al, 'c'
    je QSN9
    call NL
    mov dx, offset msg7
    mov ah, 9
    int 21h
    call NL
    dec bl
    jmp QSN8
QN9:
    mov dx, offset Q9
    mov ah, 9
    int 21h
    call NL
    mov dx, offset QA9
    mov ah, 9
    int 21h
    call NL
    call INPUT
    cmp al, 'a'
    je Right
    cmp al, 'a'
    je SHOW_SCORE
    call NL
    mov dx, offset msg7
    mov ah, 9
    int 21h
    call NL
    dec bl
    jmp QSN9        
INPUT:
    mov ah, 1
    int 21h
    ret
Right:
    call NL
    inc bl
    mov dx,offset msg6
    mov ah,9
    int 21h
    ret
main endp
end main   
