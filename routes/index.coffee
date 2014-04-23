moment = require 'moment'

FixedList = require '../lib/fixed_list'
events_list = new FixedList(process.env.EVENT_LIST_SIZE || 50)

exports.index = (req, res) ->
  res.render('index', { events_list: events_list.items })

exports.create = (req, res) ->
  event = {
    created_at: moment(),
    name: req.params.event_name,
    headers: req.headers,
    body: req.body
  }
  console.log JSON.stringify event, null, 2
  events_list.add event
  res.write ''
  res.end()
