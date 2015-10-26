var gulp                    = require('gulp');
var sass                    = require('gulp-sass');
var config                  = require('../config').styles;
var config_vendor           = require('../config').vendor_css;
var autoprefixer            = require('gulp-autoprefixer');
var replace                 = require('gulp-replace');
var rename                  = require('gulp-rename');
var gutil                   = require('gulp-util');
var csso                    = require('gulp-csso');
var plumber                 = require('gulp-plumber');
var notify                  = require('gulp-notify');
var concat                  = require('gulp-concat');
var runSequence             = require('run-sequence');
var utils                   = require('./utils');


// Handle Default Syles
gulp.task('styles', function () {
  return gulp.src(config.main_src)
    .pipe(plumber({
      errorHandler: notify.onError('SASS Error: <%= error.message %>')
    }))
    .pipe(sass(config.settings))
    .pipe(autoprefixer({browsers: ['last 2 version']}))
    .pipe(process.env.RAILS_ENV === 'production' ? csso() : gutil.noop())
    .pipe(gulp.dest(config.dest))
});

// Handle Vendor styles that need to be loaded first
gulp.task('vendor-styles-before', function() {
  // Create empty Style files to avoid Sass Errors
  utils.createEmptyFile(config_vendor.dest + '_vendor-before.scss');

  return gulp.src(config_vendor.load_before)
    .pipe(plumber({
      errorHandler: notify.onError('Vendor CSS Error: <%= error.message %>')
    }))
    .pipe(concat('_vendor-before.scss'))
    .pipe(gulp.dest(config_vendor.dest))
});

// Handle Vendor styles that need to be loaded after default styles
gulp.task('vendor-styles-after', function() {
  // Create empty Style files to avoid Sass Errors
  utils.createEmptyFile(config_vendor.dest + '_vendor-after.scss');

  return gulp.src(config_vendor.load_after)
    .pipe(plumber({
      errorHandler: notify.onError('Vendor CSS Error: <%= error.message %>')
    }))
    .pipe(concat('_vendor-after.scss'))
    .pipe(gulp.dest(config_vendor.dest))
});

// Handle All Styles
gulp.task('styles-all', function(callback){
  runSequence(
    ['vendor-styles-before', 'vendor-styles-after'],
    'styles',
    callback
  )
});
