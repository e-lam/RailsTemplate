var gulp        = require('gulp');
var config      = require('../config');
var browserSync = require('browser-sync');
var reload      = browserSync.reload;
var watch       = require('gulp-watch');



gulp.task('watch', function (callback) {
  // Watch Sass Files
  watch([config.styles.folder_src, '!' + config.vendor_css.dest + '**/**'], function() {
    gulp.start('move-styles');
  });

  // Watch JS Files
  watch(config.scripts.folder_src, function() {
    gulp.start('move-scripts');
  });

  // Watch Images Files
  watch(config.images.folder_src, function() {
    gulp.start('move-images');
    reload();
  });

  // Watch IconFont Files
  watch(config.iconFont.folder_src, function() {
    gulp.start('move-iconFont');
    reload();
  });

  // Watch Templates Files
  watch(config.templates.folder_src, function() {
    reload();
  })
});
