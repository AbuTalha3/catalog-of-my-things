require_relative '../item'
require_relative '../id_generator'
require_relative '../archivable'
require 'date'

class MusicAlbum < Item
  attr_reader :id, :on_spotify, :archivable, :title, :artist, :genre, :label

  def initialize(args = {})
    super(args[:publish_date])
    @id = IdGenerator.generate
    @title = args[:title]
    @artist = args[:artist]
    @genre = args[:genre]
    @label = args[:label]
    @on_spotify = args[:on_spotify]
    @archivable = args[:archivable] || Archivable.new(self, nil, nil, args[:on_spotify])
  end

  def to_s
    "Title: #{@title}, " \
      "Artist: #{@artist}, " \
      "Genre: #{@genre}, " \
      "Label: #{@label}"
  end

  def can_be_archived?
    @archivable.can_be_archived?
  end
end
