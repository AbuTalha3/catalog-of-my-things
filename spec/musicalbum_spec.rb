require_relative '../classes/item'
require_relative '../classes/music/music_album'
require 'date'

RSpec.describe MusicAlbum do
  let(:old_date) { Date.today - (10 * 365) }
  let(:recent_date) { Date.today - (5 * 365) }

  describe 'Initialization' do
    it 'sets the publish_date, on_spotify, and archivable attributes' do
      music_album = MusicAlbum.new(publish_date: old_date, on_spotify: true)
      expect(music_album.publish_date).to eq(old_date)
      expect(music_album.on_spotify).to be_truthy
      expect(music_album.archivable).not_to be_nil
    end

    it 'generates an id' do
      music_album = MusicAlbum.new(publish_date: old_date, on_spotify: true)
      expect(music_album.id).not_to be_nil
    end
  end

  describe '#can_be_archived?' do
    context 'when the album is old enough and present in Spotify' do
      it 'returns true' do
        music_album = MusicAlbum.new(publish_date: old_date, on_spotify: true)
        expect(music_album.can_be_archived?).to eq(true)
      end
    end

    context 'when the album is not old enough and listed in Spotify' do
      it 'returns false' do
        music_album = MusicAlbum.new(publish_date: recent_date, on_spotify: true)
        expect(music_album.can_be_archived?).to eq(false)
      end
    end

    context 'when the album is old enough and not listed in Spotify' do
      it 'returns false' do
        music_album = MusicAlbum.new(publish_date: old_date, on_spotify: false)
        expect(music_album.can_be_archived?).to eq(false)
      end
    end

    context 'when the album is not old enough and not listed in Spotify' do
      it 'returns false' do
        music_album = MusicAlbum.new(publish_date: recent_date, on_spotify: false)
        expect(music_album.can_be_archived?).to eq(false)
      end
    end
  end
end
