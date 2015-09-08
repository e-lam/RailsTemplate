var gulp                    = require('gulp');
var config                  = require('../config').scripts;
var browserify              = require('browserify');
var notify                  = require('gulp-notify');
var source                  = require('vinyl-source-stream');
var createDirectoryIfNeeded = require('./utils').createDirectoryIfNeeded;

gulp.task('scripts', function(){
  createDirectoryIfNeeded(config.src);

  var b = browserify({
    entries: config.main_src,
    debug: process.env.RAILS_ENV === 'production' ? false : true,
  });

  var stream = b.bundle();
  return stream.on('error', notify.onError({
    title: "Browserify Error",
    message: "<%= error.message %>"
  }))
    .pipe(source('main.js'))
    .pipe(gulp.dest(config.dest));
});
