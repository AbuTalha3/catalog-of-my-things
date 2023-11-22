require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super(Date.today)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    (Time.now - @last_played_at) >= 2 * 365 * 24 * 60 * 60
  end
end
