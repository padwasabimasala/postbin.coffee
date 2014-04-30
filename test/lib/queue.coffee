Queue = require '../../lib/queue'

describe Queue, ->
  it 'can send', ->
    q = new Queue
    q.send("the_queue", "the message").should.equal true
