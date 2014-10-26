essentials: vim git

vim:
	apt-get install vim
	TEXT_EDITOR=vim

git: vim
	apt-get install git
	git config --global core.editor vim
