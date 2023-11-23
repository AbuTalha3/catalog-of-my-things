require_relative '../id_generator'
require_relative '../item_manager'
require_relative '../item'

class Genre
  attr_reader :id, :name, :item_manager

  def initialize(name, item_manager = ItemManager.new)
    @id = IdGenerator.generate
    @name = name
    @item_manager = item_manager
  end

  def add_item(item)
    @item_manager.add_item(item)
    item.genre = self
  end

  def to_s
    "Genre Name: #{@name}"
  end
end
