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

# Add current file to ~/.zshrc
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

echo "ZSH plugins are installed"
echo "This configuration makes use of powerline.\n The script will now install compatible fonts."
# Clone powerline fonts
cd $(mktemp -d)
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

echo "ZSH setup done!"
echo "(Don't forget to set your terminal font to a powerline patched font. See https://github.com/powerline/fonts#font-families for available fonts)"

