# Apatheia theme
## Compile all themes with:
```bash
./config.sh
```

## How To Apply Generated Themes
All generated themes are stored in `compiled-themes`

### Spotify (Spicetify)
Install spicetify.
Copy `compiled-themes/spotify/Dribbblish` to `~/.config/spicetify/Themes` (or wherever your spicetify configurations are stored)
Then:
```bash
cd "$(dirname "$(spicetify -c)")/Themes/Dribbblish"
mkdir -p ../../Extensions
cp dribbblish.js ../../Extensions/.
spicetify config extensions dribbblish.js
spicetify config current_theme Dribbblish color_scheme base
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify apply
```

### VS-code
You'll have to upload it to the vs-code marketplace.
Follow the docs:
1. Generate theme repository
    - https://code.visualstudio.com/api/extension-guides/color-theme#create-a-new-color-theme
2. Publish theme
    - https://code.visualstudio.com/api/working-with-extensions/publishing-extension#next-steps

### Firefox
#### Firefox Theme
1. in Firefox go to about:config. Change `toolkit.legacyUserProfileCustomizations.stylesheets` to "True"
2. Find your profile folder (go to about:profiles)
3. Copy the `chrome` folder from `compiled-themes/firefox` to the aforementioned profile folder.
4. Restart firefox, you theme should be updated

#### Tree Style Tabs
1. Install the Tree Style Tabs extension from [here](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/)
2. Visit `Preferences` with `ctrl+shift+a>Tree Style Tab>Preferences`
3. Scroll to the bottom, and Press `Import` in `All Configs`
4. Import the `config.json` from `compiled-themes/treestyletab/config.json`
5. Then go to `Advanced>Extra style rules for contents provided by Tree Style Tab`
6. Choose `Load from file` and upload the following `Firefox Theming/treestyletab/custom-hover.css`

#### Night Tab
1. Install the nighttab extension from [here](https://addons.mozilla.org/en-US/firefox/addon/nighttab/)
2. Upload `compiled-themes/firefox/night-tab/night-tab.json`
3. You'll have to change the colors yourself if you change the theme from the default `theme_dark.scss`

### Eww Bar

### GTK Theme
For GTK: [Orchis-Theme](https://github.com/vinceliuice/Orchis-theme)
Compile the theme in `compiled-themes/gtk/Orchis-Theme` with:
```bash
./install --tweaks black
```
Then change in the following files:
- `~/.config/gtk-3.0`
- `~/.config/gtk-4.0`
the configuration to this:
```conf
[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name = Orchis-Dark
```


## Todo
- [ ] Create Dark and light theme 
- [ ] Add custom features
- [ ] Add theming support
- [ ] Add style settings support for each theme
- [ ] Nighttab customization (possibly?)
