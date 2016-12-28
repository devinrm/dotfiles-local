#!/bin/sh

cd ~/code/spree/spreeworks || exit

tmux new -s work -d 'nvim'
tmux neww
tmux split-window -h -p 50
tmux neww
tmux split-window -h -p 50
tmux attach -t work
