For FZF.vim
Most commands support CTRL-T / CTRL-X / CTRL-V key bindings to open in a new tab,
a new split, or in a new vertical split

> zoom vim pane
<leader>-
<leader> =

ctrl-w + increase height of current window by 1 line
ctrl-w - decrease height of current window by 1 line
ctrl-w _ maximise height of current window
ctrl-w | maximise width of current window

<leader>gr - replace with register

|:cd|, |:tcd| and |:lcd| to change to another directory

K - look up whatever is in front of cursor in ruby docs

:cq - quit vim with non-zero exit code so you cancel a git commit message edit.

<leader>v - pre-populate a horizontal split command with current directory
<leader>vn - pre-populate a vertical split command with current directory

<leader>tg - search tags in project

[<Space> - add line above cursor
]<Space> - add line below cursor

:6y - yank line 6 from any line

:Lex - split vertical with directory

:Sex - open a hsplit and pick the file

<leader>h -replace ruby hash syntax

<leader>pry - open pry in split

<leader>gr - replace any word with the contens from the system clipboard

griw - go replace inner word

gcip - comment out inner paragraph

, - repeat last f, t, F, or T command, but in opposite direction

; - repeat last f, t, F, or T command

:%s/music/bluegrass/c - search the whole file

:s/prison/cabana/c - search current line

:Greplace - merge the changes

:Gsearch location_here app/**/*.rb spec/**/*.rb

:on - exit all vim splits except for focused

% - matches brackets and def end

<c-w>T - move split into own tab

<Ctrl-x><Ctrl-l> autocomplete whole line

<leader>, - toggle spell check

<leader>a - run all specs

<leader>L - Run last spec

<leader>s - Run nearest spec

c - change highlighted text

c/here - change until you find the word 'here'

cit - change in tag

Ctrl-z - send vim to the background |-- 'fg' brings vim back

Ctrl-w, v for vertical splitting

Ctrl-w, s split window horizontally

d% - delete until the matching 'end'

d25G (delete to line 25)

dap - delete a paragraph

das - delete a sentence

F<char> (f)ind a character backward in a line and move to it

f<char> find a character forward in a line and move to it.

T<char> find a character backward in a line and move un(t)il it

t<char> find a character forward in a line and move un(t)il it (one character
before)

q/ - open search history
