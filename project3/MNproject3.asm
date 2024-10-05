INCLUDE Irvine32.inc

.data
    inputPrompt BYTE "Enter a whole dollar amount between 1 and 3,000 that you would like to donate (enter 0 to exit): ", 0
    exitMessage BYTE "Oh, you don't have any money :(. I guess you can go now...", 0
    thanks BYTE "Thank you for your contribution!!! ", 0
    invalidMsg BYTE "Invalid input. Please enter a dollar amount between 1 and 3,000.", 0
    classPlatinum BYTE "This is a PLATINUM donation", 0
    classGold BYTE "This is a GOLD donation", 0
    classSilver BYTE "This is a SILVER donation", 0
    classBronze BYTE "This is a BRONZE donation", 0
    classBrass BYTE "This is a BRASS donation", 0

.code
main PROC
inputLoop:
    ; Display input prompt
    mov edx, OFFSET inputPrompt
    call WriteString

    ; Read user input
    call ReadInt
    mov ebx, eax  ; Save the input value for later comparison

    ; Check for sentinel value
    cmp ebx, 0
    je exitProgram

    ; Check if input is within valid range
    cmp ebx, 3000
    jg invalidInput
    cmp ebx, 1
    jl invalidInput

    ; Determine the class of donation based on the input value
    .IF ebx >= 2000
        mov edx, OFFSET classPlatinum
    .ELSEIF ebx >= 1500
        mov edx, OFFSET classGold
    .ELSEIF ebx >= 1000
        mov edx, OFFSET classSilver
    .ELSEIF ebx >= 500
        mov edx, OFFSET classBronze
    .ELSE
        mov edx, OFFSET classBrass
    .ENDIF

    ; Display the class of donation
    call WriteString

    ; Display thanks message
    mov edx, OFFSET thanks
    call Crlf
    call WriteString
    call Crlf
    jmp inputLoop

invalidInput:
    ; Display invalid input message
    mov edx, OFFSET invalidMsg
    call WriteString
    call Crlf
    jmp inputLoop

exitProgram:
    ; Display exit message
    mov edx, OFFSET exitMessage
    call WriteString
    call Crlf
    exit
main ENDP

END main
