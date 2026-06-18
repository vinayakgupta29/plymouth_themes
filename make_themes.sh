#!/usr/bin/env bash

set -euo pipefail

GIF_DIR="./gifs"
TEMPLATE_DIR="./frames_00"

# Find template files
template_plymouth=$(find "$TEMPLATE_DIR" -maxdepth 1 -name "*.plymouth")
template_script=$(find "$TEMPLATE_DIR" -maxdepth 1 -name "*.script")

if [[ -z "$template_plymouth" || -z "$template_script" ]]; then
    echo "Could not find template .plymouth or .script in $TEMPLATE_DIR"
    exit 1
fi

i=1

find "$GIF_DIR" -maxdepth 1 -type f -name "*.gif" | sort | while read -r gif; do
    dir=$(printf "frames_%02d" "$i")

    echo "Processing $gif -> $dir"

    mkdir -p "$dir"

    # Extract gif frames
    magick "$gif" "$dir/frame_%04d.png"

    # Skip copying template to itself
    if [[ "$dir" != "$TEMPLATE_DIR" ]]; then
        cp "$template_plymouth" "$dir/$dir.plymouth"
        cp "$template_script" "$dir/$dir.script"

        # Update ImageDir=
        sed -i "s|^ImageDir=.*|ImageDir=/usr/share/plymouth/themes/$dir|g" \
            "$dir/$dir.plymouth"

        # Update ScriptFile=
        sed -i "s|^ScriptFile=.*|ScriptFile=/usr/share/plymouth/themes/$dir/$dir.script|g" \
            "$dir/$dir.plymouth"
    fi

    ((i++))
done

