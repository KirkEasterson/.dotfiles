#!/usr/bin/env bash
# requires jq

DISPLAY_CONFIG=($(swaymsg -t get_outputs | jq -r '.[]|"\(.name):\(.current_workspace)"'))

for ROW in "${DISPLAY_CONFIG[@]}"
do
	IFS=':'
	read -ra CONFIG <<< "${ROW}"
	if [ "${CONFIG[0]}" != "null" ] && [ "${CONFIG[1]}" != "null" ]; then
		echo "moving ${CONFIG[1]} right..."
		swaymsg -- workspace --no-auto-back-and-forth "${CONFIG[1]}"
		swaymsg -- move workspace to output right
	fi
done
