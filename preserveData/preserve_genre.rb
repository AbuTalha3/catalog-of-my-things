require 'json'

class PreserveGenre
  DATA_FILE = 'genre.json'.freeze

  def self.load_genres
    if File.exist?(DATA_FILE)
      JSON.parse(File.read(DATA_FILE)).map do |genre_data|
        Genre.new(genre_data['name'])
      end
    else
      []
    end
  end

  def self.save_genres(genres)
    genre_data = genres.map do |genre|
      {
        'name' => genre.name
      }
    end
    File.write(DATA_FILE, JSON.dump(genre_data))
  end
end
