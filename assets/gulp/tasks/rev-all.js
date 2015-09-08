var gulp   = require('gulp');
var RevAll = require('gulp-rev-all');
var config = require('../config');

// TODO : To Deploy on CDN
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

function revPath(path){
  var revAll = new RevAll(config.revAll.options);
  return gulp.src(path)
    .pipe(gulp.dest(config.publicAssets))
    .pipe(revAll.revision())
    .pipe(gulp.dest(config.publicAssets));
}

gulp.task('rev-all', ['styles-all', 'scripts', 'images'], function () {
  var revAll = new RevAll(config.revAll.options);
  return gulp.src([
    config.revAll.image_paths,
    config.revAll.styles_paths,
    config.revAll.scripts_paths,
    config.revAll.icon_font_paths
  ])
    .pipe(gulp.dest(config.publicAssets))
    .pipe(revAll.revision())
    .pipe(gulp.dest(config.publicAssets))
    .pipe(revAll.versionFile())
    .pipe(gulp.dest(config.publicAssets))
    .pipe(revAll.manifestFile())
    .pipe(gulp.dest(config.publicAssets));
});

gulp.task('rev-images', ['images'], function(){
  return revPath(config.revAll.image_paths);
});

gulp.task('rev-styles', ['styles-all'], function(){
  return revPath(config.revAll.styles_paths);
});

gulp.task('rev-scripts', ['scripts'], function(){
  return revPath(config.revAll.scripts_paths);
});

gulp.task('rev-iconFont', ['iconfont'], function(){
  return revPath(config.revAll.icon_font_paths);
});
