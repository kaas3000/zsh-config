#!/usr/bin/env zsh

# Init zplug
source ~/.zplug/init.zsh

# Case insensitive matches for autocompletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Oh my zsh git plugin providing git aliases
zplug "plugins/git", from:oh-my-zsh

# Agnoster theme
zplug "agnoster/agnoster-zsh-theme", as:theme

# Fish syntax highlighting for ZSH
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Fish autocomplete for ZSH
zplug "zsh-users/zsh-autosuggestions"

# Fish substring history search for ZSH
zplug "zsh-users/zsh-history-substring-search"

zplug load

