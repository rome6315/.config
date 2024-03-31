#!/usr/bin/env bash

MY_CITY="Pittsburgh,US"

ERROR_PREFIXES=(
  "Sorry, "
  "Unknown"
)

WAYBAR_WEATHER_JSON_TEXT=$(curl 'wttr.in/?m&format=%t')

for ERROR_PREFIX in "${ERROR_PREFIXES[@]}"; do
	if [[ "$WAYBAR_WEATHER_JSON_TEXT" == *"$ERROR_PREFIX"* ]]; then
		WAYBAR_WEATHER_JSON_TEXT="$(ansiweather -l 'Pittsburgh' -a false -w false -i false -h false -p false -s false -d false | sed -e 's/[ \t]*Weather.*://g'| tr -d '[:space:]')"
		WAYBAR_WEATHER_JSON_TOOLTIP=""
		WAYBAR_WEATHER_JSON_CLASS=""
		WAYBAR_WEATHER_JSON_ICON=""
		WAYBAR_WEATHER_DONE=1
		break
	fi
done

if [[ -z ${WAYBAR_WEATHER_DONE} ]]; then
	WAYBAR_WEATHER_JSON_TOOLTIP=$(curl 'wttr.in/?m&format=%t+%C+%c')
	WAYBAR_WEATHER_JSON_CLASS=$(curl 'wttr.in/?m&format=%C')
	WAYBAR_WEATHER_JSON_ICON=$(curl 'wttr.in/?m&format=%c')

	# Strip strings:
	WAYBAR_WEATHER_JSON_CLASS=$(sed -e 's/ //'<<<"$WAYBAR_WEATHER_JSON_CLASS")
	WAYBAR_WEATHER_JSON_TEXT=$(sed -e 's/C//'<<<"$WAYBAR_WEATHER_JSON_TEXT")
	ICON="${WAYBAR_WEATHER_JSON_ICON::1}"

	# Set fontawesome icons:
	if [[ $WAYBAR_WEATHER_JSON_CLASS == "Fog" ]]; then
			ICON=""
	elif [[ $WAYBAR_WEATHER_JSON_CLASS == "Mist" ]]; then
			ICON=""
	elif [[ $WAYBAR_WEATHER_JSON_CLASS == "Partlycloudy" ]]; then
			ICON=""
	elif [[ $WAYBAR_WEATHER_JSON_CLASS == "Sunny" ]]; then
			ICON=""
	fi
	WAYBAR_WEATHER_JSON_TEXT="${WAYBAR_WEATHER_JSON_TEXT}${ICON}"
fi

WAYBAR_WEATHER_JSON="{
		\"text\":\"${WAYBAR_WEATHER_JSON_TEXT}\",
		\"tooltip\":\"${WAYBAR_WEATHER_JSON_TOOLTIP}\",
		\"class\":\"${WAYBAR_WEATHER_JSON_CLASS}\",
		\"icon\":\"${WAYBAR_WEATHER_JSON_ICON}\"
}\n"

echo $WAYBAR_WEATHER_JSON
