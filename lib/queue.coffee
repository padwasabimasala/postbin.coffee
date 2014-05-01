SQS = require 'aws-sqs'
MockSQS = require '../test/mock_sqs'

_select_client = () ->
  if process.env.NODE_ENV == 'test'
    new MockSQS()
  else
    new SQS(process.env.AWS_SQS_ID, process.env.AWS_SQS_KEY)

class Queue
  constructor: (client) ->
    @client = client || _select_client()
    @queues = {}

  send: (name, message) ->
    prefix = process.env.QUEUE_PREFIX || "queue_prefix_not_set_in_env"
    queue_name = prefix + '_' + name
    client = @client
    @client.createQueue queue_name, (err,res) ->
      if err
        console.log 'Error on createQueue: ' + err
      else

        console.log 'Atempting to send'
        console.log 'res -------------'
        console.dir res
        console.log 'message -------------'
        console.dir message

        client.sendMessage res, message, 0, (err, res) ->
          if err
            console.log 'Error on sendMessage: ' + err
          true

        console.log 'message sent'
      true
    true


module.exports = Queue

