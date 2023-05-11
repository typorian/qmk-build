#!/bin/sh -l

KEYMAP_PATH=$1
KEYBOARD=$2
KEYMAP=$3

echo ln -s "$KEYMAP_PATH" "/qmk_firmware/$KEYMAP_PATH"
echo "qmk compile -kb $KEYBOARD -km $KEYMAP"
echo "----------------------------------------"
ls
echo "----------------------------------------"
echo "----------------------------------------"
ls /qmk_firmware/keyboards/idobao/id75/keymaps/
echo "----------------------------------------"
ln -s "$KEYMAP_PATH" "/qmk_firmware/$KEYMAP_PATH"
qmk compile -kb "$KEYBOARD" -km "$KEYMAP"
rm -rf build
mkdir ./build
find /qmk_firmware/.build -name \*.hex -exec cp {} ./build \;
