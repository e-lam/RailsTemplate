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
  "browser": {
    "jquery": "./node_modules/jquery/dist/jquery.js"
  },
  "browserify-shim": {
    "jquery": "$",
    "jquery-modal": {
      "exports": "$.modal",
      "depends": [
        "jquery:jQuery"
      ]
    }
  },
  "browserify": {
    "transform": [
      [
        "babelify",
        {
          "presets": [
            "es2015"
          ]
        }
      ],
      "browserify-shim"
    ]
  },
  "scripts": {
    "postinstall": "gulp build"
  },
  "devDependencies": {
    "browser-sync": "^2.11.1",
    "gulp-htmlmin": "^1.3.0",
    "gulp-replace": "^0.5.4"
  },
  "dependencies": {
    "aliasify": "^1.9.0",
    "babel-preset-es2015": "^6.3.13",
    "babel-runtime": "^6.3.19",
    "babelify": "^7.2.0",
    "browserify": "^13.0.0",
    "browserify-shim": "^3.8.12",
    "del": "^2.2.0",
    "gulp": "^3.9.0",
    "gulp-autoprefixer": "^3.1.0",
    "gulp-combine-mq": "^0.4.0",
    "gulp-csso": "^1.0.1",
    "gulp-imagemin": "^2.4.0",
    "gulp-notify": "^2.2.0",
    "gulp-rev-all": "^0.8.21",
    "gulp-gzip": "^1.2.0",
    "gulp-plumber": "^1.0.1",
    "gulp-sass": "^2.1.1",
    "gulp-shell": "^0.5.2",
    "gulp-size": "^2.0.0",
    "gulp-sourcemaps": "^1.6.0",
    "gulp-svgmin": "^1.2.1",
    "gulp-svgstore": "^5.0.5",
    "gulp-uglify": "^1.5.1",
    "gulp-util": "^3.0.7",
    "gulp-watch": "^4.3.5",
    "imagemin-pngquant": "^4.2.0",
    "jquery": "^2.2.0",
    "jquery-modal": "^0.6.1",
    "minimist": "^1.2.0",
    "normalize.css": "^3.0.3",
    "plumber": "^0.4.8",
    "require-dir": "^0.3.0",
    "run-sequence": "^1.1.5",
    "slick-carousel": "^1.5.9",
    "watchify": "^3.7.0"
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