#!/bin/bash

# Icons for Catppuccin Mocha look
PLAY_ICON="󰐊"
PAUSE_ICON="󰏤"
STOP_ICON="󰓛"

while true; do
    # Get current status
    STATE=$(mpc status %state%)
    SONG=$(mpc current)

    if [ -z "$SONG" ]; then
        echo "$STOP_ICON Stopped"
    elif [ "$STATE" == "playing" ]; then
        echo "$PLAY_ICON $SONG"
    elif [ "$STATE" == "paused" ]; then
        echo "$PAUSE_ICON $SONG"
    fi

    # Crucial: Wait for the next change
    mpc idle player > /dev/null
done
