INCLUDE Irvine32.inc

.data
    array     DWORD 3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9, 3, 2, 3, 8, 4, 6, 2, 6, 4    ; array
    lower     DWORD 4
    upper     DWORD 8
    ArraySize DWORD ($ - array) / TYPE lower   ; count array size
    index     DWORD 0
    sum       DWORD 0
    qualified DWORD 0   ; New variable to count qualified members
    qm BYTE "Qualified members: ", 0
    sumnum BYTE "Sum = ", 0

.code
    main PROC
    
        mov     eax, lower
        mov     ebx, upper
        mov     ecx, ArraySize
        sub     ecx, 2
        mov     edx, index
        mov     esi, sum

    .WHILE edx < ecx
        .IF     array[edx*4] >= eax &&  array[edx*4] <= ebx            ; Compare with lower bound
            add esi, array[edx*4]
            inc qualified   ; Increment the count of qualified members
        .ENDIF
        inc edx

    .ENDW

        ; Display the number of qualified members
        mov     eax, qualified
        mov edx, OFFSET qm
        call WriteString
        call    WriteDec
        call    Crlf

        ; Display the sum
        mov     eax, esi
        mov edx, OFFSET sumnum
        call WriteString
        call    WriteDec
        call    Crlf


    main ENDP
END main
