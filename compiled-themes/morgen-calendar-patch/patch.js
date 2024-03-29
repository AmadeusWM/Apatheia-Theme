// run with `node patch.js /Path/to/the/Morgen/installation`
// cd /home/amadeusw/Projects/theming/Apatheia/compiled-themes/morgen-calendar-patch
// node patch.js /opt/Morgen/resources

import fs from 'fs';
import {exec} from 'child_process';
import {loadJsonFile} from 'load-json-file';
const updatesFile = 'updates.json';

/**
 * Validation.
 */

if (process.argv.length < 3) {
    console.log('You need to specify the installation location of Morgen Calendar. It needs to be the folder where app.asar is located.');
    console.log('E.g.:   node patch.js /opt/Morgen/resources');
    process.exit(0);
}

const morgenDir = process.argv[2];

if (! fs.existsSync(morgenDir)) {
    console.log('This directory doesn\'t exist.');
    process.exit(0);
}

if (! fs.existsSync(path('app.asar'))) {
    console.log('This directory doesn\'t contain "app.asar".');
    process.exit(0);
}

// Create a backup of the app.asar file if one doesn't already exist.
if (! fs.existsSync(path('app.asar.bak'))) {
    console.log('Creating a backup of app.asar because none exists.');
    fs.createReadStream(path('app.asar')).pipe(fs.createWriteStream(path('app.asar.bak')));
}

// Extract the asar file.
exec(`asar extract ${path('app.asar')} ${path('app')}`, () => {
    // Parse the updates file.
    loadJsonFile(updatesFile).then(updates => {
        for (let file in updates) {
            let filePath = path(`app/${file}`);
            let update = updates[file];
            let contents = fs.readFileSync(filePath, 'utf8');

            console.log(`Processing ${file}...`);

            if (update.replace) {
                for (let regex in update.replace) {
                    let flags, substitute = update.replace[regex];

                    // Build a valid RegExp string.
                    regex = regex.substr(1);
                    regex = regex.split('/');
                    flags = regex.pop();
                    regex = regex.join('');
                    regex = regex.replace(/^#/, '\\#');

                    contents = contents.replace(new RegExp(regex, flags), substitute);
                }
            }

            if (update.appendFile) {
                let newContents = fs.readFileSync(`stubs/${update.appendFile}`, 'utf8');

                contents += newContents;
            }

            fs.writeFileSync(filePath, contents);
        }

        console.log('Removing the .asar archive because there\'s no need for it.');
        fs.unlinkSync(path('app.asar'));
    });
});

function path(to) {
    return morgenDir.replace(/\/+$/, '') + '/' + to.replace(/^\/+/, '');
}