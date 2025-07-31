#!/bin/bash

from vars import *

def main() -> None:
    CURRENT_DIR = os.getcwd()

    # print(f'making root dir: {GORE_LANG_ROOT}')
    # os.mkdir(path=GORE_LANG_ROOT)

    print('Moving files...')
    for item in [item for item in os.listdir(path=CURRENT_DIR)]:
        print(f'Moving {CURRENT_DIR}/{item} to {GORE_LANG_ROOT}/{item}')
        
        os.rename(
            src=f'{CURRENT_DIR}/{item}',
            dst=f'{GORE_LANG_ROOT}/{item}'
        )
    
    print(f'entering root dir: {GORE_LANG_ROOT}')
    os.chdir(path=GORE_LANG_ROOT)

    print(f'entering packages sub-dir: {GORE_LANG_PACKAGE_ROOT}')
    os.chdir(path=GORE_LANG_PACKAGE_ROOT)

    print('building packages')
    os.system(command='py build_packages.py')

    print(f'entering root dir: {GORE_LANG_ROOT}')
    os.chdir(path=GORE_LANG_ROOT)

    print(f'building binary from {GORE_LANG_MAIN_FILE} to {GORE_LANG_BINARY}')
    os.system(command='py build_binary.py')

    print('done')

if __name__ == "__main__":
    main()