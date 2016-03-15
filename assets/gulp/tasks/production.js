var gulp        = require('gulp');
var uglify      = require('gulp-uglify');
var htmlmin      = require('gulp-htmlmin');
var csso         = require("gulp-csso");
var combineMq    = require('gulp-combine-mq');
var size         = require('gulp-size');
var runSequence  = require('run-sequence');
var config       = require('../config');

gulp.task('scripts-min', function() {
  return gulp.src(config.scripts.main_dest)
    .pipe(size({ title: 'scripts' }))
    .pipe(uglify())
    .pipe(size({ title: 'scripts-min' }))
    .pipe(gulp.dest(config.scripts.dest));
});

gulp.task('styles-min', function() {
  return gulp.src(config.styles.main_dest)
    .pipe(size({ title: 'style' }))
    .pipe(combineMq({ beautify: true }))
    .pipe(csso())
    .pipe(size({ title: 'style-min' }))
    .pipe(gulp.dest(config.styles.dest));
});

gulp.task('production', function(callback){
  runSequence(
    'build',
    'scripts-min',
    'styles-min',
    'rev-all',
    callback
  )
});
