# QMK firmware build action

This action builds firmware for custom keymap in github actions runners
No more need to download and setup QMK environment on local machine - just use power of Github Actions to build your keyboard firmware.

## Inputs

- `keymap-path` - Path to Your keymap folder, must be same as qmk_firmware path ("keyboards/idobao/id75/keymaps/justgook")
- `keyboard` - Keyboard name ("idobao/id75/v1")
- `keymap`: "Keymap name, must match `keymap-path` folder" ("justgook")

## Example usage
```yaml
    steps:

      - uses: actions/checkout@v1

      - name: Build Firmware
        uses: ./
        with:
          keymap-path: "keyboards/idobao/id75/keymaps/justgook"
          keyboard: "idobao/id75/v1"
          keymap: "justgook"

      - name: Upload a Firmware
        uses: actions/upload-artifact@v3.1.2
        with:
          name: firmware
          path: build
```
## Flashing the firmware

use lsusb to find the correct device ID for the dfu mode of the keyboard, then flash with

```
sudo dfu-util -d 0483:df11 -a 0 -s 0x08000000:leave -D preonic_rev3_addy.bin
```

the device id is 0483:df11, 0x08000000... is the offset where to write the firmware. make sure to flash bin not hex.
