# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[white]%}$current_branch%{$reset_color%}"
  fi
}

setopt promptsubst

# Allow exported PS1 variable to override default prompt.
if ! env | grep -q '^PS1='; then
PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info)
%{$fg_bold[magenta]%}❯ '
fi

# Slick:
# https://crates.io/crates/slick
zle -N zle-keymap-select
zle -N zle-line-init
zmodload zsh/datetime
autoload -Uz add-zsh-hook
add-zsh-hook precmd slick_prompt_precmd
add-zsh-hook preexec slick_prompt_preexec

typeset -g slick_prompt_data
typeset -g slick_prompt_timestamp

SLICK_PATH=$HOME/.cargo/bin/slick

function slick_prompt_refresh {
    local exit_status=$?
    read -r -u $1 slick_prompt_data
    PROMPT=$($SLICK_PATH prompt -k "$KEYMAP" -r $exit_status -d ${slick_prompt_data:-""} -t ${slick_prompt_timestamp:-$EPOCHSECONDS})
    unset slick_prompt_timestamp

    zle reset-prompt

    # Remove the handler and close the fd
    zle -F $1
    exec {1}<&-
}

function zle-line-init zle-keymap-select {
    PROMPT=$($SLICK_PATH prompt -k "$KEYMAP" -d ${slick_prompt_data:-""})
    zle && zle reset-prompt
}

function slick_prompt_precmd() {
    slick_prompt_data=""
    local fd
    exec {fd}< <($SLICK_PATH precmd)
    zle -F $fd slick_prompt_refresh
}

function slick_prompt_preexec() {
    slick_prompt_timestamp=$EPOCHSECONDS
}

export SLICK_PROMPT_ERROR_COLOR=88
export SLICK_PROMPT_GIT_ACTION_COLOR=1
export SLICK_PROMPT_GIT_BRANCH_COLOR=white
export SLICK_PROMPT_GIT_MASTER_BRANCH_COLOR=white
export SLICK_PROMPT_GIT_REMOTE_COLOR=40
export SLICK_PROMPT_GIT_STAGED_COLOR=1
export SLICK_PROMPT_GIT_STATUS_COLOR=cyan
export SLICK_PROMPT_PATH_COLOR=blue
export SLICK_PROMPT_ROOT_COLOR=yellow
export SLICK_PROMPT_ROOT_SYMBOL="#"
export SLICK_PROMPT_SSH_COLOR=green
export SLICK_PROMPT_SYMBOL="❯"
export SLICK_PROMPT_SYMBOL_COLOR=magenta
export SLICK_PROMPT_TIME_ELAPSED_COLOR=1
export SLICK_PROMPT_VICMD_COLOR=red
export SLICK_PROMPT_VICMD_SYMBOL="❮"
