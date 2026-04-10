#!/bin/bash
# Fetches Almora weather. 
# %t = temperature, %c = condition icon
weather=$(curl -s "wttr.in/Almora+Uttarakhand?format=4" | sed 's/\b./\u&/g')

if [ -z "$weather" ]; then
    echo " Off" # Fallback if no internet
else
    echo "$weather"
fi
