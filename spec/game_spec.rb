require_relative '../classes/games'

RSpec.describe Game do
  describe '#initialize' do
    it 'sets multiplayer attribute' do
      game = Game.new(true, Time.now)
      expect(game.multiplayer).to be true
    end

    it 'sets last_played_at attribute' do
      time = Time.now
      game = Game.new(true, time)
      expect(game.last_played_at).to eq(time)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true when last_played_at is older than 2 years' do
      two_years_ago = Time.now - (2 * 365 * 24 * 60 * 60)
      game = Game.new(true, two_years_ago)
      expect(game.can_be_archived?).to be true
    end

    it 'returns false when last_played_at is within 2 years' do
      one_year_ago = Time.now - (365 * 24 * 60 * 60)
      game = Game.new(true, one_year_ago)
      expect(game.can_be_archived?).to be false
    end
  end
end
