#!/bin/bash

# exits on error
set -e

source ./vars.sh

echo-clr "this program requires sudo to:" yellow
echo-clr "  - make the gore lang directory" yellow
echo-clr "  - move item into the directory" yellow
echo-clr "  - change ownership of the directory" yellow
echo-clr "  - to move the binary into the /bin folder" yellow

echo-clr "Starting" green

echo-clr "making the gore lang directory: \"$INSTALL_DIR\"" cyan
sudo mkdir "\"$INSTALL_DIR\"" -p

echo-clr "moving the files into the gore lang directory" cyan
sudo mv ./* "\"$INSTALL_DIR/\""
sudo mv ./.* "\"$INSTALL_DIR/\""

echo-clr "changing to /usr/lib"  cyan
cd /usr/lib

echo-clr "changing ownership to $USER" cyan
sudo chown $USER gore_lang -R

echo-clr "changing back to $INSTALL_DIR" cyan
cd $INSTALL_DIR

echo-clr "going into the packages sub directory" cyan
cd packages

echo-clr "building the packages" cyan
python3 build_packages.py

echo-clr "building the binary" cyan
./build_gore_lang.sh

echo-clr "Done" green
