#!/bin/bash

# Usage: ./ttf2base64css.sh font.ttf "FontName" output.css

INPUT_FILE="$1"
FONT_NAME="$2"
OUTPUT_FILE="$3"

# Check inputs
if [ -z "$INPUT_FILE" ] || [ -z "$FONT_NAME" ] || [ -z "$OUTPUT_FILE" ]; then
  echo "Usage: $0 <input.ttf> <font-name> <output.css>"
  exit 1
fi

# Convert TTF to base64 (no line wrapping)
BASE64_DATA=$(base64 -w 0 "$INPUT_FILE")

# Write CSS
cat <<EOF > "$OUTPUT_FILE"
@font-face {
  font-family: '$FONT_NAME';
  src: url(data:font/ttf;base64,$BASE64_DATA) format('truetype');
}
EOF

echo "Done! CSS saved to $OUTPUT_FILE"
