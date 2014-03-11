module.exports = (grunt) ->
	
	require('load-grunt-tasks')(grunt)

	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		coffee:
			build:
				expand: yes
				cwd: 'src/'
				src: '**/*.coffee'
				dest: 'lib/'
				ext: '.js'

			build_web:
				options:
					sourceMap: true
					sourceMapDir: 'built-assets/scripts/'

				files: [
					expand: yes
					cwd: 'assets/scripts/'
					src: '**/*.coffee'
					dest: 'built-assets/scripts/'
					ext: '.js'
				]

		less:
			build_web:
				files: [{
					expand: true
					cwd: 'assets/styles/'
					src: '**/*.less'
					dest: 'built-assets/styles/'
					ext: '.css'
				}]

		coffeelint:
			build:
				files: src: [
					'src/**/*.coffee'
					'test/**/*.coffee'
				]

			options:
				no_tabs: level: 'ignore' # this is tab land, boy
				indentation: value: 1 # single tabs

	grunt.registerTask 'default', ['build', 'build-web']

	grunt.registerTask 'build', ['coffee:build']
	grunt.registerTask 'build-web', ['coffee:build_web', 'less:build_web']