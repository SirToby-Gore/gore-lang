#include "print.h"
#include <iostream>

/*
TODO: sort out asm example

```asm(Linux x86_64 NASM)
section .data
    print_lib_name db "/usr/lib/gore_lang/packages/print.so", 0
    func_name db "print_func", 0

section .bss
    print_lib_handle resq 1
    print_func_ptr resq 1

section .text
    mov rdi, print_lib_name
    mov rsi, FALSE  ; for stdout
    mov rxi, TRUE   ; for a new line
    call dlopen

    mov [print_lib_handle], rax

    mov rdi, [print_lib_handle]
    mov rsi, func_name
    call dlsym

    mov [print_func_ptr], rax

    call [print_func_ptr]
```

```asm (Windows x86_64 NASM)
section .data
    dll_name db "print.dll", 0
    func_name db "print_func", 0

section .bss
    dll_handle resq 1
    func_ptr resq 1

section .text
    mov rcx, dll_name
    call LoadLibraryA

    mov [dll_handle], rax

    mov rcx, [dll_handle]
    mov rdx, func_name
    call GetProcAddress

    mov [func_ptr], rax

    call [func_ptr]
```
*/

// Implement the function defined in the header
PRINT_API void print_message(const char* message, int use_stderr, int add_leading_newline) {
    FILE* output_stream = use_stderr ? stderr : stdout;

    if (add_leading_newline) {
        fprintf(output_stream, "\n");
    }
    
    fprintf(output_stream, "%s", message);

    fflush(output_stream);
}