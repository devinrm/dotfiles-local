```bash
----------Give shell scripts the permissions they need--------
chmod +x hello.sh

----------------KILL SERVER-------------------
lsof -i:3000
kill -9 48506

---------------Basic Command Line Editing-------------------
CTRL + L : Clear the screen.
CTRL + W : Delete the word starting at cursor.
CTRL + U : Clear the line i.e. Delete all words from command line.
Up and Down arrow keys : Recall commands (see command history).
Tab : Auto-complete files, directory, command names and much more.
CTRL + R : Search through previously used commands (see command history)
CTRL + C : Cancel currently running commands.
CTRL + T : Swap the last two characters before the cursor.
ESC + T : Swap the last two words before the cursor.
CTRL + H : Delete the letter starting at cursor.

-------Symbolic links-----------
ln -s code/dotfiles/vim/vimrc ~/vimrc
```
