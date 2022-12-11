#!/bin/sh

BASEDIR=$(dirname "$0")

### CSS ###
# obsidian
source_obsidian=$BASEDIR/scss/obsidian/main.scss
target_obsidian=$BASEDIR/compiled-themes/obsidian/theme.css 
# firefox
source_chrome_config=$BASEDIR/scss/firefox/chrome/config.scss
target_chrome_config=$BASEDIR/compiled-themes/firefox/chrome/config.css
## TST firefox
source_tst=$BASEDIR/scss/firefox/treestyletab/treestyletab.scss
target_tst=$BASEDIR/compiled-themes/firefox/treestyletab/treestyletab.css 
# EWW
source_eww_bar=$BASEDIR/scss/eww-bar/eww.scss
target_eww_bar=$BASEDIR/compiled-themes/eww-bar/eww/eww.scss
# discord theme
source_discord=$BASEDIR/scss/discord/Apatheia.theme.scss
target_discord=$BASEDIR/compiled-themes/discord/Apatheia.theme.css 
# wofi
source_wofi=$BASEDIR/scss/wofi/style.scss
target_wofi=$BASEDIR/compiled-themes/wofi/style.css
### NON CSS ###
# vs code
## Full dark
source_vs_code_full=$BASEDIR/scss/vs-code/vs-code-full.scss
target_vs_code_full=$BASEDIR/compiled-themes/vs-code/vs-code-full.json
## Partial gray and dark
source_vs_code_partial=$BASEDIR/scss/vs-code/vs-code-partial.scss
target_vs_code_partial=$BASEDIR/compiled-themes/vs-code/vs-code-partial.json
# rofi
source_rofi=$BASEDIR/scss/rofi/rounded-pink-dark-apatheia.scss
target_rofi=$BASEDIR/compiled-themes/rofi/rounded-pink-dark-apatheia.rasi
# kitty
source_kitty=$BASEDIR/scss/kitty/kitty-theme.scss
target_kitty=$BASEDIR/compiled-themes/kitty/kitty-theme.conf 
# spotify color scheme
source_spotify=$BASEDIR/scss/spotify/color.scss
target_spotify=$BASEDIR/compiled-themes/spotify/Dribbblish/color.ini 
# dunst
source_dunst=$BASEDIR/scss/dunst/dunstrc.scss
target_dunst=$BASEDIR/compiled-themes/dunst/dunstrc

#### LIST WITH ALL THE NON-CSS THEMES
targets_non_css=( $target_vs_code_full $target_vs_code_partial $target_rofi $target_kitty $target_spotify $target_dunst )

# compile themes
# many-to-many mode with (source:output) (from https://sass-lang.com/documentation/cli/dart-sass)
sass --no-source-map \
    $source_obsidian:$target_obsidian \
    $source_chrome_config:$target_chrome_config \
    $source_tst:$target_tst \
    $source_eww_bar:$target_eww_bar \
    $source_discord:$target_discord \
    $source_wofi:$target_wofi \
    $source_vs_code_full:$target_vs_code_full \
    $source_vs_code_partial:$target_vs_code_partial \
    $source_rofi:$target_rofi \
    $source_kitty:$target_kitty \
    $source_spotify:$target_spotify \
    $source_dunst:$target_dunst

# Remove comments that break configs:
for i in "${targets_non_css[@]}"
do
    sed -i '1d' "$i" # source: https://www.baeldung.com/linux/remove-first-line-text-file#using-thesed-command
done

# obsidian for theme
sass --no-source-map \
    $source_obsidian:$BASEDIR/theme.css
