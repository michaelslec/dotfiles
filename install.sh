#!/bin/bash
########################################################################
#                 michaelslec's Vim distribution v1.1.1                #
########################################################################


###############
#  Variables  #
###############
dir=~/.dotfiles # dotfiles directory
olddir="/home/$USER/.dotfiles_old/backup_$(date +%m-%d-%y-%R)" # old dotfiles backup directory
files="tmux.conf zprofile zshrc zpreztorc vimrc" # list of files to symlink in homedir
folders="colors" # list of folders to symlink in homedir

installHomebrew=false installzsh=false fontdownload=false installycm=false installtmux=false

###############
#  functions  #
###############

# Installs Prezto configuration framework
function preztoInstall {
  zsh ./zshInstall.sh
}

# Installs Powerline fonts for vim-airline
function powerlineFonts {
if [[ $( uname -s  ) == "Linux" ]]; then
  wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
  mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
  mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

  git clone https://github.com/Lokaltog/powerline-fonts.git patchedFonts
  rm patchedFonts/README.rst
  mv patchedFonts/* ~/.fonts/
  fc-cache -vf ~/.fonts
  rm -rf patchedFonts
elif [[ $( uname -s ) == "Darwin" ]]; then
  git clone https://github.com/Lokaltog/powerline-fonts.git patchedFonts
  rm patchedFonts/README.rst
  mv patchedFonts/* ~/Library/Fonts
  rm -rf patchedFonts
fi
}

# Installs YouCompleteMe
function ycmInstall {
  cd ~/.vim/bundle/YouCompleteMe
  sudo ./install.sh --clang-completer
}

function backup {
  # create dotfiles_old in homedir
  echo -n "Creating $olddir for backup of any existing dotfiles in $HOME ... "
  mkdir -p $olddir
  rm -rf $olddir/*
  echo "Done"

  # change to the dotfiles directory
  echo -n "Changing to the $dir directory... "
  cd $dir
  echo "Done"
  echo ""
}

################################################################################
#                                     MAIN                                     #
################################################################################

# Installs necessities for Linux systems (mainly Ubuntu)
if [[ $( uname -s  ) == "Linux" ]]; then
  if which pacman 2> /dev/null; then
    sudo pacman -S vim make ctags python cmake python-pip zsh tmux --needed
  elif which apt-get 2> /dev/null; then
    sudo apt-get install vim vim-gnome make exuberant-ctags python-dev build-essential cmake python-pip zsh tmux -y
  fi
elif [[ $( uname -s ) == "Darwin" ]]; then
  if which brew 2> /dev/null; then
    brew install macvim --override-system-vim
    brew install wget make zsh tmux python
  else
    while true; do
      read -p "Do you mind if I install Homebrew. I need it for installing dependencies for this Vim distribution: " yn
      case $yn in
          [Yy]* ) installHomebrew=true; break;;
          [Nn]* ) break;;
          * ) echo "Please answer yes or no.";;
      esac
    done

    if [[ $installHomebrew = true ]]; then
      echo "Installing Homebrew ... "
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew install macvim --override-system-vim
      brew install wget make zsh tmux
      echo "Done"
      echo""
    fi
  fi
fi

backup

while true; do
  read -p "Would you like to download the fonts for vim-airline? (Note: If not vim-arline will not look as nice): " yn
  case $yn in
      [Yy]* ) fontdownload=true; break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
  esac
done

while true; do
  read -p "Would you like to install Zsh and Prezto? (I absolutely recommend this. It's absolutely amazing.): " yn
  case $yn in
      [Yy]* ) installzsh=true; break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
  esac
done

while true; do
  read -p "Would you like to use my .tmux.conf? (Note: Yours will be backed up to .dotfiles_old; however, it will be deleted after multiple runs of this script): " yn
  case $yn in
      [Yy]* ) installtmux=true; break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
  esac
done

while true; do
  read -p "Would you like to install ycm?: " yn
  case $yn in
      [Yy]* ) installycm=true; break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
  esac
done

if [[ $fontdownload = true ]]; then
  powerlineFonts
fi

if [[ $installzsh = true ]]; then
  preztoInstall
fi

if [[ -d ~/.vim ]]; then
  echo -n "Backing up ~/.vim ... "
  cp -R ~/.vim $olddir/vim
  echo "Done"
  echo -n "Clearing out ~/.vim ... "
  cd ~/.vim
  ls | grep -v bundle | grep -v UltiSnips | xargs rm -rf
  echo "Done"
else
  mkdir -p ~/.vim
fi

for folder in $folders; do
  echo -n "Creating symlink to $folder in ~/.vim ... "
  ln -s $dir/$folder ~/.vim/$folder
  echo "Done"
  echo ""
done

# Download vundle
if [ ! -d "/home/michael/.vim/bundle/Vundle.vim"  ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [[ $installzsh = false && $installtmux = false ]]; then
  files="vimrc" # list of files to symlink in homedir
elif [[ $installzsh = false && $installtmux = true ]]; then
  files="tmux.conf vimrc" # list of files to symlink in homedir
elif [[ $installzsh = true && $installtmux = false ]]; then
  files="zprofile zshrc zpreztorc vimrc" # list of files to symlink in homedir
fi

for file in $files; do
  if [[ -L ~/.$file ]]; then
    echo -n "Removing $file because it is a symbolic link... "
    rm ~/.$file
    echo "Done"
  elif [[ -f ~/.$file ]]; then
    echo -n "Moving $file from $HOME to $olddir ... "
    mv ~/.$file $olddir
    echo "Done"
  fi
done

echo -n "Adding temp vimrc to \$HOME directory... "
ln -s $dir/files/vimrc.temp ~/.vimrc
echo "Done"

sudo vim +BundleClean +qall!
sudo vim +BundleInstall +qall!

if [[ $installycm = true ]]; then
  ycmInstall
fi

rm ~/.vimrc
for file in $files; do
  echo -n "Creating symbolic link to $file in home directory... "
  ln -s $dir/files/$file ~/.$file
  echo "Done"
  echo ""
done

cd ~/.vim/bundle/vimproc.vim
sudo make
cd $dir

echo "Congratulations! You've just installed my favorite way to code on your computer ;)"
sleep 1
