class ItemManager
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
