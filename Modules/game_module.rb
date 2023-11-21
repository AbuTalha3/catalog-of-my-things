require_relative '../classes/games-and-authors/games'
require_relative '../classes/games-and-authors/author'
require 'json'

module GameModule
  def list_all_games
    if @games.empty?
      puts 'No games in the list.'
    else
      puts 'List of games:'
      @games.each_with_index do |game, _index|
        puts "Multiplayer: #{game.multiplayer}, Last Played At: #{game.last_played_at}"
      end
    end
  end

  def add_game
    print 'Is the game multiplayer? (yes/no): '
    multiplayer_input = gets.chomp.downcase
    multiplayer = multiplayer_input == 'yes'

    print 'Enter the last played date (YYYY-MM-DD):'
    date_input = gets.chomp

    begin
      last_played_at = Date.parse(date_input).to_time
    rescue ArgumentError
      puts 'Invalid date format. Please use YYYY-MM-DD.'
      add_game
    end

    game = Game.new(multiplayer, last_played_at)
    @games << game

    puts 'Author First and last name:'
    print 'FirstName: '
    author_first_name = gets.chomp
    print('LastName: ')
    author_last_name = gets.chomp
    author = Author.new(author_first_name, author_last_name)
    @authors << author
    puts 'Game added successfully with author'
  end

  def load_games
    gamefile = 'game.json'.freeze
    if File.exist?(gamefile)
      JSON.parse(File.read(gamefile)).map do |game|
        Game.new(game['multiplayer'], game['last_played_at'])
      end
    else
      []
    end
  end

  def save_games
    gamefile = 'game.json'.freeze
    game_data = @games.map do |game|
      {
        'multiplayer' => game.multiplayer.to_s,
        'last_played_at' => game.last_played_at.to_s
      }
    end
    File.write(gamefile, JSON.dump(game_data))
  end
end
