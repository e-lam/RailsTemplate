var publicAssets = './public/assets';
var appSource = './app/assets';

module.exports = {

  appSource: appSource,
  appBuild: appSource,
  publicAssets: publicAssets,

  browserSync: {
    notify: false,
    open: false,
    server: appSource,
    files: [
      appSource + '/stylesheets/dist/styles.css'
    ]
  },

  revAll: {
    image_paths: appSource + '/images/dist/**/*.{jpg,png,gif,svg}',
    styles_paths: appSource + '/stylesheets/dist/**',
    scripts_paths: appSource + '/javascripts/dist/**',
    icon_font_paths: appSource + '/iconFont/dist/**',
    options: {}
  },

  styles: {
    src: appSource + '/stylesheets/src',
    files_src: appSource + '/stylesheets/src/**/*.scss',
    main_dest: appSource + '/stylesheets/dist/main.css',
    dest: appSource + '/stylesheets/dist/',
    file_normalize_css: './node_modules/normalize.css/normalize.css',
    file_normalize_scss: appSource + '/stylesheets/src/base/_b-normalize.scss'
  },

  scripts: {
    dest: appSource + '/javascripts/dist/',
    main_src: appSource + '/javascripts/src/main.js',
    files_src: appSource + '/javascripts/src/**/*.js',
    main_dest: appSource + '/javascripts/dist/main.js'
  },

  images: {
    files_src: [
      '!' + appSource + '/images/src/sprite/**/*.svg',
      '!' + -appSource + '/images/src/sprite.svg',
      appSource + '/images/src/**/*.{jpg,png,gif,svg}'
    ],
    dest: appSource + '/images/dist/'
  },

  iconFont: {
    src: appSource + '/iconFont/src',
    folder_src: appSource + '/iconFont/src/*.svg',
    dest: appSource + '/iconFont/dist/',
    template_src: appSource + '/stylesheets/src/tools/_template-font-custom.scss',
    template_dest_rel: '/../../stylesheets/src/components/_icons.scss',
    template_dest_abs: appSource + '/stylesheets/src/components/_icons.scss',
    template_dest_folder: appSource + '/stylesheets/src/components',
    font_src: '',
    settings: {
      fontName: 'assets-icons',
      appendCodepoints: true,
      normalize: true,
      fontHeight: 512
    }
  },

  svgstore: {
    files_src_svg_sprites: appSource + '/images/src/sprite/*.svg',
    dest: appSource + '/images/src'
  },

  fonts: {
    src: appSource + '/fonts/**',
    dest: publicAssets
  }

};
