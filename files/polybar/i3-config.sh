PROFILE=$(head ~/.dotfiles/files/keyboard/current)
KBMAP=$(setxkbmap -query | grep layout | awk '{print $2}')
echo "$PROFILE - $KBMAP"
