#!/bin/bash

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_cask="dropbox skype telegram-desktop shiftit vagrant virtualbox lastpass vlc google-chrome"
brew install `echo $brew_cask | awk '{for(o=1;o<=NF;o++){print "Caskroom/cask/"$o}}'`

brew_pkgs="go gnu-tar vim graphviz bash-completion watch"
brew install $brew_pkgs

# Font
(cd ~/Downloads; curl -L https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip > adobe-source-code-pro.zip)

# VIM

## Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## Syntastic
(cd ~/.vim/bundle; git clone --depth=1 https://github.com/vim-syntastic/syntastic.git)

## Monochrome
mkdir ~/.vim/colors
(cd ~/.vim/colors; curl -LO https://raw.githubusercontent.com/fxn/vim-monochrome/master/colors/monochrome.vim)

## vimrc
curl -LSso ~/.vimrc https://raw.githubusercontent.com/gsilos/dotfiles/master/vimrc

## vim-go
mkdir ~/go
(cd ~/.vim/bundle; git clone --depth=1 https://github.com/fatih/vim-go.git)
(cd ~/.vim/bundle/vim-go; git checkout --force master; git pull --tags; git checkout v1.11)
GOPATH=~/go vim -c GoInstallBinaries -c q

# Bash profile, Python rc
curl -LSso ~/.bash_profile https://raw.githubusercontent.com/gsilos/dotfiles/master/bash_profile
curl -LSso ~/.pyrc https://raw.githubusercontent.com/gsilos/dotfiles/master/pyrc
