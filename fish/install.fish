#!/usr/bin/env fish
set cfg_dir (dirname (status filename))

if test ! -f $HOME/.config/fish/functions/fisher.fish
    curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
else
    echo "Skip installing Fisher, already installed"
end

if test ! -f $HOME/.config/fish/functions/bass.fish
    fisher install edc/bass
else
    echo "Skip installing edc/bass, already installed"
end

# Install starship (prompt)
if test ! -f /usr/local/bin/starship
    curl -fsSL https://starship.rs/install.sh | bash
else
    echo "Skip installing starship, already installed"
end

# Install "Fast Node Manager"
if ! type fnm &> /dev/null
    curl -fsSL https://fnm.vercel.app/install | bash
    source ~/.config/fish/conf.d/fnm.fish
    fnm completions --shell fish > ~/.config/fish/completions/fnm.fish
end

echo "source ~/.zshconfig/fish/init.fish" > ~/.config/fish/conf.d/kaas3000.fish

source ~/.config/fish/conf.d/kaas3000.fish

/bin/bash $cfg_dir/../vim/install.sh
