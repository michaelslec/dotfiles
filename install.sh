#!/bin/bash

###########
# Actions #
###########

# Detect if we're in a codespace environment
if [[ -z "$CODESPACES" ]] && [[ -z "$GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN" ]]; then
    echo "Detected regular environment"
    ln -sn "$(pwd)/zshrc" ~/.zshrc
fi

# Write credentials on load if possible
ln -sn "$(pwd)/nvim" ~/.config/nvim
ln -sn "$(pwd)/gitconfig" ~/.gitconfig

