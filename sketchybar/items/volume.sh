#!/bin/bash

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=0xff64c1db
  slider.background.height=6
  slider.background.corner_radius=3
  slider.background.color=0xff414550
  slider.knob=􀀁
  slider.knob.drawing=on
)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=10
  # icon=􀊩
  # icon.width=0
  # icon.align=left
  # icon.color=0xffffffff
  # icon.font="$FONT:Regular:14.0"
  # label.width=25
  # label.align=left
  # label.font="$FONT:Regular:14.0"
)

sketchybar --add slider volume right            \
           --set volume "${volume_slider[@]}"   \
           --subscribe volume volume_change     \
                              mouse.clicked     \
                                                \
           --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}"