var publicAssets = './public/assets';
var sourceFiles  = './app/assets';

module.exports = {
    publicAssets: publicAssets,
    revAll: {
        image_paths: sourceFiles + '/images/dist/**/*.{jpg,png,gif,svg}',
        styles_paths: sourceFiles + '/stylesheets/dist/**',
        scripts_paths: sourceFiles + '/javascripts/dist/**',
        icon_font_paths: sourceFiles + '/iconFont/dist/**',
        options: {}
    },
    browserSync: {
        notify: false,
        open: false,
        port: 5001,
        proxy: 'localhost:5000',
        files: ['./app/views/**'],
        ui: {
            port: 5002
        }
    },
    styles: {
        src: sourceFiles + '/stylesheets/src',
        folder_src: sourceFiles + '/stylesheets/src/**/*.scss',
        main_src: sourceFiles + '/stylesheets/src/main.scss',
        dest: sourceFiles + '/stylesheets/dist/',
        settings: { }
    },
    scripts: {
        folder_src: sourceFiles + '/javascripts/src/**/*.js',
        main_src: sourceFiles + '/javascripts/src/main.js',
        src: sourceFiles + '/javascripts/src',
        dest: sourceFiles + '/javascripts/dist/'
    },
    images: {
        folder_src: sourceFiles+ '/images/src/**/*.{jpg,png,gif,svg}',
        src: sourceFiles + '/images/src',
        dest: sourceFiles + '/images/dist/'
    },
    iconFont: {
        src: sourceFiles + '/iconFont/src',
        folder_src: sourceFiles + '/iconFont/src/*.svg',
        dest: sourceFiles + '/iconFont/dist',
        template_src: sourceFiles + '/stylesheets/src/tools/_template-font-custom.scss',
        template_dest_rel: '/../../stylesheets/src/components/_icons.scss',
        template_dest_abs: sourceFiles + '/stylesheets/src/components/_icons.scss',
        template_dest_folder: sourceFiles + '/stylesheets/src/components',
        font_src: '',
        settings: {
            fontName: 'project-iconFont',
            appendCodepoints: true,
            normalize:true,
            fontHeight:512
        }
    },
    templates: {
        folder_src: 'app/views/**/*.{erb, html, haml, jade}'
    }
};
