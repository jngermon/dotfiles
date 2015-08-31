all: git-config \
	zshrc

git-config:
	assets/git-config.sh

zshrc:
	assets/zshrc.sh
