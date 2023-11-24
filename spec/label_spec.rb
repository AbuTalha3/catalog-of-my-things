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
      expect(@label.item_manager.items).to eq([item])
    end

    it 'should return an array of multiple items' do
      item1 = Item.new('2023/08/09', archived: true)
      item2 = Item.new('2024/09/10', archived: false)
      @label.add_item(item1)
      @label.add_item(item2)
      expect(@label.item_manager.items).to eq([item1, item2])
    end

    it 'should return an empty array when no items are added' do
      expect(@label.item_manager.items).to eq([])
    end
  end

  context 'test the inputs' do
    it 'should return correct value of title' do
      expect(@label.title).to eq('title')
    end

    it 'should return correct value of color' do
      expect(@label.color).to eq('color')
    end

    it 'should have an id' do
      expect(@label.id).not_to be_nil
    end

    it 'should have an item_manager' do
      expect(@label.item_manager).not_to be_nil
    end
  end
end
