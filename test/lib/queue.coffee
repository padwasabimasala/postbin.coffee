Queue = require '../../lib/queue'

class MockClient
  constructor: (options) ->
    @options = options
    @history = ["init"]

  createQueue: (name, fn) ->
    @history.push(["createQueue", name])
    console.dir @history
    [null, ""]

  last_call: () ->
    last = @history.pop()
    @history.unshift last
    last

describe Queue, ->
  process.env.QUEUE_PREFIX='oc-postbin-local'

  describe "#send", ->
    it 'creates the named queue with the prefix', ->
      client = new MockClient
      q = new Queue client
      q.send("the_queue", "the message").should.equal true
      client.last_call().should.eql ["createQueue", "oc-postbin-local.the_queue"]
