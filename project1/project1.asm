;Project 1

; 32-bit

INCLUDE Irvine32.inc

.data
left     DWORD  3753    ; left part of Student ID
right    DWORD  273     ; right part of Student ID
total    DWORD  ?       ; uninitialized
diff     DWORD  ?       ; uninitialized
message  BYTE   "Hello World!",0        ; string characters
numbers  DWORD  1, 2, 4, 8, 16, 32, 64  ; array
arrayLength = ($-numbers)/4             ; count array size

.code
main PROC

   mov eax, left       ; eax = left
    add eax, right      ; eax += right
    mov total, eax      ; total = eax

    mov eax, left       ; eax = left
    sub eax, right      ; eax -= right
    mov diff, eax       ; diff = eax

    mov eax, left       ; eax = left
    mov ebx, right      ; ebx = right
    mov ecx, total      ; ecx = total
    mov edx, diff       ; edx = diff
    mov esi, arrayLength    ;
    call    DumpRegs            ; display the registers

    exit
main ENDP
END main
