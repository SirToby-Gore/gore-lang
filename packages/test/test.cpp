#include "test.h"
#include <iostream> // For demonstration purposes

/*
```asm(Linux x86_64 NASM)
section .data
    test_lib_name db "/usr/lib/gore_lang/packages/test.so", 0
    func_name db "test_func", 0

section .bss
    test_lib_handle resq 1
    test_func_ptr resq 1

section .text
    mov rdi, test_lib_name
    mov rsi, 1
    call dlopen

    mov [test_lib_handle], rax

    mov rdi, [test_lib_handle]
    mov rsi, func_name
    call dlsym

    mov [test_func_ptr], rax

    call [test_func_ptr]
```

```asm (Windows x86_64 NASM)
section .data
    dll_name db "test.dll", 0
    func_name db "test_func", 0

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
TEST_API void test_func(/* args */) {
}