require_relative '../classes/item'
require_relative '../classes/music/music_album'
require 'date'

describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when the album is old enough and present in Spotify' do
      it 'returns true' do
        publish_date = Date.today - (10 * 365)
        music_album = MusicAlbum.new(publish_date, true)
        # expect(music_album.can_be_archived?).to eq(true)
        expect(music_album.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when the album is not old enough and listed in Spotify' do
      it 'returns false' do
        publish_date = Date.today - (5 * 365)
        music_album = MusicAlbum.new(publish_date, true)
        # expect(music_album.can_be_archived?).to eq(false)
        expect(music_album.send(:can_be_archived?)).to eq(false)
      end
    end

    context 'when the album is old enough and not listed in Spotify' do
      it 'returns false' do
        publish_date = Date.today - (10 * 365)
        music_album = MusicAlbum.new(publish_date, false)
        # expect(music_album.can_be_archived?).to eq(false)
        expect(music_album.send(:can_be_archived?)).to eq(false)
      end
    end

    context 'when the album is not old enough and not listed in Spotify' do
      it 'returns false' do
        publish_date = Date.today - (5 * 365)
        music_album = MusicAlbum.new(publish_date, false)
        # expect(music_album.can_be_archived?).to eq(false)
        expect(music_album.send(:can_be_archived?)).to eq(false)
      end
    end
  end
end
