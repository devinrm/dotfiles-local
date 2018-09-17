# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# completion
autoload -U compinit
compinit

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
