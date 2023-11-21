require_relative '../classes/book/label'
require_relative '../classes/item'

describe Label do
  before :each do
    @label = Label.new('title', 'color')
  end

  context 'add_item method' do
    it 'should return an array of item' do
      item = Item.new('2023/08/09', archived: true)
      @label.add_item(item)
      expect(@label.items).to eq([item])
    end
  end

  context 'test the inputs' do
    it 'should return correct value of title' do
      @label = Label.new('title', 'color')
      expect(@label.title).to eq('title')
    end

    it 'should return correct value of color' do
      @label = Label.new('title', 'color')
      expect(@label.color).to eq('color')
    end
  end
end
