
describe 'Array', ->
    describe '#indexOf', ->
      it 'should return -1 when not present', ->
        [1,2,3].indexOf(4).should.equal -1

      it 'should return 1 when the second elm matches', ->
        [1,2,3].indexOf(2).should.equal 1
