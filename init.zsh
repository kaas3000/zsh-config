#!/usr/bin/env zsh

# Add leinigen zsh completions (clojure package manager)
source $KAAS3000ZSHROOT/completions/lein_completion.zsh

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Init zplug
source ~/.zplug/init.zsh

# Case insensitive matches for autocompletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Oh my zsh git plugin providing git aliases
zplug "plugins/git", from:oh-my-zsh

# Docker/docker-compose autocompletion
zplug "plugins/docker", from:oh-my-zsh

# # Agnoster theme
# zplug "agnoster/agnoster-zsh-theme", as:theme

# Fish syntax highlighting for ZSH
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Fish autocomplete for ZSH
zplug "zsh-users/zsh-autosuggestions"

# Fish substring history search for ZSH
zplug "zsh-users/zsh-history-substring-search"

zplug load

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Enable starship prompt
eval "$(starship init zsh)"

# Jump words using ctrl+arrow keys
bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
bindkey '^[[3~' kill-word

# Enable home/end keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Search through history using up/down keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source $KAAS3000ZSHROOT/alias.zsh

