#!/usr/bin/env bash

BASE_ICON="✨"
ON_ICON="${BASE_ICON}✔"
OFF_ICON="${BASE_ICON}✘"

# `docker` isn't in the path for the service
DOCKER_CMD="/usr/local/bin/docker"
OPENWEBUI_CONTAINER_NAME="open-webui"

ollama_id() {
	pgrep ollama
}

start_ollama() {
	ollama serve &
	disown
}

stop_ollama() {
	pkill ollama
}

init_openwebui() {
	$DOCKER_CMD run -d \
		-p 3000:8080 \
		-e WEBUI_AUTH=False \
		-v open-webui:/app/backend/data \
		--name $OPENWEBUI_CONTAINER_NAME \
		ghcr.io/open-webui/open-webui:main-slim
}

start_openwebui() {
	$DOCKER_CMD container start $OPENWEBUI_CONTAINER_NAME
}

stop_openwebui() {
	$DOCKER_CMD container stop $OPENWEBUI_CONTAINER_NAME
}

toggle_ai() {
	if [ -z "$(ollama_id)" ]; then
		start_ollama
		start_openwebui
	else
		stop_ollama
		stop_openwebui
	fi
}

# if a mouse click, then toggle ollama
if [ -n "$BUTTON" ]; then
	toggle_ai
fi

# if ollama is running
if [ -n "$(ollama_id)" ]; then
	ICON="$ON_ICON"
else
	ICON="$OFF_ICON"
fi

sketchybar -m --set "$NAME" icon="$ICON"
