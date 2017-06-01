.PHONY: help git-config zshrc vimrc i3-config
.DEFAULT_GOAL := help

all: git-config zshrc vimrc i3-config sublime-text-3 mysql-workbench ## Install all packages

git-config: ## Install config files for Git
	assets/git-config.sh

zshrc: ## Install config files for Zsh
	assets/zshrc.sh

vimrc: ## Install config files for vim
	assets/vimrc.sh

i3-config: ## Install config files for i3
	assets/i3-config.sh


sublime-text-3: ## Install config files for Sublime Text 3
	assets/sublime-text-3.sh

mysql-workbench: ## Install patch files for mysql-workbench with i3
	assets/mysql-workbench.sh

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
