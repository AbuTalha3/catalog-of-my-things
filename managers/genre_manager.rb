require_relative '../preserveData/preserve_genre'

class GenreManager
  attr_accessor :genres

  def initialize
    @genres = []
  end

  def load_genres
    @genres = PreserveGenre.load_genres
  end

  def save_genres
    PreserveGenre.save_genres(@genres)
  end

  def add_genre
    puts 'Please enter the name of the genre:'
    name = gets.chomp
    new_genre = Genre.new(name)
    @genres << new_genre
    save_genres
  end
end
