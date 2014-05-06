express = require('express')
path = require('path')
app = express()

force_https = (req, res, next) ->
  schema = (req.headers['x-forwarded-proto'] || '').toLowerCase()
  if (schema == 'https')
    next()
  else
    res.redirect('https://' + req.headers.host + req.url)

app.set('port', process.env.PORT || 3000)
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'jade')
app.use(express.logger('dev'))
app.use(express.json())
app.use(express.urlencoded())
app.use(express.methodOverride())
app.use(app.router)
app.use(express.static(path.join(__dirname, 'public')))

app.configure 'production', () ->
  app.use force_https

app.configure 'development', () ->
  app.use express.errorHandler()

routes = require './routes'
app.get '/', routes.index
app.post '/posts/:event_name', routes.create

module.exports = app
