var gulp                    = require('gulp');
var config                  = require('../config').scripts;
var browserify              = require('browserify');
var notify                  = require('gulp-notify');
var source                  = require('vinyl-source-stream');
var watchify                = require('watchify');
var _assign                 = require('lodash/object/assign');
var gutil                   = require('gulp-util');
var uglify                  = require('gulp-uglify');
var streamify               = require('gulp-streamify');

var ENV = process.env.RAILS_ENV;

var browserifyOptions = {
  entries: config.main_src,
  debug: ENV === 'production' ? false : true,
  paths: ['./node_modules', config.src, config.casting_src]
}

if(ENV === 'production' || ENV === 'staging'){
  var b = browserify(browserifyOptions);
} else {
  var watchifiedOptions = _assign({}, watchify.args, browserifyOptions);
  var b = watchify(browserify(watchifiedOptions));
  b.on('update', bundle);
}

function bundle(){
  return b.bundle()
  .on('error', notify.onError({
    title: "Browserify Error",
    message: "<%= error.message %>"
  }))
  .pipe(source('main.js'))
  .pipe(ENV === 'production' ? streamify(uglify()) : gutil.noop())
  .pipe(gulp.dest(config.dest));
}

gulp.task('scripts', bundle);
