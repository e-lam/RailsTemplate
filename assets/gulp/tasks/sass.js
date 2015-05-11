var gulp = require('gulp');
var sass = require('gulp-sass');
var config = require('../config').sass;
var autoprefixer = require('gulp-autoprefixer');
var replace = require('gulp-replace');
var rename = require('gulp-rename');
var gutil = require("gulp-util");
var csso = require("gulp-csso");

gulp.task('sass', function () {
    return gulp.src(config.main_src)
        .pipe(sass(config.settings))
        .pipe(autoprefixer({browsers: ['last 2 version']}))
        .pipe(process.env.RAILS_ENV === 'production' ? csso() : gutil.noop())
        .pipe(replace(/url\(/, 'image-url('))
        .pipe(rename({extname: '.scss'}))
        .pipe(gulp.dest(config.dest))
});