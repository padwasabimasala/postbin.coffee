FixedList = require '../../lib/fixed_list'

describe FixedList, ->
  it 'has a default size of 100', ->
    fixed_list = new FixedList
    fixed_list.size.should.equal 100

  it 'has a size', ->
    fixed_list = new FixedList(3)
    fixed_list.size.should.equal 3


