var gulp         = require('gulp');
var config       = require('../config');
var browserSync  = require('browser-sync');
var runSequence  = require('run-sequence');
var replace      = require('gulp-replace');

gulp.task('default', function(callback) {
  runSequence('build', 'browserSync', 'watch', callback);
});
