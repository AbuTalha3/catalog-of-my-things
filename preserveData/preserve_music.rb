require 'json'
require_relative '../classes/music/music_album'

class PreserveMusic
  DATA_FOLDER = 'music.json'.freeze

  def load_music_album
    return [] unless File.exist?(DATA_FOLDER)

    data = JSON.parse(File.read(DATA_FOLDER))
    data['MusicAlbums'].map do |music_album_data|
      create_music_album_from_data(music_album_data)
    end
  end

  def save_music_album(songs)
    File.open(DATA_FOLDER.to_s, 'w') do |file|
      data = {
        'MusicAlbums' => songs.map do |song|
                           convert_music_album_to_data(song)
                         end
      }
      file.write(JSON.pretty_generate(data))
    end
  end

  def self.save_music_album(songs)
    File.write('music_albums.json', JSON.pretty_generate(songs))
  end

  private

  def create_music_album_from_data(music_album_data)
    MusicAlbum.new(
      title: music_album_data['title'],
      artist: music_album_data['artist'],
      genre: music_album_data['genre'],
      label: music_album_data['label'],
      publish_date: music_album_data['publish_date'],
      on_spotify: music_album_data['on_spotify']
    )
  end

  def convert_music_album_to_data(song)
    {
      'title' => song.title,
      'artist' => song.artist,
      'genre' => song.genre,
      'label' => song.label,
      'publish_date' => song.publish_date,
      'on_spotify' => song.on_spotify
    }
  end
end
