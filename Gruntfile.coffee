module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    sass:
      dist:
        files: [
          expand: true
          cwd: 'src/scss'
          src: ['**/index.scss']
          dest: 'public/css'
          ext: '.css'
        ]

    coffee:
      dist:
        files: [
          expand: true
          cwd: 'src/coffee'
          src: '**/*.coffee'
          dest: 'public/js'
          ext: '.js'
        ]

    haml:
      dist:
        files: [
          expand: true
          cwd: 'src/haml'
          src: ['**/*.haml']
          dest: 'public'
          ext: '.html'
        ]

    copy:
      main:
        files: [
          expand: true
          cwd: 'src/images/'
          src: ['**']
          dest: 'public/images'
          filter: 'isFile'
        ]

    watch:
      sass:
        files: 'src/scss/**/*.scss'
        tasks: ['sass']
      coffee:
        files: 'src/coffee/**/*.coffee'
        tasks: ['coffee']
      haml:
        files: 'src/haml/**/*.haml'
        tasks: ['haml']
      images:
        files: 'src/images/**'
        tasks: ['copy']

  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-haml')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask('compile', ['sass', 'coffee', 'haml', 'copy'])
  grunt.registerTask('default', ['compile'])