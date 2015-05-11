file 'gulpfile.js', <<-RUBY
var requireDir = require('require-dir');

requireDir('./lib/gulp/tasks', { recurse: true });
RUBY

directory 'assets/gulp', 'lib/gulp'

file 'package.json', <<-JSON
{
    "name": "GulpAsset",
    "version": "0.0.1",
    "description": "",
    "main": "gulpfile.js",
    "scripts": {
        "test": "echo 'Error: no test specified' && exit 1"
    },
    "author": "",
    "license": "ISC",
    "scripts": {
        "postinstall": "gulp build"
    },
    "dependencies": {
        "gulp": "^3.8.11",
        "gulp-autoprefixer": "^2.2.0",
        "gulp-sass": "^1.3.3",
        "require-dir": "^0.3.0",
        "del": "^1.1.1",
        "browser-sync": "^2.6.9",
        "gulp-replace": "^0.5.3",
        "gulp-rename": "^1.2.2",
        "gulp-sequence": "^0.3.2",
        "gulp-util": "^3.0.4",
        "gulp-csso": "^1.0.0"
    }
}
JSON

file 'app/assets/stylesheets/src/main.scss', <<-CSS
// Puts you CSS HERE
CSS

gsub_file 'app/assets/stylesheets/application.css', ' *= require_tree .', ' *'
gsub_file 'app/assets/stylesheets/application.css', ' *= require_self', ' *= require dist/main'

gsub_file 'config/environments/development.rb', 'config.assets.digest = true', 'config.assets.digest = false'

append_file 'Procfile', <<-CODE
gulp: gulp
CODE

run 'npm install --loglevel warn'