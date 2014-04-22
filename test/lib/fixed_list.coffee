FixedList = require '../../lib/fixed_list'

describe FixedList, ->
  it 'has a default size of 100', ->
    fixed_list = new FixedList
    fixed_list.size.should.equal 100

  it 'has a size', ->
    fixed_list = new FixedList(3)
    fixed_list.size.should.equal 3

  it 'adds items', ->
    fixed_list = new FixedList(3)
    fixed_list.add 1

  it 'returns the items', ->
    fixed_list = new FixedList(3)
    fixed_list.add 1
    fixed_list.items.should.eql [1]

  it 'stays a fixed size', ->
    fixed_list = new FixedList(3)
    fixed_list.add 1
    fixed_list.add 2
    fixed_list.add 3
    fixed_list.add 4
    fixed_list.items.should.eql [4,3,2]




