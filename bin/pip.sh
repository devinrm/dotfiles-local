#!/bin/sh

set -e

pip2 install neovim ;
pip3 install neovim ;
pip install yamllint ;
pip2 install awscli --upgrade ;
pip3 install awscli --upgrade ;
pip install solargraph-utils.py ;
pip install pgcli ;
pip install --upgrade pip ;
pip2 install --upgrade pip ;
pip3 install --upgrade pip ;
pip install 'prompt_toolkit<1.1.0,>=1.0.10'
