#!/usr/bin/env zsh

# Make zsh a requirement for this script
if [ ! -x $(which zsh) ]
then
	echo "This script requires the ZSH shell"
	exit 1
fi

# install plugin manager
echo "installing zplug plugin manager"
curl -sL --proto-redir -all,\
	https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Add current file to vim config
define(){ IFS='\n' read -r -d '' ${1} || true; }
define LOADCONFIGSCRIPT <<EOF


# Load "https://github.com/kaas3000/zsh-config" zsh configuration
source $PWD/init.zsh
EOF

echo "$LOADCONFIGSCRIPT" >> ~/.zshrc

# echo "The plugins will now be automatically installed"
echo "loading new zsh configuration"
source ~/.zshrc

zplug install 

echo "ZSH setup done!"

