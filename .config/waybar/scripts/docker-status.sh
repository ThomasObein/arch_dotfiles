#!/bin/bash

DOCKER_BIN=$(which docker)

if ! $DOCKER_BIN ps > /dev/null 2>&1; then
    echo '{"text": "  !", "tooltip": "Docker service not running", "class": "error"}'
    exit 0
fi

count=$($DOCKER_BIN ps -q | wc -l)

text="  $count"

if [ "$count" -gt 0 ]; then
    tooltip=$($DOCKER_BIN ps --format "{{.Names}} ({{.Image}})")
else
    tooltip="Aucun conteneur actif"
fi

jq -cn --arg txt "$text" --arg tip "$tooltip" \
    '{"text": $txt, "tooltip": $tip, "class": "docker"}'