moment = require 'moment'
FixedList = require '../lib/fixed_list'
Queue = require '../lib/queue'

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

events_list = new FixedList(process.env.EVENT_LIST_SIZE || 50)
client = new MockClient
queue = new Queue client

exports.index = (req, res) ->
  res.render('index', { events_list: events_list.items })

exports.create = (req, res) ->
  event = {
    created_at: moment(),
    name: req.params.event_name,
    headers: req.headers,
    body: req.body
  }
  queue.send event.name, JSON.stringify(event)
  console.log JSON.stringify event, null, 2
  events_list.add event
  res.write ''
  res.end()
