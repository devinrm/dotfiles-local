```bash
* Moving

Ctrl-a
Move to the start of the current line.

Ctrl-e
Move to the end of the line.

Ctrl-f
Move forward a character.

Ctrl-b
Move back a character.

Alt-f
Move forward to the end of the next word. Words are alphanumeric.

Alt-b
Move back to the start of the current or previous word. Words are alphanumeric.

Ctrl-l
Clear the screen.

* History

Ctrl-p
Fetch the previous command from the history list.

Ctrl-n
Fetch the next command from the history list.

Alt-<
Move to the first line in the history.

Alt->
Move to the last line in the history.

Ctrl-r
Search backward through history.

Ctrl-s
Search forward through history.

Alt-p
Search backward through history for a given string.

Alt-n
Search forward through history for a given string.

Ctrl-Alt-y
Insert the first argument to the previous command. With an argument n, insert the nth word from the previous command.

Alt-.
Alt-_
Insert the last argument to the previous command. With an argument n, insert the nth word from the previous command.

* Changing Text

Ctrl-d
Delete the character under the cursor.

Delete
Delete the character before the cursor.

Ctrl-v
Ctrl-q
Add the next character you type verbatim.

Ctrl-t
Transpose characters.

Alt-t
Transpose words.

Alt-u
Uppercase the current word.

Alt-l
Lowercase the current word.

Alt-c
Capitalize the current word.

* Killing and Yanking (Cutting and Pasting)

Ctrl-k
Kill (cut) forwards to the end of the line.

Ctrl-u
Ctrl-x Delete
Kill (cut) backwards to the start of the line.

Alt-d
Kill (cut) forwards to the end of the current word.

Alt-Delete
Ctrl-w
Kill (cut) backwards to the start of the current word.

Alt-\
Delete whitespace around the cursor.

Ctrl-y
Yank (paste) the top of the kill ring.

Alt-y
Rotate the kill ring, and yank (paste) the new top. Only works after a yank.

* Completing

Tab
Autocomplete.

Alt-?
List possible completions.

Alt-*
Insert possible completions.

* Macros

Ctrl-x (
Begin saving the characters typed as a macro.

Ctrl-x )
Stop saving the characters typed as a macro.

Ctrl-x e
Execute the most recent macro.

* Miscellaneous

Ctrl-x Ctrl-r
Read in the contents of the inputrc file.

Ctrl-g
Abort current editing command

Ctrl-_
Ctrl-x Ctrl-u
Incremental undo, separately remembered for each line.

Alt-r
Undo all changes made to this line. This is like executing the undo command enough times to return the line to its initial state.

Alt-Space
Ctrl-@
Set the mark (save this location).

Ctrl-x Ctrl-x
Set the mark and jump to the previous mark.

Ctrl-]
Search forwards for a single character in the current line and jump to that location.

Ctrl-Alt-]
Search backwards for a single character in the current line and jump to that location.

Alt-#
Comment the current line and start a new one.

Ctrl-e
Enter Emacs editing mode

Ctrl-Alt-j
Enter Vi editing modeilling and Yanking (Cutting and Pasting)
```
