var publicAssets = "./public/assets";
var sourceFiles = "./app/assets";

module.exports = {
    publicAssets: publicAssets,
    browserSync: {
        notify: false,
        port: 5001,
        proxy: 'localhost:5000',
        files: ['./app/views/**'],
        ui: {
            port: 5002
        }
    },
    sass: {
        folder_src: sourceFiles + "/stylesheets/src/**/*.scss",
        main_src: sourceFiles + "/stylesheets/src/main.scss",
        dest: sourceFiles + "/stylesheets/dist/",
        settings: { }
    }
};