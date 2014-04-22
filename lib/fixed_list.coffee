FixedList = (size) ->
  this.size = size || 100

FixedList.prototype.add = (item) ->
  console.log item

module.exports = FixedList
