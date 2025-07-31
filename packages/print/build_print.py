#!/bin/python3
import os
import sys
sys.path.append(os.path.dirname(p=os.path.dirname(p=os.path.abspath(path=f'{__file__}../../'))))
from vars import *

def main() -> None:
    if os_name == OS.unix:
        print('Building print for Linux...')
        os.system(command='gcc -shared -fPIC "print.cpp" -o lib"print".so -I.')
        print('Done. libprint.so created.')
        exit(0)
    if os_name == OS.windows:
        print('Building print for Windows...')
        os.system(command='cl.exe "/LD" "/EHsc" "/I." "print.cpp" "/Feprint.dll"')
        print('Done. libprint.dll created.')
main()