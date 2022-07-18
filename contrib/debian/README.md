
Debian
====================
This directory contains files used to package metaacod/metaaco-qt
for Debian-based Linux systems. If you compile metaacod/metaaco-qt yourself, there are some useful files here.

## metaaco: URI support ##


metaaco-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install metaaco-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your metaaco-qt binary to `/usr/bin`
and the `../../share/pixmaps/metaaco128.png` to `/usr/share/pixmaps`

metaaco-qt.protocol (KDE)

