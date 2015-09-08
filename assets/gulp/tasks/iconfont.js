var gulp                    = require('gulp');
var fs                      = require('fs');
var extfs                   = require('extfs');
var iconfont                = require('gulp-iconfont');
var iconfontCss             = require('gulp-iconfont-css');
var browserSync             = require('browser-sync').create();
var config                  = require('../config').iconFont;
var utils                   = require('./utils')
var plumber                 = require('gulp-plumber');
var notify                  = require('gulp-notify');

gulp.task('iconfont', function() {
  // Create Src / Dest directory if they don't exist, to avoid confusion
  utils.createDirectoryIfNeeded(config.src);
  utils.createDirectoryIfNeeded(config.template_dest_folder);

  if (!extfs.isEmptySync(config.src)){
    console.info('Creating iconFont from source SVGS...')
    return gulp.src(config.folder_src)
      .pipe(plumber({
        errorHandler: notify.onError('IconFont Error: <%= error.message %>')
      }))
      .pipe(iconfontCss({
        fontName: config.settings.fontName,
        path: config.template_src,
        targetPath: config.template_dest_rel,
        fontPath: config.font_src
      }))
      .pipe(iconfont({
        fontName: config.settings.fontName,
        appendCodepoints: config.settings.appendCodepoints,
        normalize: config.settings.normalize,
        fontHeight: config.settings.fontHeight
      }))
      .pipe(gulp.dest(config.dest));
  } else {
    // Create an Empty Icon SCSS File if there's no icons in the folder
    // Avoids SCSS errors when requiring a non-existent file
    console.info('IconFont source folder is empty, skipping iconFont creation...')
    utils.createEmptyFile(config.template_dest_abs);
  }

});
