import os
import sys
sys.path.append(os.path.dirname(p=os.path.dirname(p=os.path.abspath(path=f'{__file__}../../'))))
from vars import *

def main() -> None:
    if os_name == OS.unix:
        print('Building test for Linux...')
        os.system(command='gcc -shared -fPIC "test.cpp" -o lib"test".so -I.')
        print('Done. libtest.so created.')
        exit(0)
    if os_name == OS.windows:
        print('Building test for Windows...')
        os.system(command='cl.exe "/LD" "/EHsc" "/I." "test.cpp" "/Fetest.dll"')
        print('Done. libtest.dll created.')

main()