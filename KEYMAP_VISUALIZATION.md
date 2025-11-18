# Keymap Visualization

This repository includes automated keymap visualization using [keymap-drawer](https://github.com/caksoylar/keymap-drawer).

## Quick Start

Generate keymap visualizations with a single command:

```bash
make keymap
```

Or run the script directly:

```bash
./bin/generate_keymap.sh
```

## Generated Files

The script generates the following files:

- **keymap-2col.png** - All keyboard layers displayed in a 2-column layout (recommended)
- **keymap-2col.svg** - SVG version (scalable)
- **keymap-base.png** - Base layer only, for quick reference
- **keymap-base.svg** - SVG version of base layer
- **keymap.yaml** - Parsed keymap data (intermediate file)

## Customization

You can customize the visualization by editing `keymap-drawer-config.yaml`:

```yaml
draw_config:
  n_columns: 2          # Number of columns to display layers
  key_w: 60.0           # Key width
  key_h: 56.0           # Key height
  split_gap: 30.0       # Gap between keyboard halves
  dark_mode: false      # Set to true for dark background
  footer_text: ''       # Add custom footer text
```

## Requirements

- Python 3.x with `keymap-drawer` installed: `pip install keymap-drawer`
- `librsvg` for SVG to PNG conversion: `brew install librsvg` (macOS)

## Manual Generation

If you want to generate specific layers or customize further:

```bash
# Parse the keymap
keymap parse -z config/adv360.keymap -o keymap.yaml

# Draw specific layers only
keymap draw keymap.yaml -z adv360 -s Base Fn -o custom.svg

# Convert to PNG
rsvg-convert -w 2000 custom.svg -o custom.png
```

## Adding to Git

The generated images can be committed to the repository to document your keymap:

```bash
git add keymap-2col.png keymap-base.png
git commit -m "Update keymap visualization"
```
