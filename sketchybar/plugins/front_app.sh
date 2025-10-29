#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting
source ./helpers/icon_map.sh

if [ "$SENDER" = "front_app_switched" ]; then
	__icon_map "$INFO"
	sketchybar --set "$NAME" label="${icon_result}"
	sketchybar --set front_app_label label="${INFO}"
fi
