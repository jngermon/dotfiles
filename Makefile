all: git-config \
	zshrc \
	vimrc \
	i3-config

git-config:
	assets/git-config.sh

zshrc:
	assets/zshrc.sh

vimrc:
	assets/vimrc.sh

i3-config:
	assets/i3-config.sh
