#!/bin/sh

brew update && brew upgrade ;
gem update ;
npm outdated -g --depth=0 && npm update -g ;
pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U ;
pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U
