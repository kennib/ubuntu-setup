all: essentials programming shell window-manager

essentials: vim git
programming: build-essentials haskell node
shell: zsh
winodw-manager: xmonad


#
# Essentials
#
vim:
	apt-get install vim
	TEXT_EDITOR=vim
	cp config/.vimrc ~

git: vim
	apt-get install git
	git config --global core.editor vim
	cp config/.gitignore ~
	git config --global core.excludesfile ~/.gitignore


#
# Programming
#
build-essentials:
	apt-get install -y build-essential

haskell: haskell-platform cabal

haskell-platform:
	apt-get install haskell-platform

cabal:
	cabal install cabal-install
	ln ~/.cabal/bin/cabal /usr/bin/cabal -f

node: build-essentials
	wget https://deb.nodesource.com/setup -O /tmp/node-setup | bash /tmp/node-setup
	apt-get install nodejs
	make npm

npm:
	export NODE_PATH="/usr/bin/node"
	wget https://www.npmjs.org/install.sh -O /tmp/npm-setup | bash /tmp/npm-setup


#
# Shell
#
zsh:
	apt-get install zsh
	wget http://install.ohmyz.sh -O /tmp/zsh-setup | bash /tmp/zsh-setup


#
# Window Manager
#
xmonad:
	apt-get install xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev suckless-tools
