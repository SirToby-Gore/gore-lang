#!/bin/bash

echo \"Compiling $1.cpp for Linux...\"
g++ -c -fPIC $1.cpp -o $1.o

if [ \$? -ne 0 ]; then
    echo \"Error: Compilation failed for $1.cpp\"
    exit 1
fi

echo \"Linking lib_$1.so...\"
g++ -shared $1.o -o lib_$1.so

if [ \$? -ne 0 ]; then
    echo \"Error: Linking failed for lib_$1.so\"
    exit 1
fi

echo \"Successfully built lib_$1.so\"
