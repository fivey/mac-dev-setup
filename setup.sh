#!/usr/bin/env bash

# Setup shortcuts for more readable output
BOLD=$(tput bold)
NORM=$(tput sgr0)

# Install Homebrew if not already present
if [[ ! $(which brew) ]]; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
else
    echo -e "${BOLD}Homebrew${NORM} appears to be installed, skipping..."
fi

# Use Homebrew to install Ansible if not already present
if [[ ! $(which ansible) ]]; then
    brew install ansible
else
    echo -e "${BOLD}Ansible${NORM} appears to be installed, skipping..."
fi

# Now that we have Ansible we can use the playbook for everything else
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml #--ask-become-pass