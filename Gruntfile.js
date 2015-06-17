module.exports = function(grunt) {

    // Configuration
    grunt.initConfig({

        pkg: grunt.file.readJSON('package.json'),

        /**
         * The directories to delete when `grunt clean` is executed.
         */
        clean: {
            css: [
                'assets/css'
            ],
            js: [
                'assets/js'
            ]
        },

        concat: {
            dist: {
                src: [
                    'dev/js/libs/jquery.js',
                    'dev/js/libs/modernizr.js',
                    'dev/js/libs/flexslider.js',
                    'dev/js/modules/functions-header.js',
                    'dev/js/**/**/*.js',
                    'dev/js/modules/functions-footer.js'
                ],
                dest: 'catalog/view/javascript/main.js',
            }
        },

        uglify: {
            build: {
                src: 'catalog/view/javascript/main.js',
                dest: 'catalog/view/javascript/main.min.js',
            }
        },

        compass: {
            dist: {
                options: {
                    sassDir: 'dev/sass',
                    cssDir: 'catalog/view/theme/default/stylesheet',
                    environment: 'development'
                }
            }
        },

        watch: {
            scripts: {
                files: [
                    'dev/js/**/*.js',
                ],
                tasks: ['concat', 'uglify'],
                options: {
                    spawn: false
                }
            },
            css: {
                files: [
                    'dev/sass/**/*.scss'
                ],
                tasks: ['clean:css', 'compass'],
                options: {
                    //spawn: false
                }
            },
            livereload: {
                options: {
                    livereload: true
                },
                files: [
                    'ng-views/**/*.html',
                    'dev/js/**/*.js',
                    'dev/sass/**/*.scss',
                    'assets/**/*'
                ]
            }
        },


        express: {
            options: {
                // Override defaults here
            },
            dev: {
                options: {
                    script: 'server.js'
                }
            }
        }



    });

    // Where we tell Grunt we plan to use plugins.
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-compass');

    // Where we tell Grunt what to do when we type "grunt" into the terminal.
    grunt.registerTask('default', ['concat', 'uglify', 'compass', 'watch']);

};