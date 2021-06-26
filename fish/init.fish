set cfg_dir (dirname (status filename))

source $cfg_dir/git-alias.fish
source $cfg_dir/../alias.zsh

source $cfg_dir/themes/fish_tokyonight_night.fish

# Disable welcome message
set fish_greeting

# Make sure starship is installed first
set -gx STARSHIP_CONFIG "$cfg_dir/config/starship.toml"
starship init fish | source
