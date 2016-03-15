var gulp         = require('gulp');
var runSequence  = require('run-sequence');

gulp.task('build', function(callback){
  var ENV = process.env.RAILS_ENV;
  runSequence(
    'clean',
    'svgstore',
    'normalize',
    ['styles', 'images', 'scripts', 'fonts'],
    (ENV === 'production' || ENV === 'staging') ? 'rev-all' : 'move-all',
    callback
  )
});
