require_relative '../preserveData/preserve_game'

class GameManager
  attr_accessor :games

  def initialize
    @games = []
    @preserve_game = PreserveGame.new
  end

  def load_games
    @games = @preserve_game.load_games
  end

  def save_games
    @preserve_game.save_games(@games)
  end

  def add_game
    puts 'Please enter the multiplayer option (true/false):'
    multiplayer = gets.chomp.downcase == 'true'
    puts 'Please enter the last played at date:'
    last_played_at = gets.chomp
    puts 'Please enter the published date of the game:'
    puts 'Please enter the title of the game: '
    title = gets.chomp
    puts 'Please enter the color of the game: '
    color = gets.chomp
    new_game = Game.new(title, multiplayer, last_played_at)
    new_label = Label.new(title, color)
    new_label.add_item(new_game)
    @games << new_game
    puts 'Game added Successfully!'
    save_games
  end
end
