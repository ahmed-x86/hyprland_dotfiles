#!/usr/bin/env bash
# needs community/pacman-contrib and aur/checkupdates-aur

arch=$(checkupdates | wc -l)
aur=$(yay -Qua | wc -l)
text="$arch | $aur"
tooltip="Repo: $arch\nAUR: $aur"

echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\"}"
