## Dotfiles
===================
Using [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles) as the
foundation of my personal configuration. These files are the `.local`
modifications that build on top of the foundation.

Requirements
------------
*I don't recommend copying my dotfiles wholesale. Cherry-pick from them so you
can learn about what each configuration does.*

Install
-------

Install [rcm](https://github.com/thoughtbot/rcm)

Install Thoughtbot's dotfiles:

    git clone git://github.com/thoughtbot/dotfiles.git
    env RCRC=$HOME/dotfiles/rcrc rcup

Then clone mine:

    git clone git://github.com/devinrm/dotfiles.git ~/dotfiles-local

And re-run rcup to link:

    rcup

This will create symlinks for config files in your home directory from
Thoughtbot's dotfiles and my local customizations.

You can safely run `rcup` multiple times to update:

    rcup

Credits
-------
[Thoughtbot](http://thoughtbot.com).

Chris Toomey

Geoff Harcourt

Ben Orenstein

This software is free and distributable under the MIT license.
