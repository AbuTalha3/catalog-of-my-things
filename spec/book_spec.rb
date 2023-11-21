require_relative '../classes/item'
require_relative '../classes/book/book'

describe Book do
  before :each do
    publish_date = Date.parse('2023-10-10')
    @book = Book.new('Publisher', 'bad', publish_date)
  end

  describe 'Initialize parameters' do
    it 'throws an ArgumentError when given less than 3 arguments' do
      expect { Book.new('Publisher', 'bad') }.to raise_error(ArgumentError)
    end
  end

  describe '#can_be_archived?' do
    it 'if the cover state is bad, it should return true' do
      result = @book.send(:can_be_archived?)
      expect(result).to be(true)
    end
  end
end
