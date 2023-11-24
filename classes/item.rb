require 'date'

class Item
  attr_accessor :publish_date, :archived

  def initialize(publish_date, archived: true)
    @id = Random.rand(1..1000)
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
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) >= 10
  end
end
