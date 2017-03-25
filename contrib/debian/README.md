
Debian
====================
This directory contains files used to package trollcoind/trollcoin-qt
for Debian-based Linux systems. If you compile trollcoind/trollcoin-qt yourself, there are some useful files here.

## trollcoin: URI support ##


trollcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install trollcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your trollcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/trollcoin128.png` to `/usr/share/pixmaps`

trollcoin-qt.protocol (KDE)

