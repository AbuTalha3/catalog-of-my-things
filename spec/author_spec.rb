require_relative '../classes/games-and-authors/author'
require_relative '../classes/games-and-authors/games'
require_relative '../classes/item'

describe 'Testing Author classes' do
  before(:context) do
    @author = Author.new('Osman', 'Wako')
  end

  context 'Testing Author instance and Method' do
    it 'Testing first_name instance' do
      expect(@author.first_name).to eq 'Osman'
    end

    it 'Testing last_name instance ' do
      expect(@author.last_name).to eq 'Wako'
    end

    it 'Testing add_items method' do
      @item = Item.new('2020-01-01')
      @author.add_item(@item)
      expect(@author.items).to include(@item)
    end
  end
end
