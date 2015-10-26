file 'gulpfile.js', <<-RUBY
var requireDir = require('require-dir');

requireDir('./lib/gulp/tasks', { recurse: true });
RUBY

directory 'assets/gulp', 'lib/gulp'

file 'package.json', <<-JSON
{
  "name": "GulpAsset",
  "version": "1.0.0",
  "description": "",
  "main": "app/assets/javascripts/src/main.js",
  "browserify-shim": {},
  "browserify": {
    "transform": [
      "babelify",
      "browserify-shim"
    ]
  },
  "scripts": {
    "postinstall": "gulp build"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "babelify": "^6.3.0",
    "browserify": "^11.0.1",
    "browserify-shim": "^3.8.10",
    "del": "^1.1.1",
    "extfs": "0.0.7",
    "gulp": "^3.8.11",
    "gulp-autoprefixer": "^2.2.0",
    "gulp-awspublish": "^3.0.0",
    "gulp-cloudfront": "0.0.14",
    "gulp-csso": "^1.0.0",
    "gulp-iconfont": "^4.0.1",
    "gulp-iconfont-css": "^1.0.1",
    "gulp-imagemin": "^2.3.0",
    "gulp-plumber": "^1.0.1",
    "gulp-rename": "^1.2.2",
    "gulp-replace": "^0.5.3",
    "gulp-rev-all": "^0.8.21",
    "gulp-sass": "^1.3.3",
    "gulp-size": "^2.0.0",
    "gulp-util": "^3.0.4",
    "gulp-watch": "^4.3.5",
    "imagemin-pngquant": "^4.2.0",
    "normalize.css": "^3.0.3",
    "require-dir": "^0.3.0",
    "run-sequence": "^1.1.2",
    "vinyl-buffer": "^1.0.0",
    "vinyl-source-stream": "^1.1.0"
  },
  "devDependencies": {
    "browser-sync": "^2.6.9",
    "gulp-concat": "^2.6.0",
    "gulp-notify": "^2.2.0"
  }
}

JSON

file 'app/assets/stylesheets/src/main.scss', <<-CSS
// Puts you CSS HERE
CSS

remove_file 'app/assets/stylesheets/application.css'
remove_file 'app/assets/javascripts/application.js'

gsub_file 'config/environments/development.rb', 'config.assets.digest = true', 'config.assets.digest = false'

append_file 'Procfile', <<-CODE
gulp: gulp
CODE

inject_into_file 'app/helpers/application_helper.rb', before: 'end' do
  <<-'RUBY'
  def gulp_asset_path(path)
    if defined?(REV_MANIFEST) && !Rails.env.development?
      "#{ENV['CDN_URL']}/assets/#{REV_MANIFEST[path]}"
    else
      "/assets/#{path}"
    end
  end

  RUBY
end

file 'app/views/layouts/application.html.erb', <<-HTML
<!DOCTYPE html>
<html>
<head>
  <title></title>

  <meta charset="UTF-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="<%= gulp_asset_path('main.css') %>" media="all" rel="stylesheet"/>
  <%= csrf_meta_tags %>
</head>
<body>
    <%= yield %>
    <script src="<%= gulp_asset_path('main.js') %>"></script>
</body>
</html>
HTML

initializer 'gulp_rev_manifest.rb', <<-CODE
rev_manifest_path = 'public/assets/rev-manifest.json'

if File.exist?(rev_manifest_path)
  REV_MANIFEST = JSON.parse(File.read(rev_manifest_path))
end
CODE


run 'npm install --loglevel warn'