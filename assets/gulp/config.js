var publicAssets = "./public/assets";
var sourceFiles = "./app/assets";

module.exports = {
    publicAssets: publicAssets,
    browserSync: {
        notify: false,
        port: '3001',
        proxy: 'localhost:3000',
        files: ['./app/views/**']
    },
    sass: {
        folder_src: sourceFiles + "/stylesheets/src/**/*.scss",
        main_src: sourceFiles + "/stylesheets/src/main.scss",
        dest: sourceFiles + "/stylesheets/dist/",
        settings: { }
    }
};