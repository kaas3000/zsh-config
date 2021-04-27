set cfg_dir (status dirname)

source $cfg_dir/git-alias.fish
source $cfg_dir/../alias.zsh

# Disable welcome message
set fish_greeting

# Make sure starship is installed first
set -gx STARSHIP_CONFIG "$cfg_dir/config/starship.toml"
starship init fish | source
