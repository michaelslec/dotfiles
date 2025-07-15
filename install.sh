#!/bin/bash

###########
# Actions #
###########

# Detect if we're in a codespace environment
if [[ -n "$CODESPACES" ]] || [[ -n "$GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN" ]]; then
    echo "Detected GitHub Codespace environment"
    ZSHRC_FILE="bashrc.codespace"
    cat $ZSHRC_FILE >> ~/.bashrc
else
    echo "Detected regular environment"
    ZSHRC_FILE="zshrc"
    ln -sn "$(pwd)/$ZSHRC_FILE" ~/.zshrc
fi

# Write credentials on load if possible
ln -sn "$(pwd)/nvim" ~/.config/nvim
ln -sn "$(pwd)/gitconfig" ~/.gitconfig

# Install Claude Code
npm install -g @anthropic-ai/claude-code

