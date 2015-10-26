var gulp = require('gulp');
var runSequence = require('run-sequence');

gulp.task('build', function (callback) {
  var ENV = process.env.RAILS_ENV;
  runSequence(
      (ENV === 'production' || ENV === 'staging') ? 'noop': 'clean-all',
      'iconFont',
      (ENV === 'production' || ENV === 'staging') ? 'rev-all' : 'move-all',
      callback
  )
});
