require_relative '../item'
require_relative '../../preserveData/preserve_book'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
