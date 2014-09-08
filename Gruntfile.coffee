
module.exports = (grunt) ->

	grunt.loadNpmTasks('grunt-contrib-concat')
	grunt.loadNpmTasks('grunt-contrib-watch')
	grunt.loadNpmTasks('grunt-coffeelint')
	grunt.loadNpmTasks('grunt-wrap')
	grunt.loadNpmTasks('grunt-contrib-coffee')

	grunt.initConfig

		meta:
			pkg: grunt.file.readJSON('package.json')
			build: 'app/assets/javascripts/app/'
			config: 'app/assets/javascripts/config/'
			production: 'app/assets/javascripts/public/'

		concat:
			app:
				options:
					banner: '<%= meta.banner %>\n'
					stripBanners:
						options: 'block'
				src: [
						'<%= meta.config %>app.js.coffee'
						'<%= meta.build %>directives/*.js.coffee'
						'<%= meta.build %>filters/*.js.coffee'
						'<%= meta.build %>controllers/*.js.coffee'
						'<%= meta.build %>services/**/*.js.coffee'
					]
				dest: '<%= meta.production %>app.js.coffee'
		coffee:
			compile:
				files: [
						'<%= meta.production %>app.js' : '<%= meta.production %>app.js.coffee'
				]

		coffeelint:
			app: [
				'**/*.coffee'
			]
			options:
				'no_tabs':
					'level': 'ignore'
				'indentation':
					'level': 'ignore'
				'no_trailing_whitespace':
					'level': 'warn'
				'max_line_length':
					'level': 'ignore'

		watch:
			concat:
				files: [
					'<%= meta.build %>**/*.js.coffee'
				]
				tasks: 'compile'

	grunt.registerTask('run', ['watch:concat'])
	grunt.registerTask('compile', ['concat', 'coffeelint', 'coffee'])
