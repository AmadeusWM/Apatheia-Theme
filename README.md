# Apatheia theme
## Compile all themes with:
```bash
./compile.sh
```

## How To Apply Generated Themes
All generated themes are stored in `compiled-themes`

### Spotify (Spicetify)
Install spicetify. (AUR: `spicetify-cli`)
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
### Discord (Better Discord)
install from AUR: `betterdiscordctl`

#### Discord Snap Install
```bash
betterdiscordctl --d-install snap install 
```

### VS-code
The Apatheia theme can be found on the marketplace. 
Look up `Apatheia` from `Amadeus Wolf`

#### Non-default
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
5. Then go to `Advanced` and scroll down
6. Choose `Load from file` and upload the following `Firefox Theming/treestyletab/treestyletab.css`

#### Night Tab
1. Install the nighttab extension from [here](https://addons.mozilla.org/en-US/firefox/addon/nighttab/)
2. Go to night tab settings (top right), and then the data tab
3. Import `compiled-themes/firefox/night-tab/night-tab.json`
4. You'll have to change the colors yourself if you change the theme from the default

### GTK Theme
For GTK: [Orchis-Theme](https://github.com/vinceliuice/Orchis-theme)
Compile the theme in `compiled-themes/gtk/Orchis-Theme` with:
```bash
./install --tweaks black
```
or (when not working with nautilus)
```bash
./install --tweaks black -l
```
Then change in the following files:
- `~/.config/gtk-3.0/settings.ini`
- `~/.config/gtk-4.0/settings.ini`
the configuration to this:
```conf
[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name = Orchis-Dark
```
and you might have to run: 
```bash
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

#### Nautilus still not themed?
Use this patch: (from [here](https://github.com/odziom91/libadwaita-theme-changer))
```bash
git clone https://github.com/odziom91/libadwaita-theme-changer.git
cd libadwaita-theme-changer
chmod +x libadwaita-tc.py
./libadwaita-tc.py
```
> source: https://github.com/vinceliuice/Orchis-theme/issues/226
#### Terminal Inside Nautilus
https://github.com/flozz/nautilus-terminal

### Eww Bar
Credits to https://github.com/taylor85345
Dependency: `eww-wayland`

## Todo
- [ ] Create Dark and light theme 
- [ ] Add custom features
- [ ] Add theming support
- [ ] Add style settings support for each theme
- [ ] Nighttab customization (possibly?)
