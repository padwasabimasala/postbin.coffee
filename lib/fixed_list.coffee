class FixedList
  constructor: (size) ->
    @size = size || 100
    @items = []

  add: (item) ->
    @items.unshift item
    if @items.length > @size
      @items.pop()

module.exports = FixedList
