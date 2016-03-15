var gulp         = require('gulp');
var del          = require('del');
var config       = require('../config');


gulp.task('clean', del.bind(null, [
  config.styles.file_normalize_scss,
  config.appSource + '/images/src/sprite.svg'
]));
