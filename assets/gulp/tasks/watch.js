var gulp = require('gulp');
var config = require('../config');
var browserSync = require('browser-sync');

gulp.task('watch', ['browserSync'], function (callback) {
    gulp.watch(config.sass.folder_src, ['sass', 'browserSync-reload']);
    callback;
});