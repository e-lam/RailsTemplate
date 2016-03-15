var gulp         = require('gulp');
var config       = require('../config').svgstore;
var svgstore     = require('gulp-svgstore');
var svgmin       = require('gulp-svgmin');
var path         = require('path');


gulp.task('svgstore', function () {
  return gulp
    .src(config.files_src_svg_sprites)
    .pipe(svgmin(function (file) {
      var prefix = path.basename(file.relative, path.extname(file.relative));
      return {
        plugins: [{
          cleanupIDs: {
            prefix: prefix + '-',
            minify: true
          }
        }]
      }
    }))
    .pipe(svgstore())
    .pipe(gulp.dest(config.dest));
});
