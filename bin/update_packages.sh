#!/bin/sh

set -e

brew update && brew upgrade ;
brew cleanup ;
brew prune ;
gem update ;
gem update --system ;
gem pristine bundler ;
gem uninstall fileutils
pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U ;
pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U ;
asdf update ;
asdf plugin-update --all ;
# the asdf python maintainer doesn't update pyenv regularly so this is necessary
cd ~/.asdf/plugins/python/pyenv/ && git pull && cd -
dasht-docsets-update
npm outdated -g --depth=0
npm update -g
# this needs to come last in order to work
pip install 'prompt_toolkit<1.1.0,>=1.0.10'
