require_relative 'Modules/music_module'
require_relative 'classes/music/music_album'
require_relative 'Modules/genre_module'
require_relative 'Modules/book_module'
require_relative 'classes/book/book'
require_relative 'Modules/label_module'
require_relative 'preserveData/preserve_music'
require_relative 'preserveData/preserve_genre'
require_relative 'Modules/game_module'
require_relative 'Modules/author_module'

class App
  attr_accessor :books, :games, :music, :genres, :authors, :labels

  include MusicModule
  include GenreModule
  include BookModule
  include LabelModule
  include GameModule
  include AuthorModule

  def initialize
    @songs = []
    @books = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @music_album_data = MusicManager.new
    load_data
  end

  def load_data
    @books = PreserveBook.load_books
    @labels = PreserveLabel.load_labels
    @songs = @music_album_data.load_music_album
    @genres = PreserveGenre.load_genres
    @games = load_games
    @authors = load_authors
  end

  def save_data
    PreserveBook.save_books(@books)
    PreserveLabel.save_labels(@labels)
    PreserveGenre.save_genres(@genres)
    music_manager = MusicManager.new
    music_manager.save_music_album(@songs)
    save_games
    save_authors
  end

  def create_musicalbum
    MusicModule.add_music_album(self)
  end

  def add_book(app)
    puts 'Please enter the Publisher:'
    publisher = gets.chomp
    puts 'Please enter the covers state:'
    cover_state = gets.chomp
    puts 'Please enter the published date of the book:'
    publish_date = gets.chomp
    puts 'Please enter the title of the book: '
    title = gets.chomp
    puts 'Please enter the color of the book: '
    color = gets.chomp
    app.created_book(publisher, cover_state, publish_date)
    new_label = Label.new(title, color)
    @labels << new_label
  end

  def add_a_music_album
    puts 'Is it on spotify?'
    on_spotify = gets.chomp
    puts 'Publish date: '
    publish_date = gets.chomp
    puts 'Enter a name'
    name = gets.chomp
    added_a_music_album(publish_date, on_spotify)
    new_genre = Genre.new(name)
    @genres << new_genre
  end
end
App.new
