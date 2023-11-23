require 'json'
require_relative '../archivable'

class Game
  attr_accessor :name, :multiplayer, :last_played_at, :archivable

  def initialize(name, multiplayer, last_played_at, archivable = Archivable.new(nil, nil, last_played_at))
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archivable = archivable
  end

  def can_be_archived?
    @archivable.can_be_archived?
  end

  def to_s
    "Multiplayer: #{@multiplayer}, Last Played At: #{@last_played_at}"
  end
end
