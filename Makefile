all: essentials programming shell

essentials: vim git
programming: build-essentials haskell node
shell: zsh


#
# Essentials
#
vim:
	apt-get install vim
	TEXT_EDITOR=vim

git: vim
	apt-get install git
	git config --global core.editor vim


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
