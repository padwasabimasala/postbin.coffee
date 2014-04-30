class Queue
  constructor: (client) ->
    @client = client
    @queues = {}

  send: (name, message) ->
    @client.createQueue name, (err,res) ->
      if err
        console.log 'Error on createQueue: ' + err
      else
        @client.sendMessage res, message, 0, (err, res) ->
          if err
            console.log 'Error on sendMessage: ' + err
          true
      true
    true

module.exports = Queue

