## Dotfiles
-----------

*I don't recommend copying my dotfiles wholesale. Cherry-pick from them so you
can learn about what each configuration does.*

Install
-------

Install [rcm](https://github.com/thoughtbot/rcm)

Then clone:

    git clone git://github.com/devinrm/dotfiles.git ~/dotfiles

Install the dotfiles:

env RCRC=$HOME/dotfiles/rcrc rcup

This will create symlinks for config files in your home directory

You can safely run `rcup` multiple times to update:

    rcup

License
-------
This software is free and distributable under the MIT license.
