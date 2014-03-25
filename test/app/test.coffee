supertest = require 'supertest'
app = require '../../app'

describe 'app', ->
  it 'returns the index', (done) ->
    api = supertest app
    api.get('/').expect(200, done)

  it 'accepts posts to index', (done) ->
    api = supertest app
    api.post('/').send({ name: "Any Name" }).expect(200, done)
