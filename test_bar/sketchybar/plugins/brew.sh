#!/bin/bash

source "$CONFIG_DIR/colors.sh"

COUNT="$(brew outdated | wc -l | tr -d ' ')"

COLOR=$WHITE

case "$COUNT" in
  [3-5][0-9]) COLOR=$WHITE
  ;;
  [1-2][0-9]) COLOR=$WHITE
  ;;
  [1-9]) COLOR=$WHITE
  ;;
  0) COLOR=$WHITE
     COUNT=􀆅
  ;;
esac

sketchybar --set $NAME label=$COUNT icon.color=$COLOR
