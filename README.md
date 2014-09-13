# Dotfiles:
These are all of my dotfiles I use on my current Ubuntu system. I usually go
through phases of coding and development and then back to gaming, so updates may
come infrequently at times. Please submit any issues! I'm always willing to
help.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
# Contents

- [Installation:](#installation)
- [Zsh:](#zsh)
  - [Color Schemes](#color-schemes)
  - [Activated Plugins](#activated-plugins)
- [Vim:](#vim)
  - [Color Schemes](#color-schemes-1)
  - [Plugins](#plugins)
- [A Note to Users](#a-note-to-users)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
# Installation:
1. Run this command in your terminal:

        git pull https://github.com/michaelslec/dotfiles.git ~/.dotfiles

2. Next, cd in to the ~/.dotfiles directory:

        cd ~/.dotfiles

3. Give the install script executable rights:

        sudo chmod 744 install.sh zshInstall.sh

4. Finally, run the install script and follow the dialog (It is recommended that you say "yes" to all dialogs for first time install):

        ./install.sh

# Zsh:
This Zsh is almost completely the doing of
[Prezto](http://github.com/sorin-ionescu/prezto). I have only modified a few
things in the zpreztorc and the .zshrc.

## Color Schemes
This Zsh is based of the [Prezto configuration
framework](http://github.com/sorin-ionescu/prezto). All themes can be found by
executing the following command: prompt -l. You can preview a theme by
executing: prompt -p name. The default theme I have set is nicoulaj.

## Activated Plugins
The [Prezto configuration
framework](http://github.com/sorin-ionescu/prezto) has many built in plugins,
all of which can be found
[here](http://github.com/sorin-ionescu/prezto/tree/master/modules). The plugins
I have activated are:

1.  [utility](https://github.com/sorin-ionescu/prezto/tree/master/modules/utility)
2.  [completion](https://github.com/sorin-ionescu/prezto/tree/master/modules/completion)
3.  [ssh](https://github.com/sorin-ionescu/prezto/tree/master/modules/ssh)
4.  [tmux](https://github.com/sorin-ionescu/prezto/tree/master/modules/tmux)
5.  [environment](https://github.com/sorin-ionescu/prezto/tree/master/modules/environment)
6.  [terminal](https://github.com/sorin-ionescu/prezto/tree/master/modules/terminal)
7.  [editor](https://github.com/sorin-ionescu/prezto/tree/master/modules/editor)
8.  [history](https://github.com/sorin-ionescu/prezto/tree/master/modules/history)
9.  [directory](https://github.com/sorin-ionescu/prezto/tree/master/modules/directory)
10. [spectrum](https://github.com/sorin-ionescu/prezto/tree/master/modules/spectrum)
11. [utility](https://github.com/sorin-ionescu/prezto/tree/master/modules/utility)
12. [completion](https://github.com/sorin-ionescu/prezto/tree/master/modules/completion)
13. [syntax-highlighting](https://github.com/sorin-ionescu/prezto/tree/master/modules/syntax-highlighting)
14. [history-substring-search](https://github.com/sorin-ionescu/prezto/tree/master/modules/history-substring-search)
15. [prompt](https://github.com/sorin-ionescu/prezto/tree/master/modules/prompt)

# Vim:
This vim is written completely from scratch. The vimrc is organized in to the
categores that are used in the Vim help section. All settings are documented
and, if needed, you can reference them in the Vim help.

## Color Schemes
This distribution of Vim is packaged with four color schemes. They are:

1. Solarized
2. Codeschool
3. desert256
4. lucius

## Plugins
* ###[DelimitMate](http://github.com/Raimondi/delimitMate)
Provides automatic closing of quotes, parenthesis, brackets, etc.

* ###[UltiSnips](http://github.com/SirVer/ultisnips)
Adds snippets to vim.

* ###[YouCompleteMe](http://github.com/Valloric/YouCompleteMe)
A fast, as-you-type, fuzzy-search code completion engine for Vim.

* ###[vim-snippets](http://github.com/honza/vim-snippets)
Default snippets for UltiSnips.

* ###[Syntastic](http://github.com/scrooloose/syntastic)
A syntax checking plugin for Vim that runs files through external syntax
checkers and displays any resulting errors to the user.

* ###[vim-multiple-cursors](http://github.com/terryma/vim-multiple-cursors)
Adds Sublime Text's multi-cursor functionality to Vim.

* ###[tcomment_vim](http://github.com/tomtom/tcomment_vim)
tcomment provides easy to use, file-type sensible comments for Vim. It
can handle embedded syntax.

* ###[vim-surround](http://github.com/tpope/vim-surround)
Provides mappings to easily delete, change and add such surroundings in pairs.

* ###[vim-gitgutter](http://github.com/airblade/vim-gitgutter)
A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows
whether each line has been added, modified, and where lines have been removed.
You can also stage and revert individual hunks.

* ###[vim-protodef](http://github.com/derekwyatt/vim-protodef)
Pulls C++ ptototypes into the implementation file.

* ###[vim-bufonly](http://github.com/duff/vim-bufonly)
Unloads all buffers but the current one.

* ###[vim-easymotion](http://github.com/Lokaltog/vim-easymotion)
Provides a much simpler way to use some motions in vim.

* ###[vim-fugitive](http://github.com/tpope/vim-fugitive)
A Git wrapper for Vim, allowing you to easily access and use Git's features
within Vim.

* ###[vim-tmux-navigator](http://github.com/christoomey/vim-tmux-navigator)
When combined with a set of tmux key bindings, the plugin will allow you to
navigate seamlessly between vim and tmux splits using a consistent set of
hotkeys.

* ###[vim-fswitch](http://github.com/derekwyatt/vim-fswitch)
This Vim plugin will help switching between companion files (e.g. ".h" and
".cpp" files).

* ###[ctrlp](http://github.com/kien/ctrlp.vim)
Full path fuzzy file, buffer, mru, tag, ... finder for Vim.

* ###[vim-colors-solarized](http://github.com/altercation/vim-colors-solarized)
Solarized Colorscheme for Vim.

* ###[vim-cpp-enhanced-highlight](http://github.com/octol/vim-cpp-enhanced-highlight)
Additional syntax highlighting that I use for my C++11/14
development in Vim.

* ###[vim-airline](http://github.com/bling/vim-airline)
Lean & mean status/tabline for vim that's light as air.

* ###[colour-schemes](http://github.com/daylerees/colour-schemes)
A number of themes for some popular text editors that will hopefully be pleasing
to your eyes and allow you to enjoy the time you spend in front of the screen.

# A Note to Users
If you are running a text editor or terminal emulator of some kind that,
for whatever reason, does not support the patched fonts provided by
Powerline, please use one of the patched fonts provided by my install
script. Simply change your font to any font that has "for powerline" in the
name. This should fix the issue. If not, feel free to message me! I'm
always willing to help. Thank you!
