supertest = require 'supertest'
app = require '../../app'

describe 'app', ->
  it 'returns the index', (done) ->
    api = supertest app
    api.get('/').expect(200, done)

  it 'accepts posts to /posts/:name', (done) ->
    api = supertest app
    api.post('/posts/event-name').send({ value: "Any Value" }).expect(200, done)
