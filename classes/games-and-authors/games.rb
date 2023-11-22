require 'json'

class Game
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    (Time.now - @last_played_at) >= 2 * 365 * 24 * 60 * 60
  end
end
