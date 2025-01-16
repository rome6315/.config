#!/usr/bin/env bash

# pass the highlighted word into the word variable
word=${1:-$(wl-paste --primary)}

# lookup the definition of the word variable
query=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")

# check if the api returned an error (empty string)
[ -z "$query" ] && notify-send -h string:bgcolor:#bf616a -t 3000 "Invalid word." && exit 0

# show only first 3 definitions by parsing the json with jq
def=$(echo "$query" | jq -r '[.[].meanings[] | {pos: .partOfSpeech, def: .definitions[].definition}] | .[:3].[] | "\n\(.pos). \(.def)"')

# output the word and definition(s) using a 20 second notification pop-up
notify-send -t 20000 "$word -" "$def"
