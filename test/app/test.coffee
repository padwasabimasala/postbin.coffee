supertest = require 'supertest'
app = require '../../app'

describe 'app', ->
  it 'returns the index', (done) ->
    api = supertest app
    api.get('/').expect(200, done)
