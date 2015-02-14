#!/bin/sh

# web-mode
if [ -d ~/.emacs.d/web-mode/ ]; then
	echo "Updating web-mode\n"
	cd ~/.emacs.d/web-mode/
	git pull
else
	echo "Get web-mode\n"
	git clone https://github.com/fxbois/web-mode.git
fi

# multiple-cursors
if [ -d ~/.emacs.d/multiple-cursors.el/ ]; then
	echo "Updating multiple-cursors\n"
	cd ~/.emacs.d/multiple-cursors.el/
	git pull
else
	echo "Get multiple-cursors\n"
	git clone git@github.com:magnars/multiple-cursors.el.git
fi
