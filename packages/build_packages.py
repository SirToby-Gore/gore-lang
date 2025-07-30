#!/bin/python3

import os

print('--------------------------')
print('--- Building packages ----')
print('--------------------------')
print('')

for package in [dir for dir in os.listdir() if os.path.isdir(dir)]:
    print(f'Building {package}')
    os.chdir(package)
    os.system(f'./build_{package}.sh')
    os.chdir('../')

print('')
print('--------------------------')
print('--- Built all packages ---')
print('--------------------------')



