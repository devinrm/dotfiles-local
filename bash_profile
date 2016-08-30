export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

DIR_COLOR="\[\e[0;32m\]"
GIT_BRANCH_COLOR="\[\e[0;36m\]"
GIT_CLEAN_COLOR="\[\e[1;32m\]"
GIT_DIRTY_COLOR="\[\e[0;31m\]"
PROMPT_COLOR="\[\033[38;5;172m\]"
RESET_COLOR="\[\e[0m\]"
PROMPT_CHARACTER="ℵ"

function __git_branch_status {
    if $(__git_repo_initialized); then
        if [[ -z $(git status -s) ]]; then
            echo -e "$GIT_CLEAN_COLOR ✔"
        else
            echo -e "$GIT_DIRTY_COLOR ✗"
        fi
    fi
}

function __git_repo_initialized {
  git ls-files >& /dev/null
}

function __git_branch_name {
    if $(__git_repo_initialized); then
        git symbolic-ref --short -q HEAD
    fi
}

function __prompt_command {
    PS1="$DIR_COLOR\w $GIT_BRANCH_COLOR$(__git_branch_name)$(__git_branch_status)$RESET_COLOR\n$PROMPT_COLOR$PROMPT_CHARACTER $RESET_COLOR"
}

PROMPT_COMMAND=__prompt_command