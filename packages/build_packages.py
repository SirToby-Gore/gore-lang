#!/bin/python3

import os
import sys
sys.path.append(os.path.dirname(p=os.path.dirname(p=os.path.abspath(path=f'{__file__}../'))))

from vars import *

print('--------------------------')
print('--- Building packages ----')
print('--------------------------')
print('')

packages: list[str] = [
    dir
    for dir in os.listdir()
    if os.path.isdir(s=dir) and not dir.startswith('.')
]

for index, package in enumerate(iterable=packages, start=1):
    print(f'{index}:')
    os.chdir(path=package)
    os.system(command=f'{PYTHON} build_{package}.py')
    os.chdir(path='../')

    print('')

print('--------------------------')
print('--- Built all packages ---')
print('--------------------------')



