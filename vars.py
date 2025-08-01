import os
import sys
import enum

class OS(enum.Enum):
    windows = 0
    unix = 1
    unknown = 3

os_name: OS = {
    'win32': OS.windows,
    'linux': OS.unix,
    'darwin': OS.unix,
}.get(
    sys.platform,
) or exit(code=1)

GORE_LANG_NAME: str = 'gore_lang'
BASE_PATH: str = {
    OS.windows: 'C:\\Program Files x86',
    OS.unix: '/usr/lib'
}[os_name]
GORE_LANG_ROOT: str = f'{BASE_PATH}/{GORE_LANG_NAME}'

GORE_LANG_PACKAGE_ROOT: str = f'{GORE_LANG_ROOT}/packages'

GORE_LANG_MAIN_FILE: str = f'{GORE_LANG_ROOT}/bin/gore_lang.dart'
GORE_LANG_BINARY: str = f'{GORE_LANG_ROOT}/{GORE_LANG_NAME}' + {
    OS.windows: '.exe',
    OS.unix: '.bin'
}[os_name]
PYTHON: str = {
    OS.windows: 'python.exe',
    OS.unix: 'python3',
}[os_name]
USER_SHEBANG: str = '#!/bin/python3'