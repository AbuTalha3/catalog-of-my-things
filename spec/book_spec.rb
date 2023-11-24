require_relative '../classes/item'
require_relative '../classes/book/book'

describe Book do
  before :each do
    @publish_date = Date.parse('2023-10-10')
    @book = Book.new(publisher: 'Publisher', cover_state: 'bad', publish_date: @publish_date)
  end

  describe 'Initialize parameters' do
    it 'creates a book with the given publisher, cover_state, and publish_date' do
      expect(@book.publisher).to eq 'Publisher'
      expect(@book.cover_state).to eq 'bad'
      expect(@book.publish_date).to eq @publish_date
    end
  end

  describe '#can_be_archived?' do
    it 'if the cover state is bad, it should return true' do
      expect(@book.check_if_can_be_archived).to be(true)
    end

    it 'if the cover state is not bad, it should return false' do
      book = Book.new(publisher: 'Publisher', cover_state: 'good', publish_date: @publish_date)
      expect(book.check_if_can_be_archived).to be(false)
    end
  end
end
