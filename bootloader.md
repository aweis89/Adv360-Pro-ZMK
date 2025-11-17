# Bootloader Mode - Flashing Instructions

## Entering Bootloader Mode

### LEFT Keyboard
1. Hold the **far-right key on the top row** (Mod layer activator)
2. While holding, press the **far-right key on the 2nd row** (bootloader key)
3. The keyboard will mount as a USB drive

**Visual guide:** Top-right corner, then 2nd-row-right corner

### RIGHT Keyboard
1. Hold the **far-left key on the top row** (Mod layer activator)
2. While holding, press the **far-left key on the 2nd row** (bootloader key)
3. The keyboard will mount as a USB drive

**Visual guide:** Top-left corner, then 2nd-row-left corner

## Flashing Process

### Step 1: Download Firmware
1. Go to [GitHub Actions](https://github.com/aweis89/Adv360-Pro-ZMK/actions)
2. Click on the latest successful build
3. Download either:
   - **`firmware-no-clique`** - Standard firmware
   - **`firmware-clique`** - With ZMK Studio support (left side only)
4. Extract the ZIP to get:
   - `YYYYMMDDHHMM-XXXXXXX-left.uf2`
   - `YYYYMMDDHHMM-XXXXXXX-right.uf2`

### Step 2: Flash LEFT Keyboard (Do This First!)
1. **Connect left keyboard** to your computer via USB
2. **Enter bootloader mode** (see LEFT Keyboard instructions above)
   - Alternative: Use the physical reset button (see User Manual section 2.7, page 9)
3. **The keyboard will appear as a USB drive**
4. **Copy the `-left.uf2` file** to the USB drive
5. **The keyboard will automatically disconnect** and reboot

### Step 3: Flash RIGHT Keyboard
1. **Power off both keyboards** (unplug them and ensure power switches are OFF)
2. **Turn on the left keyboard** with its power switch
3. **Connect the right keyboard** to USB
4. **Enter bootloader mode** (see RIGHT Keyboard instructions above)
   - Alternative: Use the physical reset button
5. **The keyboard will appear as a USB drive**
6. **Copy the `-right.uf2` file** to the USB drive
7. **Unplug the right keyboard** and turn it back on with the power switch

### Step 4: Done!
Both halves should now be running your custom firmware. The keyboards will automatically pair via Bluetooth.

## Which Firmware Should You Use?
- **`firmware-no-clique`**: Standard ZMK firmware for traditional keymap usage
- **`firmware-clique`**: Includes ZMK Studio support on the left side for real-time configuration via web interface

## Troubleshooting
- **Some operating systems may show errors** when the drive ejects - this is normal and doesn't mean flashing failed
- **Physical reset buttons** are located as described in the [User Manual](https://kinesis-ergo.com/wp-content/uploads/Advantage360-ZMK-KB360-PRO-Users-Manual-v3-10-23.pdf) section 2.7 (page 9) and section 5.9 (page 14)
- **Verify firmware version**: Press Mod + V to type out the build date and commit hash

## Key Positions Reference
For reference, the bootloader keys in your keymap are:
- **Mod layer**: Layer 3 (activated by `&mo 3` on position 6/7)
- **Bootloader command**: `&bootloader` on position 20 (left) / 21 (right)

See [key-positions.md](assets/key-positions.md) for complete key position map.
