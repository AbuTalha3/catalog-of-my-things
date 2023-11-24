require 'json'
require_relative '../classes/games-and-authors/games'

class PreserveGame
  DATA_FOLDER = 'games.json'.freeze

  def load_games
    return [] unless File.exist?(DATA_FOLDER)
    return [] if File.empty?(DATA_FOLDER)

    data = JSON.parse(File.read(DATA_FOLDER))
    data['Games'].map do |game_data|
      create_game_from_data(game_data)
    end
  end

  def save_games(games)
    File.open(DATA_FOLDER, 'w') do |file|
      data = {
        'Games' => games.map do |game|
          convert_game_to_data(game)
        end
      }
      file.write(JSON.pretty_generate(data))
    end
  end

  private

  def create_game_from_data(game_data)
    Game.new(game_data['name'], game_data['multiplayer'], game_data['last_played_at'])
  end

  def convert_game_to_data(game)
    {
      'name' => game.name,
      'multiplayer' => game.multiplayer,
      'last_played_at' => game.last_played_at
    }
  end
end
