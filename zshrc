# kitty needs this
PATH="/usr/local/bin:$PATH"
[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

export HOMEBREW_GITHUB_API_TOKEN="f1035918c42a9b60e0d46d35adbbc3c5ad3c056b"

# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol

export AWS_DEFAULT_REGION=us-east-1

# setopt auto_cd
# cdpath=($HOME/code $HOME/code/spree $HOME/code/rails)

export VISUAL=nvim
export EDITOR="$VISUAL"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob \!.git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  rg --files "$1" | with-dir "$1"
}

# Use rg to generate the list for directory completion
_fzf_compgen_dir() {
  rg --files "$1" | only-dir "$1"
}

# Auto-attach new shell sessions in tmux
# _not_inside_tmux() { [[ -z "$TMUX" ]] }
#
# ensure_tmux_is_running() {
#   if _not_inside_tmux; then
#     tat
#   fi
# }
#
# ensure_tmux_is_running

# make nvim the manpager
export MANPAGER="nvim -c 'set ft=man' -"

# Pure: Pretty, minimal and fast ZSH prompt
autoload -U promptinit && promptinit
PURE_PROMPT_SYMBOL='⟩'
prompt pure

# Hub
eval "$(hub alias -s)"

# Git wrapper
export PATH="$HOME/bin:$PATH"

# color man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
