#!/usr/bin/env bash
#
# BY: chadless1
#
# DESCRIPTION:
# stow dotfiles
#

# radio button list of git repos
choices="$(dialog --title "Stow Dotfiles" --stdout --checklist "Select Dotfiles to Stow:" 0 0 0 \
  "shell (bash & tmux)" "" off \
  "vim" "" off \
  "neofetch" "" off \
  "fonts" "" off \
  "ranger" "" off \
)"

clear

# loop through selected repos and clone
for choice in ${choices}; do 
        stow -D ${choice}
done
