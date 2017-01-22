g-t - next tab
g-T - previous tab

<F5> - open html file in browser

ctrl-o - jump to previous file

SAVE
:wa - write all changed files (save all changes), and keep working

:xa - exit all (save all changes and close Vim)

:qa - quit all (close Vim, but not if there are unsaved changes)

:qa! - quit all (close Vim without saving—discard any changes)

MKDIR.vim:
:e this/does/not/exist/file.txt

DELETE / CHANGE

Shift-V, gg, d: To delete many lines (enter line number you wish to delete to first)

x - delete character

de  Delete to the end of the current word

d2e  Delete to the end of next word

dj  Delete down a line (current and one below)

dt)  Delete up until next closing parenthesis

d/world  Delete up until the first search match for "world"

di'  delete inside single quotes

Line count motion: d2j (delete down two lines)

Line-based operation with count: 4dd (4 times, delete line)

Absolute line numbers: d25G (delete to line 25)

Paragraph motions: dip or dap (delete inner-paragraph or "a-paragraph")

diw - (delete inner-word).

caw  change a word

**Surround.vim**
In the following mappings, <character> can be any of [,  [,  (,  ),  ",  ',  `,  {,  }.

ds<character> - Delete surrounding <character>

cs<character><new character> - Replace surrounding <character> with <new character>

ys<text-obj><character> - Surround text-object with <character>

dst - Delete surround tag (works on HTML tags)

Note Surround.vim can even change surrounding HTML tags. The syntax begins with cst, then waits for you to specify a tag (including the open angle bracket). So a complete command might look like cst<h3> to change the surrounding tag to an <h3> tag.

SEARCH
:e .   - to open Netrw on Vim's current working directory, and then all your normal motions apply. Use <cr> to edit the file under your cursor.

/ search

n - repeat last search

N - repeat last search in opposite direction

:Ag.vim
e    to open file and close the quickfix window
o    to open (same as enter)
go   to preview file (open but maintain focus on ag.vim results)
t    to open in new tab
T    to open in new tab silently
h    to open in horizontal split
H    to open in horizontal split silently
v    to open in vertical split
gv   to open in vertical split silently
q    to close the quickfix window

**Ctrl-p**
Press <c-f> and <c-b> to cycle between modes.

Press <c-d> to switch to filename only search instead of full path.

Press <c-r> to switch to regexp mode.

Use <c-j>, <c-k> or the arrow keys to navigate the result list.

Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.

Use <c-n>, <c-p> to select the next/previous string in the prompt's history.

Use <c-y> to create a new file and its parent directories.

Use <c-z> to mark/unmark multiple files and <c-o> to open them.

MOVEMENT
w - move forward one (w)ord

b - move (b)ackward one word

e - move forward to the (e)nd a word

o - opens a line BELOW the cursor and places the cursor on the open line in insert state.

O - opens the line ABOVE the line the cursor is on.

a - to insert text AFTER the character the cursor is on.

A - automatically appends text to the end of the line.

R  - enters Replace mode until  <ESC>  is pressed to exit.

H, M, L - move (H)igh, (M)iddle, or (L)ow within the viewport

C-u, C-d move (u)p or (d)own

<NN>G - (G)o to line number NN (useful if you have a failing test on a given line) i.e. 19G

TMUX Navigator
C-h, C-j, C-k, and C-l ---navigate windows

Vim TMUX Runner
:VtrSendLinesToRunner - Send across the current line or visually selected range of lines to the tmux pane for evaluation.

:VtrAttachToPane - Prompt for the pane number to which Vim Tmux Runner should attach and send future commands.

:VtrSendCommand - Send a specific command, e.g. bundle exec rake.

:VtrSendFile - Evaluate the current file with its default executable.

:VtrFocusRunner - Make the tmux runner pane active and zoom it. Useful for review test failure output.

:VtrOpenRunner [{optional-config}] - Opens a tmux pane and attaches the plugin to it. You can optionally provide a configuration specifying the orientation, size, and initial command for the pane.

TBONE.vim
:Tmux - lets you call any old tmux command (with really good tab complete).

:Tyank and :Tput - give you direct access to tmux buffers.

:Twrite - sends a chunk of text to another pane. Give an argument like windowtitle.2, top-right, or last, or let it default to the previously given argument.

:Tattach lets you use a specific tmux session from outside of it.

Commentary.vim
gc2j - Comment down two lines

gcc - Comment out the current line

gcip - Comment out the current paragraph

RAILS.vim
:A - Open the "alternate" file of the current (spec for model, etc)

:AV - Open the "alternate" file in a vertical split

:RModel <tab> - Tab complete to open models by name

:RController <tab> - Tab complete to open models by name

:Rextract (visual) - Extract visual selection to a partial, replace with render

In addition to the above commands, Rails.vim has a number of other tricks up it's sleeve including updating Vim's file lookup path to support navigating to views with gf, Rails specific syntax highlighting, and a host more. Check out :h rails<cr> for a more complete listing.

VISUAL BLOCK MODE (Ctrl-v)
d, or x - Delete the visual block selection

c - Change

r - Replace all characters in the block with the next character you type

I - Insert text before the block

A - Insert text after the block

>ip - indent paragraph

zz - Center the current line within the window

zt - Bring the current line to the top of the window

zb - Bring the current line to the bottom of the window

:tabnew - Open a new tab

:tabedit <filename> - Edit the file with the provided name in a new tab

gt - Go to next tab (wraps around to beginning)

gT - Go to previous tab (wraps around to end)

<C-w>T - Break the current window out to a new tab

:new [filename] Open a new window above the current window

:vnew [filename] Open a new window beside the current window

:split <filename> Edit the specified file in new window above the current window

:vsplit <filename> Edit the specified file in new window beside the current window

<C-w> h, j, k, l - Navigate to the window in the given direction (<C-w>j navigates down)

<C-w> H, J, K, L - Move the current window in the given direction (<C-w>J moves it down)

[count] <C-w>-   -- Decrease the height of the current window by count

[count]<C-w>+  -- Increase the height of the current window by count

[count]<C-w>< - Decrease the width of the current window by count

[count]<C-w>> - Increase the width of the current window by count

<C-w>=  -- Equalize the width and height of all windows

. command in Vim repeats the last "change" command.

iw, aw - "inner word", "a word" (a word includes the space)

ip, ap - "inner paragraph", "a paragraph" ("a" includes the newline)

i), a) - "inner parenthesis", "a parenthesis" (includes the parens)

i', a' - "inner single quote", "a single quote" (includes the quotes)

i", a" - "inner double quote", "a double quote" (includes the quotes)

it, at - "inner tag", "a tag" (includes the open and closing tag)

ctrl-r - redo

f<char> (f)ind a character forward in a line and move to it

t<char> find a character forward in a line and move un(t)il it (one character before)

F<char>(f)ind a character backward in a line and move to it

T<char>find a character backward in a line and move un(t)il it

; repeat last f, t, F, or T command

, repeat last f, t, F, or T command, but in opposite direction

d  Delete

c  Change

y  Yank (copy)

v  Visually select

>, <	indent, dedent

=  reformat (reindent, break long lines, etc)

{ The simplest commands are made by simply repeating the operator a second time to act on the current line. For example, where d is the operator for "delete", dd will delete the whole line. Each of yy, cc, >>, == behave similarly. }

:%s/$/,/ - Add a comma to every line in vim
