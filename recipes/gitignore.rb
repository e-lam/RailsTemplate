append_to_file '.gitignore', <<-GIT
*.iml

## Directory-based project format:
.idea/

## File-based project format:
*.ipr
*.iws

## Plugin-specific files:

# IntelliJ
/out/

# mpeltonen/sbt-idea plugin
.idea_modules/

# JIRA plugin
atlassian-ide-plugin.xml

# Crashlytics plugin (for Android Studio and IntelliJ)
com_crashlytics_export_strings.xml
crashlytics.properties
crashlytics-build.properties

### OSX template
.DS_Store
.AppleDouble
.LSOverride

# Icon must end with two \r
Icon  

# Thumbnails
._*

# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk

### Ruby template
*.gem
*.rbc
/.config
/coverage/
/InstalledFiles
/pkg/
/spec/reports/
/test/tmp/
/test/version_tmp/
/tmp/

## Specific to RubyMotion:
.dat*
.repl_history
build/

## Documentation cache and generated files:
/.yardoc/
/_yardoc/
/doc/
/rdoc/

## Environment normalisation:
/.bundle/
/vendor/bundle
/lib/bundler/man/

# for a library or gem, you might want to ignore these files since the code is
# intended to run in multiple environments; otherwise, check them in:
# Gemfile.lock
# .ruby-version
# .ruby-gemset

# unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
.rvmrc

### Rails template
*.rbc
capybara-*.html
.rspec
/log
/tmp
/db/*.sqlite3
/db/*.sqlite3-journal
/public/system
/coverage/
/spec/tmp
**.orig
rerun.txt
pickle-email-*.html

# TODO Comment out these rules if you are OK with secrets being uploaded to the repo
config/initializers/secret_token.rb
config/secrets.yml

## Environment normalisation:
/.bundle
/vendor/bundle
/node_modules

# these should all be checked in to normalise the environment:
# Gemfile.lock, .ruby-version, .ruby-gemset

# unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
.rvmrc

# if using bower-rails ignore default bower_components path bower.json files
/vendor/assets/bower_components
*.bowerrc
bower.json

# Ignore pow environment settings
.powenv

test
GIT