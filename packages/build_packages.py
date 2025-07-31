import os
import sys
sys.path.append(os.path.dirname(p=os.path.dirname(p=os.path.abspath(path=f'{__file__}../'))))

from vars import *

print('--------------------------')
print('--- Building packages ----')
print('--------------------------')
print('')

for package in [dir for dir in os.listdir() if os.path.isdir(dir) and not dir.startswith('.')]:
    os.chdir(path=package)
    os.system(command=f'{PYTHON} build_{package}.py')
    os.chdir(path='../')

print('')
print('--------------------------')
print('--- Built all packages ---')
print('--------------------------')



