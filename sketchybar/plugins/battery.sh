#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"
LOWPOWER="$(pmset -g | grep lowpowermode | cut -c 23)"

COLOR=0xffffffff

if [ "$PERCENTAGE" = "" ]; then
	exit 0
fi

case "${PERCENTAGE}" in
9[0-9] | 100)
	ICON=""
	;;
[6-8][0-9])
	ICON=""
	;;
[3-5][0-9])
	ICON=""
	;;
[1-2][0-9])
	ICON=""
	;;
*) ICON="" ;;
esac

if [[ "$LOWPOWER" == "1" ]]; then
	COLOR=0xffFFE983
fi

if [[ "$CHARGING" != "" ]]; then
	ICON=""
	COLOR=0xff39ff14
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color=${COLOR}
