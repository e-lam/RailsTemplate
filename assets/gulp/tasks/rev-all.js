var gulp    = require('gulp');
var RevAll  = require('gulp-rev-all');
var config  = require('../config');
var gzip    = require('gulp-gzip');

// TODO : For CDN
//var awspublish = require('gulp-awspublish');
//var cloudfront = require('gulp-cloudfront');
//
//var aws = {
//    'params': {
//        'Bucket': ''
//    },
//    'accessKeyId': '',
//    'secretAccessKey': '',
//    'distributionId': '',
//    'region': '',
//};
//
//var publisher = awspublish.create(aws);
//var headers = {'Cache-Control': 'max-age=315360000, no-transform, public'};
//
//        .pipe(awspublish.gzip())
//        .pipe(publisher.publish(headers))
//        .pipe(publisher.cache())
//        .pipe(awspublish.reporter())
//        .pipe(cloudfront(aws));
//

gulp.task('rev-all', function () {
  var revAll = new RevAll();
  return gulp.src([
      config.revAll.image_paths,
      config.revAll.styles_paths,
      config.revAll.scripts_paths,
      config.revAll.icon_font_paths
    ])
    .pipe(gulp.dest(config.publicAssets))
    .pipe(revAll.revision())
    .pipe(gulp.dest(config.publicAssets))
    .pipe(gzip())
    .pipe(gulp.dest(config.publicAssets))
    .pipe(revAll.versionFile())
    .pipe(gulp.dest(config.publicAssets))
    .pipe(revAll.manifestFile())
    .pipe(gulp.dest(config.publicAssets));
});
