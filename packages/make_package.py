#!/bin/python3

import os, sys
sys.path.append(os.path.dirname(p=os.path.dirname(p=os.path.abspath(path=f'{__file__}../'))))

from vars import *

if len(sys.argv) != 2:
    print(f'Usage py {__file__.split('/')[-1]} <package name>')
    exit(code=1)

def main() -> None:
    LOWER_PACKAGE_NAME: str = sys.argv[1].lower()
    UPPER_PACKAGE_NAME: str = sys.argv[1].upper()

    if LOWER_PACKAGE_NAME in os.listdir():
        print(f'{LOWER_PACKAGE_NAME} already exists')
        exit(code=1)
    
    print('making package dir')
    os.mkdir(path=LOWER_PACKAGE_NAME)

    os.chdir(path=LOWER_PACKAGE_NAME)

    with open(file=f'build_{LOWER_PACKAGE_NAME}.py', mode='w') as build_file:
        build_file.write('\n'.join([
            f'#!/bin/python3',
            f'import os',
            f'import sys',
            f'sys.path.append(os.path.dirname(p=os.path.dirname(p=os.path.abspath(path=f\'{"{"}__file__{"}"}../../\'))))',
            f'from vars import *',
            f'',
            f'def main() -> None:',
            f'    if os_name == OS.unix:',
            f'        print(\'Building {LOWER_PACKAGE_NAME} for Linux...\')',
            f'        os.system(command=\'gcc -shared -fPIC "{LOWER_PACKAGE_NAME}.cpp" -o lib"{LOWER_PACKAGE_NAME}".so -I.\')',
            f'        print(\'Done. lib{LOWER_PACKAGE_NAME}.so created.\')',
            f'        exit(0)',
            f'    if os_name == OS.windows:',
            f'        print(\'Building {LOWER_PACKAGE_NAME} for Windows...\')',
            f'        os.system(command=\'cl.exe "/LD" "/EHsc" "/I." "{LOWER_PACKAGE_NAME}.cpp" "/Fe{LOWER_PACKAGE_NAME}.dll"\')',
            f'        print(\'Done. lib{LOWER_PACKAGE_NAME}.dll created.\')',
            f'main()',
        ]))
    
    if os_name == OS.unix:
        os.system(command=f'chmod +x build_{LOWER_PACKAGE_NAME}.py')
    
    with open(file=f'{LOWER_PACKAGE_NAME}.cpp', mode='w') as cpp_file:
        cpp_file.write('\n'.join([
            f'#include \"{LOWER_PACKAGE_NAME}.h\"',
            f'',
            f'/*',
            f'```asm(Linux x86_64 NASM)',
            f'section .data',
            f'    {LOWER_PACKAGE_NAME}_lib_name db \"{GORE_LANG_PACKAGE_ROOT}/{LOWER_PACKAGE_NAME}.so\", 0',
            f'    func_name db \"{LOWER_PACKAGE_NAME}_func\", 0',
            f'',
            f'section .bss',
            f'    {LOWER_PACKAGE_NAME}_lib_handle resq 1',
            f'    {LOWER_PACKAGE_NAME}_func_ptr resq 1',
            f'',
            f'section .text',
            f'    mov rdi, {LOWER_PACKAGE_NAME}_lib_name',
            f'    mov rsi, 1',
            f'    call dlopen',
            f'',
            f'    mov [{LOWER_PACKAGE_NAME}_lib_handle], rax',
            f'',
            f'    mov rdi, [{LOWER_PACKAGE_NAME}_lib_handle]',
            f'    mov rsi, func_name',
            f'    call dlsym',
            f'',
            f'    mov [{LOWER_PACKAGE_NAME}_func_ptr], rax',
            f'',
            f'    call [{LOWER_PACKAGE_NAME}_func_ptr]',
            f'```',
            f'',
            f'```asm (Windows x86_64 NASM)',
            f'section .data',
            f'    dll_name db \"{LOWER_PACKAGE_NAME}.dll\", 0',
            f'    func_name db \"{LOWER_PACKAGE_NAME}_func\", 0',
            f'',
            f'section .bss',
            f'    dll_handle resq 1',
            f'    func_ptr resq 1',
            f'',
            f'section .text',
            f'    mov rcx, dll_name',
            f'    call LoadLibraryA',
            f'',
            f'    mov [dll_handle], rax',
            f'',
            f'    mov rcx, [dll_handle]',
            f'    mov rdx, func_name',
            f'    call GetProcAddress',
            f'',
            f'    mov [func_ptr], rax',
            f'',
            f'    call [func_ptr]',
            f'```',
            f'*/',
            f'',
            f'// Implement the function defined in the header',
            f'{UPPER_PACKAGE_NAME}_API void {LOWER_PACKAGE_NAME}_func(/* args */) {"{"}',
            f'{"}"}',
        ]))
    
    with open(file=f'{LOWER_PACKAGE_NAME}.h', mode='w') as header_file:
        header_file.write('\n'.join([
            f'#ifndef {UPPER_PACKAGE_NAME}_H',
            f'#define {UPPER_PACKAGE_NAME}_H',
            f'',
            f'#ifdef _WIN32',
            f'  #ifdef {UPPER_PACKAGE_NAME}_EXPORTS',
            f'    #define {UPPER_PACKAGE_NAME}_API __declspec(dllexport)',
            f'  #else',
            f'    #define {UPPER_PACKAGE_NAME}_API __declspec(dllimport)',
            f'  #endif',
            f'#else',
            f'  #define {UPPER_PACKAGE_NAME}_API',
            f'#endif',
            f'',
            f'#ifdef __cplusplus',
            f'extern "C" {"{"}',
            f'#endif',
            f'',
            f'{UPPER_PACKAGE_NAME}_API void {LOWER_PACKAGE_NAME}_func(/* args */);',
            f'',
            f'#ifdef __cplusplus',
            f'{"}"}',
            f'#endif',
            f'',
            f'#endif // {UPPER_PACKAGE_NAME}_H',
        ]))
    
    print(f'Package "{LOWER_PACKAGE_NAME}" structure created successfully with cd into {LOWER_PACKAGE_NAME} and run build_{LOWER_PACKAGE_NAME}.py to build script or run build_packages.py')

if __name__ == "__main__":
    main()