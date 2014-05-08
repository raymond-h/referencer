path = require 'path'
querystring = require 'querystring'
https = require 'https'

express = require 'express'
request = require 'request'

footnotes = require './footnotes'

app = express()

app.use express.logger()

app.use express.favicon path.join __dirname, '..', 'public/images/favicon.ico'

app.use '/components', express.static path.join __dirname, '..', 'bower_components'
app.use express.static path.join __dirname, '..', 'built-assets'
app.use express.static path.join __dirname, '..', 'public'

app.get '/footnote/:isbn', (req, res) ->
	{isbn} = req.params

	isbnBaseUrl = 'https://www.googleapis.com/books/v1/volumes'
	queryParams = querystring.stringify
		q: "isbn:#{isbn}"

	request "#{isbnBaseUrl}?#{queryParams}", (err, requestRes, body) ->
		if err?
			console.error err.stack
			res.writeHead 500, err.stack
			return

		console.log body

		res.json footnotes.generateFootnotes JSON.parse body

app.listen 80