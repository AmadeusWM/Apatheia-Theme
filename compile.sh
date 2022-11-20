#!/bin/sh

BASEDIR=$(dirname "$0")

# many-to-many mode with (source:output) (from https://sass-lang.com/documentation/cli/dart-sass)
 # obsidian 
sass --no-source-map \
    $BASEDIR/scss/obsidian/main.scss:$BASEDIR/compiled-themes/obsidian/theme.css \
