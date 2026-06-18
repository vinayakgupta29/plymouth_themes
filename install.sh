#!/usr/bin/env bash

set -e

THEME_ROOT="$(cd "$(dirname "$0")" && pwd)"

themes=()

# Find directories containing both a .plymouth and a .script file
while IFS= read -r dir; do
    if compgen -G "$dir/*.plymouth" > /dev/null &&
       compgen -G "$dir/*.script" > /dev/null; then
        themes+=("$(basename "$dir")")
    fi
done < <(find "$THEME_ROOT" -mindepth 1 -maxdepth 1 -type d | sort)

if [ ${#themes[@]} -eq 0 ]; then
    echo "No Plymouth themes found."
    exit 1
fi

echo "Available themes:"
for i in "${!themes[@]}"; do
    printf "%d) %s\n" "$((i+1))" "${themes[$i]}"
done

echo
read -rp "Select a theme (default=1) : " choice

choice=${choice:-1}

if ! [[ "$choice" =~ ^[0-9]+$ ]] ||
   (( choice < 1 || choice > ${#themes[@]} )); then
    echo "Invalid selection."
    exit 1
fi

theme="${themes[$((choice-1))]}"
theme_dir="$THEME_ROOT/$theme"

echo "Installing $theme..."

sudo cp -r "$theme_dir" "/usr/share/plymouth/themes/"
sudo plymouth-set-default-theme "$theme"
sudo update-initramfs -u

echo "Done."

