express = require 'express'
path = require 'path'
routes = require './routes'
app = express()

app.set 'port', process.env.PORT || 3000
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

# Force https in prod
app.configure 'production', () ->
  app.use (req, res, next) ->
    schema = (req.headers['x-forwarded-proto'] || '').toLowerCase()
    if (schema == 'https')
      next()
    else
      console.log 'redirecting to https'
      res.redirect 'https://' + req.headers.host + req.url

app.configure 'development', () ->
  app.use express.errorHandler()

app.use express.logger('dev')
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, 'public'))

app.get '/', routes.index
app.post '/posts/:event_name', routes.create

module.exports = app
