#!/bin/sh

set -e

brew update && brew upgrade ;
brew cleanup ;
gem update ;
gem update --system ;
gem uninstall fileutils
pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U ;
pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U ;
npm outdated -g
npm update -g
