#!/bin/sh

sketchybar --add item front_app left \
           --set front_app icon.background.drawing=on script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched