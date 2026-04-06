#!/bin/bash

# 1. Terminal Relaunch (as before)
if [ ! -t 0 ]; then
    for term in kitty; do
        if command -v "$term" >/dev/null 2>&1; then
            exec "$term" -e bash -c "$0 \"$@\""
            exit
        fi
    done
    exit 1
fi

URL="$1"
if [ -z "$URL" ]; then
    echo "No URL provided."
    sleep 2
    exit 1
fi

# 2. Start mpv SILENTLY
# > /dev/null 2>&1 sends all text output to the void so it doesn't mess up cava
mpv --no-video "$URL" > /dev/null 2>&1 &
MPV_PID=$!

# Ensure mpv dies if we exit
trap "kill $MPV_PID 2>/dev/null; exit" EXIT

# 3. Launch cava
# Now cava has the whole terminal to itself
cava

# Cleanup
kill $MPV_PID 2>/dev/null
