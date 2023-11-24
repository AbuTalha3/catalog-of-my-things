require 'date'
require_relative 'id_generator'

class Item
  attr_accessor :publish_date, :archived, :id
  attr_reader :genre

  def initialize(publish_date, archived: true)
    @id = IdGenerator.generate
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date || Date.today
    @archived = archived
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def genre=(genre)
    @genre = genre
    genre.item_manager.add_item(self) unless genre.item_manager.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) >= 10
  end
end
