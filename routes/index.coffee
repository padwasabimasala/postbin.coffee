moment = require 'moment'
FixedList = require '../lib/fixed_list'
Queue = require '../lib/queue'

events_list = new FixedList(process.env.EVENT_LIST_SIZE || 50)
queue = new Queue

service_start = new Date()

stats = {
  uptime: 0,
  requests_per_second: 0,
  total_requests: 0,
  req_time_max: 0,
  req_time_min: 1000000,
  req_time_ave: 0,
  req_time_last: 0
}

round = (number) ->
  Math.round(number * 100) / 100

tally_stats = (time) ->
  stats.req_time_last = time

  ave = ((stats.total_requests * stats.req_time_ave) + time) / (stats.total_requests + 1)
  stats.req_time_ave = round ave

  stats.total_requests++

  if stats.req_time_max < time
    stats.req_time_max = time

  if stats.req_time_min > time
    stats.req_time_min = time

  stats.uptime =  Math.round(new Date() - service_start) / 1000
  stats.requests_per_second = round stats.total_requests / stats.uptime

  console.log 'took: ' + time + 'ms'


exports.index = (req, res) ->
  res.render('index', { stats: stats, events_list: events_list.items })

exports.create = (req, res) ->
  start = new Date()

  event = {
    created_at: moment(),
    name: req.params.event_name,
    headers: req.headers,
    body: req.body
  }

  queue.send event.name, JSON.stringify(event)
  console.log "received event"
  console.log JSON.stringify event, null, 2
  events_list.add event

  res.write ''
  res.end(tally_stats new Date() - start)
