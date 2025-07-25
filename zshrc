alias vi="nvim"
alias vim="nvim"
alias dcl="dc logs -f --tail 100"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# rbenv initialization
export RBENV_ROOT="$HOME/.rbenv"
[[ -d $RBENV_ROOT/bin ]] && export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
### MANAGED BY LOCAL SETUP IRVR START (DO NOT EDIT)
source /Users/michael/projects/web/src/frontend/reactNativeApp/ios/scripts/rvr/aliases.sh
### MANAGED BY LOCAL SETUP IRVR END (DO NOT EDIT)
# Android Studio initialization
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home" # Installed along with Android Studio

export PATH="$HOME/.local/bin:$PATH"
