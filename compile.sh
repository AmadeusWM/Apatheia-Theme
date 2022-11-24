#!/bin/sh

BASEDIR=$(dirname "$0")

# many-to-many mode with (source:output) (from https://sass-lang.com/documentation/cli/dart-sass)
 # obsidian 
sass --no-source-map \
    $BASEDIR/scss/obsidian/main.scss:$BASEDIR/compiled-themes/obsidian/theme.css \
    $BASEDIR/scss/firefox/chrome/config.scss:$BASEDIR/compiled-themes/firefox/chrome/config.css \
    $BASEDIR/scss/firefox/treestyletab/treestyletab.scss:$BASEDIR/compiled-themes/firefox/treestyletab/treestyletab.css \
    $BASEDIR/scss/vs-code/vs-code-full.scss:$BASEDIR/compiled-themes/vs-code/vs-code-full.json \
    $BASEDIR/scss/vs-code/vs-code-partial.scss:$BASEDIR/compiled-themes/vs-code/vs-code-partial.json \
    $BASEDIR/scss/eww-bar/eww.scss:$BASEDIR/compiled-themes/eww-bar/eww/eww.scss \
    $BASEDIR/scss/spotify/color.scss:$BASEDIR/compiled-themes/spotify/Dribbblish/color.ini \
    $BASEDIR/scss/discord/Ultra.theme.scss:$BASEDIR/compiled-themes/discord/Ultra.theme.css \
    $BASEDIR/scss/kitty/kitty-theme.scss:$BASEDIR/compiled-themes/kitty/kitty-theme.conf \
    $BASEDIR/scss/dunst/dunstrc.scss:$BASEDIR/compiled-themes/dunst/dunstrc

# obsidian for theme
sass --no-source-map \
    $BASEDIR/scss/obsidian/main.scss:$BASEDIR/theme.css
