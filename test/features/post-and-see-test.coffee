supertest = require 'supertest'
app = require '../../app'
api = supertest app

describe 'A user can post and see it in the list of posts.', ->
  it 'Receives the build event with body and extra header', (done) ->
    api.post('/posts/this-is-the-name-of-the-build')
      .set('X-Build-Number', '2001')
      .send({ build_type: 'Milestones Royale' })
      .expect(200, done)

  it 'Shows the post with the event name, body, and extra header', (done) ->
    hasEventnameBodyAndHeader = (res) ->
      res.text.should.include('this-is-the-name-of-the-build')
      res.text.should.include('x-build-number')
      res.text.should.include('2001')
      res.text.should.include('Milestones Royale')
    api.get('/').expect(hasEventnameBodyAndHeader).expect(200, done())
