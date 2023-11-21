require_relative '../item'
require 'date'

class MusicAlbum < Item
  attr_reader :id, :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @id = Random.rand(1...1000)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) >= 10 && @on_spotify == true
  end
end
