Queue = require '../../lib/queue'
MockSQS = require '../mock_sqs'

describe Queue, ->
  process.env.QUEUE_PREFIX='oc-postbin-local'

  describe "#send", ->
    it 'creates the named queue with the prefix', ->
      client = new MockSQS()
      q = new Queue client
      q.send("the_queue", "the message").should.equal true
      client.last_call().should.eql ["createQueue", "oc-postbin-local_the_queue"]
