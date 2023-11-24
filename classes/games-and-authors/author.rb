require_relative '../id_generator'
require_relative '../item_manager'

class Author
  attr_reader :id, :first_name, :last_name, :item_manager

  def initialize(first_name, last_name, item_manager = ItemManager.new)
    @id = IdGenerator.generate
    @first_name = first_name
    @last_name = last_name
    @item_manager = item_manager
  end

  def add_item(item)
    @item_manager.add_item(item)
    item.author = self
  end

  def items
    @item_manager.items
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
