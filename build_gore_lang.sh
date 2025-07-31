set -e

source ./vars.sh

echo "building gore lang"
dart compile exe bin/gore_lang.dart -o "\"$BINARY_PATH\""

if [ -f $BINARY_LINKED_PATH ]; then
    echo "path already exists, exiting"
    exit 1
fi

echo "linking ${BINARY_PATH} in /bin"
sudo ln -s "\"$BINARY_PATH\"" "\"$BINARY_LINKED_PATH\""
