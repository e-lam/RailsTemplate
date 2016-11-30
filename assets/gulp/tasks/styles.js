var gulp         = require('gulp');
var config       = require('../config').styles;
var fs           = require('fs');
var sass         = require('gulp-sass');
var plumber      = require('gulp-plumber');
var autoprefixer = require('gulp-autoprefixer');
var notify       = require('gulp-notify');
var sourcemaps   = require('gulp-sourcemaps');

function createNormalizeScss() {
  fs.createReadStream(config.file_normalize_css)
    .pipe(fs.createWriteStream(config.file_normalize_scss));
}

gulp.task('normalize', function() {
  createNormalizeScss();
});

gulp.task('styles', function() {
  return gulp.src(config.files_src)
    .pipe(plumber({
      errorHandler: notify.onError('SASS Error: <%= error.message %>')
    }))
    .pipe(sass())
    .pipe(sourcemaps.init())
    .pipe(autoprefixer({ browsers: ['last 2 versions'] }))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(config.dest));
});
