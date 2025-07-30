#!/bin/bash

# exits on error
set -e

echo "this program requires sudo to:"
echo "make the gore lang dir"
echo "move item into the dir"
echo "change ownership of the dir"
echo "to move the binary into the /bin folder"

sudo echo "Starting"

echo "making the gore lang dir"
sudo mkdir /usr/lib/gore_lang

echo "moving the files into the gore lang dir"
sudo mv ./* /usr/lib/gore_lang/
sudo mv ./.* /usr/lib/gore_lang/

echo "changing to /usr/lib"
cd /usr/lib

echo "changing ownership to $USER"
sudo chown $USER gore_lang -R

echo "going into the gore lang dir"
cd gore_lang

echo "going into the packages sub dir"
cd packages

echo "building the packages"
./build_packages.py

echo "building the binary"
dart compile exe bin/gore_lang.dart -o gore_lang

echo "moving the binary into /bin"
sudo mv gore_lang /bin/

echo "Done"