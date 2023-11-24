require_relative '../preserveData/preserve_music'

class MusicManager
  attr_accessor :songs

  def initialize
    @songs = []
    @preserve_music = PreserveMusic.new
  end

  def load_music_album
    @songs = @preserve_music.load_music_album
  end

  def save_music_album
    @preserve_music.save_music_album(@songs)
  end

  def add_music_album
    puts 'Is it on spotify(yes/no)?'
    on_spotify = gets.chomp
    puts 'Publish date(DD/MM/YYYY): '
    publish_date = gets.chomp
    puts 'Enter a name'
    name = gets.chomp
    puts 'Enter artist'
    artist = gets.chomp
    puts 'Enter genre'
    genre = gets.chomp
    puts 'Enter label'
    label = gets.chomp
    new_album = MusicAlbum.new({
                                 on_spotify: on_spotify,
                                 publish_date: publish_date,
                                 title: name,
                                 artist: artist,
                                 genre: genre,
                                 label: label
                               })
    @songs << new_album
    save_music_album
  end
end
