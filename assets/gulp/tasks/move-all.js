var gulp    = require('gulp');
var config  = require('../config');
var replace = require('gulp-replace');

gulp.task('move-all', ['move-styles', 'move-scripts', 'move-images']);

gulp.task('move-styles', ['styles'], function() {
  return gulp.src(config.styles.dest + '**/**')
    .pipe(gulp.dest(config.publicAssets));
});

gulp.task('move-scripts', ['scripts'], function() {
  return gulp.src(config.scripts.dest + '**/**')
    .pipe(replace(/\"([a-zA-Z\/\-\_\d]+)(\.png|svg|jpg|jpeg|gif)\"/g, '"assets/$1$2"'))
    .pipe(gulp.dest(config.publicAssets));
});

gulp.task('move-images', ['images'], function() {
  return gulp.src(config.images.dest + '**/**')
    .pipe(gulp.dest(config.publicAssets));
});