set -e

source ./vars.sh

echo-clr "building gore lang" cyan
dart compile exe bin/gore_lang.dart -o "\"$BINARY_PATH\""

if [ -f $BINARY_LINKED_PATH ]; then
    echo-clr "path already exists, exiting" red
    exit 1
fi

echo-clr "linking ${BINARY_PATH} in /bin" cyan
sudo ln -s "\"$BINARY_PATH\"" "\"$BINARY_LINKED_PATH\""

echo-clr "Done" green