#!/bin/sh -l

KEYMAP_PATH=$1
KEYBOARD=$2
KEYMAP=$3

echo "qmk compile -kb $KEYBOARD -km $KEYMAP"
ln -s "/home/input/$KEYMAP_PATH" "/qmk_firmware/$KEYMAP_PATH"
qmk compile -kb "$KEYBOARD" -km "$KEYMAP"
rm -rf build
mkdir ./build
find /qmk_firmware/.build -name \*.hex -exec cp {} ./build \;
