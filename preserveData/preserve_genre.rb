require 'json'
require_relative '../classes/music/genre'

class PreserveGenre
  DATA_FILE = 'genres.json'.freeze

  def self.load_genres
    return [] unless File.exist?(DATA_FILE)

    JSON.parse(File.read(DATA_FILE)).map do |genre_data|
      create_genre_from_data(genre_data)
    end
  end

  def self.save_genres(genres)
    genre_data = genres.map { |genre| convert_genre_to_data(genre) }
    File.write(DATA_FILE, JSON.pretty_generate(genre_data))
  end

  def self.create_genre_from_data(genre_data)
    Genre.new(genre_data['name'])
  end
  private_class_method :create_genre_from_data

  def self.convert_genre_to_data(genre)
    {
      'name' => genre.name
    }
  end
  private_class_method :convert_genre_to_data
end
