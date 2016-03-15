var gulp         = require('gulp');
var config       = require('../config');
var browserSync  = require('browser-sync');
var watch        = require('gulp-watch');
var reload       = browserSync.reload;

gulp.task('watch', function () {

  watch(config.styles.files_src, function() {
    gulp.start('move-styles');
    reload();
  });

  watch(config.images.files_src, function() {
    gulp.start('move-images');
    reload();
  });

  watch(config.svgstore.files_src_svg_sprites, function(){
    gulp.start('svgstore');
    reload();
  });

  watch(config.scripts.files_src, function() {
    gulp.start('move-scripts');
    reload();
  });

  watch(config.fonts.src, function() {
    gulp.start('fonts');
    reload();
  });

});
