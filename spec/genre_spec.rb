require_relative '../classes/music/genre'
require_relative '../classes/item'

describe Genre do
  before :each do
    @genre = Genre.new('Rock')
  end

  context 'test add item method' do
    it 'should return an array of item' do
      item = Item.new('2007/03/01', archived: true)
      @genre.add_item(item)
      expect(@genre.items).to eq([item])
    end
  end

  context '#test genre' do
    it 'should return correct name of genre' do
      expect(@genre.name).to eq('Rock')
    end
  end
end
