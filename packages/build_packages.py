import os
import sys

print('--------------------------')
print('--- Building packages ----')
print('--------------------------')
print('')

for package in [dir for dir in os.listdir() if os.path.isdir(dir) and not dir.startswith('.')]:
    os.chdir(path=package)
    if sys.platform == 'win32':
        os.system(command=f'./build_{package}.ps1')
    elif sys.platform == 'linux':
        os.system(command=f'./build_{package}.sh')
    os.chdir(path='../')

print('')
print('--------------------------')
print('--- Built all packages ---')
print('--------------------------')



