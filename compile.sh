#!/bin/sh

BASEDIR=$(dirname "$0")

# many-to-many mode with (source:output) (from https://sass-lang.com/documentation/cli/dart-sass)
 # obsidian 
sass --no-source-map \
    $BASEDIR/scss/obsidian/main.scss:$BASEDIR/compiled-themes/obsidian/theme.css \
    $BASEDIR/scss/firefox/chrome/config.scss:$BASEDIR/compiled-themes/firefox/chrome/config.css \
    $BASEDIR/scss/firefox/treestyletab/treestyletab.scss:$BASEDIR/compiled-themes/firefox/treestyletab/treestyletab.css \
    $BASEDIR/scss/vs-code/vs-code-full.scss:$BASEDIR/compiled-themes/vs-code/vs-code-full.css \
    $BASEDIR/scss/vs-code/vs-code-partial.scss:$BASEDIR/compiled-themes/vs-code/vs-code-partial.css
# obsidian for theme
sass --no-source-map \
    $BASEDIR/scss/obsidian/main.scss:$BASEDIR/theme.css \
