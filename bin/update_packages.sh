#!/bin/sh

set -e

brew update && brew upgrade ;
brew cleanup ;
brew prune ;
gem update ;
gem update --system ;
gem pristine bundler ;
pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U ;
pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U ;
asdf update ;
asdf plugin-update --all ;
dasht-docsets-update
# npm outdated -g --depth=0
npm update -g
