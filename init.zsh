#!/usr/bin/env zsh

# Don't share history between sessions
setopt no_share_history
unsetopt share_history

# Init zplug
source ~/.zplug/init.zsh

# Oh my zsh git plugin providing git aliases
zplug "plugins/git", from:oh-my-zsh

# Agnoster theme
zplug "agnoster/agnoster-zsh-theme", as:theme

# Fish syntax highlighting for ZSH
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Fish autocomplete for ZSH
zplug "zsh-users/zsh-autosuggestions"

zplug load

