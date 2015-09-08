# RailsTemplate

- Use pre-configured Gulp to replace Rails Asset Pipeline. 
- Use NPM for JS & CSS dependencies
- Setup JS & CSS env
- Use Puma for default server
- Add a staging environment
- Use [High Voltage](https://github.com/thoughtbot/high_voltage) for static pages
- Use [SimpleForm](https://github.com/plataformatec/simple_form) for forms
- Improve .gitignore 
- Ruby 2.2.0
- Use brakeman & bundler-audit for security checks

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
  
## Libraries

### Ruby gems

| Gems Name                 | Version           |
|---------------------------|-------------------|
| annotate                  |                   |
| awesome_print             |                   |
| capybara                  |                   |
| codeclimate-test-reporter |                   |
| database_cleaner          |                   |
| devise                    |                   |
| factory_girl_rails        |                   |
| foreman                   |                   |
| high_voltage              | ~> 2.3.0          |
| json_spec                 |                   |
| launchy                   |                   |
| pg                        | 0.18.1            |
| poltergeist               |                   |
| puma                      |                   |
| quiet_assets              |                   |
| rails_12factor            |                   |
| rails_best_practices      |                   |
| rspec-rails               |                   |
| shoulda-matchers          |                   |
| simple_form               |                   |
| simplecov                 |                   |

### Gulp

| Name              | Version |
| ----------------- | ------- |
| browser-sync      | ^2.6.9  |
| del               | ^1.1.1  |
| gulp              | ^3.8.11 |
| gulp-autoprefixer | ^2.2.0  |
| gulp-csso         | ^1.0.0  |
| gulp-rename       | ^1.2.2  |
| gulp-replace      | ^0.5.3  |
| gulp-sass         | ^1.3.3  |
| gulp-sequence     | ^0.3.2  |
| gulp-util         | ^3.0.4  |
| require-dir       | ^0.3.0  |
