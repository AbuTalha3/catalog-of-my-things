require_relative '../item'
require_relative '../../preserveData/preserve_book'
require_relative '../archivable'

class Book
  attr_accessor :publisher, :cover_state, :publish_date, :title, :color

  def initialize(args = {})
    @title = args[:title]
    @publisher = args[:publisher]
    @cover_state = args[:cover_state]
    @publish_date = args[:publish_date]
    @color = args[:color]
    @item = args[:item] || Item.new(args[:publish_date])
    @archivable = args[:archivable] || Archivable.new(@item, args[:cover_state])
  end

  def to_s
    "Title: #{title}, " \
      "Publisher: #{publisher}, " \
      "Cover State: #{cover_state}, " \
      "Publish Date: #{publish_date}, " \
      "Color: #{color}"
  end

  def can_be_archived?
    @archivable.can_be_archived?
  end
end
