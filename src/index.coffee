fs = require 'fs'
CoffeeScript = require 'coffeescript'

module.exports = (lasso, config) -> lasso.dependencies.registerRequireType 'coffee',

	properties:
		path: 'string'

	init: (context, callback) ->
		if !@path
			error = new Error '"path" is required for a CoffeeScript dependency'
			return callback error if callback
			throw error
		@path = @resolvePath @path
		callback() if callback

	read: (context, callback) -> new Promise (resolve, reject) =>
		callback = callback || (err, res) -> if err then reject(err) else resolve(res)
		fs.readFile @path, {encoding: 'utf8'}, (err, code) ->
			return callback err if err
			compiledCode = CoffeeScript.compile code,
				bare: true
				transpile:
					presets: ['es2015']
			callback null, compiledCode

	getLastModified: (lassoContext, callback) ->
		if callback then callback null, -1 else -1
