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

#### Basic installation

[Read gulp.rb](recipes/gulp.rb)

#### Add yours

Use NPM to add dependencies to your project
