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
    publish_date = gets.chomp
    puts 'Please enter the title of the game: '
    title = gets.chomp
    puts 'Please enter the color of the game: '
    color = gets.chomp
    created_game(multiplayer, last_played_at, publish_date)
    new_label = Label.new(title, color)
    @games << new_label
    puts 'Success'
  end
end
