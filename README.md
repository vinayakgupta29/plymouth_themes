# Plymouth Themes

A collection of custom Plymouth boot splash themes for Linux.

## Features

* Multiple Plymouth themes in a single repository.
* Interactive installer with theme selection.
* Themes are discovered automatically.
* New themes can be added without modifying `install.sh`.
* Sets the selected theme as the default and rebuilds the initramfs.


<figure>
  <img src="./frames_01/frame_0000.png" alt="Theme 1 preview" width="600">
  <figcaption><em>Theme 1</em></figcaption>
</figure>

 
<figure>
  <img src="./frames_02/frame_0000.png" alt="Theme 1 preview" width="600">
  <figcaption><em>Theme 2</em></figcaption>
</figure>

<figure>
  <img src="./frames_03/frame_0000.png" alt="Theme 1 preview" width="600">
  <figcaption><em>Theme 3</em></figcaption>
</figure>


<figure>
  <img src="./frames_04/frame_0000.png" alt="Theme 4 preview" width="600">
  <figcaption><em>Theme 4</em></figcaption>
</figure>

<figure>
  <img src="./frames_05/frame_0000.png" alt="Theme 5 preview" width="600">
  <figcaption><em>Theme 5</em></figcaption>
</figure>

<figure>
  <img src="./frames_06/frame_0000.png" alt="Theme 6 preview" width="600">
  <figcaption><em>Theme 6</em></figcaption>
</figure>

<figure>
  <img src="./frames_07/frame_0000.png" alt="Theme 7 preview" width="600">
  <figcaption><em>Theme 7</em></figcaption>
</figure>

<figure>
  <img src="./frames_08/frame_0000.png" alt="Theme 8 preview" width="600">
  <figcaption><em>Theme 8</em></figcaption>
</figure>

<figure>
  <img src="./frames_09/frame_0000.png" alt="Theme 9 preview" width="600">
  <figcaption><em>Theme 9</em></figcaption>
</figure>



## Repository Layout

```text
.
├── install.sh
├── README.md
├── theme_1/
│   ├── theme_1.plymouth
│   ├── theme_1.script
│   └── assets...
├── theme_2/
│   ├── theme_2.plymouth
│   ├── theme_2.script
│   └── assets...
└── ...
```

Any directory containing both a `.plymouth` file and a `.script` file is automatically detected as a theme.

## Installation

Clone the repository:

```bash
git clone https://github.com/vinayakgupta29/plymouth_themes.git
cd plymouth_themes
```

Make the installer executable:

```bash
chmod +x install.sh
```

Run the installer:

```bash
./install.sh
```

You'll be presented with a menu similar to:

```text
Available themes:
1) theme_1
2) theme_2
3) theme_3

Select a theme [1]:
```

Press **Enter** to install the default option, or enter the number corresponding to the desired theme.

## Requirements

* Plymouth
* `sudo`
* `update-initramfs`

### Debian / Ubuntu

```bash
sudo apt install plymouth
```

### Arch Linux

```bash
sudo pacman -S plymouth
```

### Fedora

```bash
sudo dnf install plymouth
```

## Manual Installation

Copy the desired theme directory:

```bash
sudo cp -r theme_name /usr/share/plymouth/themes/
```

Set it as the default theme:

```bash
sudo plymouth-set-default-theme theme_name
```

Regenerate the initramfs:

### Debian / Ubuntu

```bash
sudo update-initramfs -u
```

### Arch Linux

```bash
sudo mkinitcpio -P
```

### Fedora

```bash
sudo dracut --force
```

Reboot to see the changes.

## Adding New Themes

Simply create a new directory containing:

* `theme_name.plymouth`
* `theme_name.script`

The installer will automatically detect it and add it to the menu.

## License

GPL v3.0


