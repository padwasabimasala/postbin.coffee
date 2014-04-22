class FixedList
  constructor: (size) ->
    @size = size || 100
    @items = []

  add: (item) ->
    @items.push item


module.exports = FixedList
