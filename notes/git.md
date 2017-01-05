gv.vim
Commands

    :GV to open commit browser
        You can pass git log options to the command, e.g. :GV -S foobar.
    :GV! will only list commits that affected the current file
    :GV? fills the location list with the revisions of the current file

:GV or :GV? can be used in visual mode to track the changes in the selected lines.
Mappings

    o or <cr> on a commit to display the content of it
    o or <cr> on commits to display the diff in the range
    O opens a new tab instead
    gb for :Gbrowse
    ]] and [[ to move between commits
    . to start command-line with :Git [CURSOR] SHA à la fugitive
    q to close

Add SSH key to keychain:
ssh-add -K ~/.ssh/id_rsa

THOUGHTBOT WORKFLOW
  Start with a branch:         co -d <branch>
  Check git diff before push:  Gdiff master
  Push up PR with tracking:    push -u origin <branch>
  Open pr:                     pr or hub pull-request
  Rebase for FF merge          mup
  Interactive Rebase           rebase -i master
  Force push branch            pf
  Merge ff                     co master
                               merge -
  Push master                  push
  Delete local branch          branch -d <branch>
  Delete remote branch         push origin -d <branch>

create-branch: alias to create feature branches.
delete-branch: alias to delete feature branches.
merge-branch: alias to merge feature branches into master.
up: alias to fetch and rebase origin/master into the feature branch. Use git up -i for interactive rebases.
git-churn: to show churn for the files changed in the branch.
Adds post-{checkout,commit,merge} hooks to re-index your ctags.
Adds pre-commit and prepare-commit-msg stubs that delegate to your local config.

GIT MUP
g mup (checks out master, pulls, then checks back out our feature branch)

GIT FETCH
g fall (git fetch --all [fetch all remotes in one single command]

CANONICAL URLS AND HIGHLIGHTING LINES
press 'y' and GitHub will reload the page and replace the branch reference with
the relevant commit

GIT UPSTREAM
g upstream (Focusing on the current branch, we can ask Git specifically for the
remote tracking branch.)

HUB BROWSE
g browse (opens the GitHub remote repo for the current local repo.)

HUB COMPARE
g compare (open the GitHub repo associated with the current local repo, but on
the GitHub Compare Page.)

HUB PULL REQUEST
g pull-request (The pull-request command allows us to compose our pull request
title and description locally, just like we would with a commit message.)

HUB CI-STATUS
g ci-status (see the current status for our CI build.)

GIT MERGE
git mg (git merge --ff-only feature)

GIT REBASE(Rebase can be performed when we have new commits on both our feature
branch, and our "upstream" branch (typically master). We want to update the
commits on our branch so they include the changes on master.)
git rebase master
git rebase --interactve master

GIT STASH
git stash -u  (include untracked file in your git stash)

GIT REFLOG
git reflog (Lists commit and operation for every change)

git reflog table-name (shows just the commits for that specific table)

GIT RESET
git reset --hard 09682a4 (restore branch to a previous commit)

GIT UNCOMMIT
git uncommit (git reset --soft HEAD^) - This will undo the an entire commit.
i.e. remove the commit from our history and revert to the point at which the
file were staged (with the changes captured in the commit)
This has the effect of undoing the commit, taking us back to just before we made
it. Note that it leaves our changes staged in the index.

*** :cq - quit vim with non-zero exit code so you cancel a git commit message
edit. ***

GIT LOG
git log (show all commits)

git l (pretty colored log)

git sla (short log all)

git log --oneline -- Gemfile (see the log for every change that modified the Gemfile)

git glog 'search term' - grep (grep through git log)

GIT ADD
git aa = add --all

GIT PATCH
git ap - add --patch

GIT BRANCH
git branch branch-name (create branch)
git branches (view all branches)
git branch -d <branch_name> - delete git branch locally
git branch -dr <branch_name> - delete git branch remotely
git branch -vv (see the data about our local and remote branches, as well as the
relationships between them)

GIT CHECKOUT
git co

GIT PUSH --force-with-lease
git pf

VIMDIFF
git vdf

GIT STATUS
git st

GIT COMMIT -v
git ci (open commit message in vim)

git commit --amend (amend commit)

git car = git commit --amend --no-edit (use no-edit flag when you don't need to
edit commit message of amended commit)

GIT BLAME
git blame Gemfile - see the most recent commit that modified a given line, for every line in the file.

GIT SHOW
git show 770b1ab6 (display the commit info and a diff on the changes the commit introduced)

GIT UNSTAGE
git unstage todo.md (remove staged file if we don't want to commit all)
