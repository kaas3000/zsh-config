#!/usr/bin/env fish
curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher

fisher install edc/bass

# Install starship (prompt)
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Install "Fast Node Manager"
curl -fsSL https://fnm.vercel.app/install | bash
fnm completions --shell fish > ~/.config/fish/completions/fnm.fish
