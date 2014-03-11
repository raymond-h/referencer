path = require 'path'

express = require 'express'

app = express()

app.use express.logger()

app.use express.favicon path.join __dirname, '..', 'public/images/favicon.ico'

app.use '/components', express.static path.join __dirname, '..', 'bower_components'
app.use express.static path.join __dirname, '..', 'built-assets'
app.use express.static path.join __dirname, '..', 'public'

app.listen 80