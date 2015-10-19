all: git-config \
	zshrc \
	vimrc

git-config:
	assets/git-config.sh

zshrc:
	assets/zshrc.sh

vimrc:
	assets/vimrc.sh
