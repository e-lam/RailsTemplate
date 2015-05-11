# RailsTemplate

- Use Gulp with Rails Asset Pipeline
- **Leaves Sprockets and manifest files intact** for use with gem installed assets
- Please use **Rails-assets.org** for Javascript Libraries
- Add a staging environment
- Use [High Voltage](https://github.com/thoughtbot/high_voltage) for static pages
- Use Thin for default server
- Use [SimpleForm](https://github.com/plataformatec/simple_form) for forms
- Improve .gitignore 
- Ruby 2.2.0

## Usage

### Installation

Be sure you have Rails **>= 4.2.0**

```
$ rails new YOUR_PROJECT_NAME -m https://raw.githubusercontent.com/e-lam/RailsTemplate/master/template.rb
```

### Start server

To start Gulp and Rails server, please use foreman :

```
$ foreman start
```
  
## Rails installed Gem

| Gems Name                 | Version           |
|---------------------------|-------------------|
| annotate                  |                   |
| awesome_print             |                   |
| capybara                  |                   |
| codeclimate-test-reporter |                   |
| database_cleaner          |                   |
| factory_girl_rails        |                   |
| json_spec                 |                   |
| launchy                   |                   |
| pg                        | 0.18.1            |
| poltergeist               |                   |
| quiet_assets              |                   |
| rails_12factor            |                   |
| rails_best_practices      |                   |
| rspec-rails               |                   |
| shoulda-matchers          |                   |
| simplecov                 |                   |
| devise                    |                   |
| foreman                   |                   |
| high_voltage              | ~> 2.3.0          |
| simple_form               |                   |
| thin                      |                   |

## Gulp pre-installed Lib

| Name              | Version |
| ----------------- | ------- |
| gulp              | ^3.8.11 |
| gulp-autoprefixer | ^2.2.0  |
| gulp-sass         | ^1.3.3  |
| require-dir       | ^0.3.0  |
| del               | ^1.1.1  |
| browser-sync      | ^2.6.9  |
| gulp-replace      | ^0.5.3  |
| gulp-rename       | ^1.2.2  |
| gulp-sequence     | ^0.3.2  |
| gulp-util         | ^3.0.4  |
| gulp-csso         | ^1.0.0  |
