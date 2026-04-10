source /usr/share/cachyos-fish-config/cachyos-config.fish

# Use vi-style keybindings in the shell
set -g fish_key_bindings fish_vi_key_bindings

function fish_greeting
    # Catppuccin Mocha Colors
    set -l mauve (set_color cba6f7)   # Main Art
    set -l lavender (set_color b4befe) # Lyrics
    set -l surface (set_color 585b70)  # Muted Details
    set -l normal (set_color normal)

    # 1. The Cowboy Badge (Mauve)
    echo -e "$mauve"
    echo "            .  .               ......              "
    echo "            ........    .............              "
    echo "            ...-++++==++++++++++==-..              "
    echo "            .-*+*++++**++==++***#*#**....          "
    echo "            .**+++=***###########*##*....          "
    echo "            .*##%%#############*#**#*+...          "
    echo "            .*##############****#**##*...          "
    echo ".........:::.*##############***######*:............"
    echo ".....*######**#####%#########*##%%###**........:-*."
    echo "...###*#*****#####%%%###%######%%%%##%#*-*%%%#*##%."
    echo ".-***#####**%%#%%%%%%%#%%%##%#####*##=%%#*.-==-...."
    echo ".*****#####%%%##%%%%%%###########%##*.............."
    echo ".+*******###@@@%%###***%%#######+....              "
    echo ".+*********###***###%########**......              "
    echo "..-+*##**##**#############*#...                    "
    echo ".....-#*+****##*#****+#+.......                    "
    echo "      . ..............                             "
    echo "        .............                              "

    # 2. The Lyrics (Lavender)
    echo -e "$lavender"
    echo "   \"The sun is sinking in the west,"
    echo "    The cattle go to the stream."
    echo "    The redwing settle in her nest,"
    echo "    It's time for a cowboy to dream.\""
    echo -e "$normal"
end
