express = require('express')
path = require('path')
app = express()

app.set('port', process.env.PORT || 3000)
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'jade')
app.use(express.logger('dev'))
app.use(express.json())
app.use(express.urlencoded())
app.use(express.methodOverride())
app.use(app.router)
app.use(express.static(path.join(__dirname, 'public')))

if ('development' == app.get('env'))
  app.use(express.errorHandler())

routes = require('./routes')
app.get('/', routes.index)
app.post('/posts/:event_name', routes.create)

module.exports = app
