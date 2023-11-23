require_relative '../../preserveData/preserve_label'
require_relative '../id_generator'
require_relative '../item_manager'

class Label
  attr_accessor :id, :title, :color, :item_manager

  def initialize(title, color, item_manager = ItemManager.new)
    @id = IdGenerator.generate
    @title = title
    @color = color
    @item_manager = item_manager
  end

  def add_item(item)
    @item_manager.add_item(item)
    item.label = self
  end

  def to_s
    "Label Name: #{@title}"
  end
end
