var gulp = require('gulp');

gulp.task('noop', function() {
  // Blank tasks, used to "jump" tasks on staging / prod
  // Because RunSequence need to be provided a valid task
  return gulp;
});
