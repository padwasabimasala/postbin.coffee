class MockSQS
  constructor: (options) ->
    @options = options
    @history = ["init"]

  createQueue: (name, fn) ->
    @history.push(["createQueue", name])
    [null, ""]

  last_call: () ->
    last = @history.pop()
    @history.unshift last
    last

module.exports = MockSQS
