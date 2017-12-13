module.exports = function (grunt) {

  grunt.initConfig ({
    pkg : grunt.file.readJSON('package.json'),

    clean: {
      css: ['css'],
      temp: ['temp.css']
    },

    less:{
      app:{
        options: {
          paths: ['less']
        },
        files : {
          'css/font-awesome.css': 'less/font-awesome.less'
        }
      }
    },

    sass: {
      dist: {
        files: {
          'temp.css': 'scss/font-awesome.scss'
        }
      }
    },

    cssmin :{
      app : {
        files : {
          'css/font-awesome.min.css': 'css/font-awesome.css'
        }
      }
    }
  });

  // Load NPM Tasks
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-sass');

  // Default Task Validates Less and Builds CSS for dist
  grunt.registerTask("default", ['clean', 'less', 'sass', 'cssmin', 'clean:temp']);
};
