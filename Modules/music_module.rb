require_relative '../classes/music/music_album'

module MusicModule
  def added_a_music_album(publish_date, on_spotify)
    song = MusicAlbum.new(publish_date, on_spotify)
    @songs << song
    puts 'Music album added successfully'
  end

  def list_all_music_albums
    if @songs.empty?
      puts 'There are no music album'
    else
      @songs.each_with_index do |song, i|
        puts "Number: #{i + 1}, Is it on spotify?: #{song.on_spotify},
            Publish Date: #{song.publish_date}"
      end
    end
  end

  def save_music_album_to_file(songs)
    @music_album_data.save_music_album(songs)
  end
end
