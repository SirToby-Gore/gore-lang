#!/bin/python3

from vars import *

def main() -> None:
    os.system(command=f'dart compile exe "{GORE_LANG_MAIN_FILE}" -o "{GORE_LANG_BINARY}"')
    
    if os_name == OS.windows:
        if GORE_LANG_BINARY not in os.environ['PATH']:
            print(f'please add the gore lang binary: "{GORE_LANG_BINARY}" to your path')
    elif os_name == OS.unix:
        if 'gore' not in os.listdir(path='/bin'):
            os.system(command=f'sudo ln -s {GORE_LANG_BINARY} /bin/gore')

if __name__ == "__main__":
    main()