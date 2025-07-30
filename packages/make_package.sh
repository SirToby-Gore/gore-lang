#!/bin/bash

set -e

echo "making package $1"

# creates dir for the package
mkdir "$1"
cd "$1"

# creates the make commands in a .sh
echo "
g++ -c -fPIC $1.cpp -o $1.o
g++ -shared $1.o -o lib_$1.so
" > "build_$1.sh"
chmod +x "build_$1.sh"

# creates the body function
echo "
#include \"$1.h\"

void ${1}_func(/* args */) {
}
" > "$1.cpp"

# creates the header file
echo "
#ifndef ${1^}_H
#define ${1^}_H

#ifdef __cplusplus
extern \"C\" {
#endif

void ${1}_func(/* args */);

#ifdef __cplusplus
}
#endif

#endif // ${1^}_H
" > "$1.h"

# returns up a dir
cd ..



