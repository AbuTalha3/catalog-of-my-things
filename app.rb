require_relative 'managers/book_manager'
require_relative 'managers/game_manager'
require_relative 'managers/music_manager'
require_relative 'managers/genre_manager'
require_relative 'managers/author_manager'
require_relative 'managers/label_manager'

class App
  attr_accessor :book_manager, :game_manager, :music_manager, :genre_manager, :author_manager, :label_manager

  def initialize
    @book_manager = BookManager.new
    @game_manager = GameManager.new
    @music_manager = MusicManager.new
    @genre_manager = GenreManager.new
    @author_manager = AuthorManager.new
    @label_manager = LabelManager.new
    load_data
  end

  def list_all_books
    @book_manager.all_books.each do |book|
      puts book
    end
  end

  def list_all_music_albums
    @music_manager.songs.each do |song|
      puts song
    end
  end

  def list_all_games
    @game_manager.games.each do |game|
      puts game
    end
  end

  def list_all_genres
    @genre_manager.genres.each do |genre|
      puts genre
    end
  end

  def list_all_labels
    @label_manager.labels.each do |label|
      puts label
    end
  end

  def list_all_authors
    @author_manager.authors.each do |author|
      puts author
    end
  end

  def load_data
    @book_manager.load_books
    @label_manager.load_labels
    @music_manager.load_music_album
    @genre_manager.load_genres
    @game_manager.load_games
    @author_manager.load_authors
  end

  def save_data
    @book_manager.save_books
    @label_manager.save_labels
    @genre_manager.save_genres
    @music_manager.save_music_album
    @game_manager.save_games
    @author_manager.save_authors
  end

  def create_musicalbum
    @music_manager.add_music_album
  end

  def add_book
    @book_manager.add_book
  end

  def add_a_music_album
    @music_manager.add_music_album
  end

  def add_game
    puts 'Enter game name:'
    name = gets.chomp
    puts 'Is the game multiplayer? (yes/no)'
    multiplayer = gets.chomp.downcase == 'yes'
    puts 'When was the game last played? (DD/MM/YYYY)'
    last_played_at = Date.strptime(gets.chomp, '%d/%m/%Y')
    game = Game.new(name, multiplayer, last_played_at)
    @game_manager.games << game
  end
end

App.new
