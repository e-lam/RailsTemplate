var gulp = require('gulp');
var config = require('../config').scripts;
var shell = require('gulp-shell');
var browserify = require('gulp-browserify');

// Regular scripts tasks. Take the scripts, do some browserify magic.
gulp.task('scripts', function () {
    var ENV = process.env.RAILS_ENV;
    gulp.src([config.main_src])
      .pipe(browserify({
        insertGlobals: true,
        debug: !(ENV === 'production' || ENV === 'staging'),
        transform: ["babelify"],
        shim: {
          "jquery": {
            path: './node_modules/jquery/dist/jquery.js',
            exports: '$'
          }
        }
      }))
      .pipe(gulp.dest(config.dest))
  }
);

// Watchify script task. Like the script task, but cache the browserified bundle using watchify for faster build times.
gulp.task('scripts-watchify', shell.task([
  'mkdir -p ' + config.dest,
  'touch ' + config.main_dest,
  'watchify ' + config.main_src + ' -o ' + config.main_dest + ' -v -d'
]));
