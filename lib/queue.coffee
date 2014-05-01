SQS = require 'aws-sqs'

class Queue
  constructor: (client) ->
    # TODO pivot based on process.env.NODE_ENV
    @client = client || new SQS(process.env.AWS_SQS_ID, process.env.AWS_SQS_KEY)
    @queues = {}

  send: (name, message) ->
    prefix = process.env.QUEUE_PREFIX || "queue_prefix_not_set_in_env"
    queue_name = prefix + '.' + name
    @client.createQueue queue_name, (err,res) ->
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

