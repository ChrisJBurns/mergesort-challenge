SYS_EXIT        equ 0x02000001
SYS_WRITE       equ 0x02000004
SYS_READ        equ 0x02000003
STDOUT          equ 1
STDIN           equ 0

    %macro write_string 2 
      mov     rax, SYS_WRITE
      mov     rdi, STDOUT
      mov     rsi, %1
      mov     rdx, %2
      syscall
    %endmacro

    %macro read_string 2 
      mov     rax, SYS_READ
      mov     rdi, STDIN
      mov     rsi, %1
      mov     rdx, %2
      syscall
    %endmacro
        
segment .data
        msg1 db "Enter a digit ", 0xA,0xD 
        len1 equ $ - msg1 

        msg2 db "Enter a digit ", 0xA,0xD 
        len2 equ $ - msg2

        msg3 db "The sum is: "
        len3 equ $ - msg3


segment .bss
        num1 resb 2
        num2 resb 2
        result resb 1


global    _main
          section   .text

_main:
        write_string msg1, len1
        read_string num1, 2

        write_string msg2, len2
        read_string num2, 2
sum:
        write_string msg3, len3

        mov     eax, [rel num1]
        sub     eax, '0'

        mov     ebx, [rel num2]
        sub     ebx, '0'

        add     eax, ebx
        add     eax, '0'
        mov     [rel result], eax

        write_string result, 1
exit:
        mov       rax, SYS_EXIT           ; system call for exit
        xor       rdi, rdi                ; exit code 0
        syscall                           ; invoke operating system to exit 