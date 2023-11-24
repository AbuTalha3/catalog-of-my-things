require './app'

def main
  app = App.new
  app.load_data

  loop do
    prompter
    option = gets.chomp.to_i
    options = get_options(app)
    case option
    when 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13
      options[option].call
    end
  end
end

def get_options(app)
  {
    1 => -> { app.list_all_books },
    2 => -> { app.list_all_music_albums },
    3 => -> { app.list_all_games },
    4 => -> { app.list_all_genres },
    5 => -> { app.list_all_labels },
    6 => -> { app.list_all_authors },
    7 => -> { app.add_book },
    8 => -> { app.add_a_music_album },
    9 => -> { app.add_game },
    10 => -> { app.add_author },
    11 => -> { app.add_genre },
    12 => -> { app.add_label },
    13 => lambda {
      app.save_data
      puts 'Goodbye! See you Soon:)'
      exit
    }
  }
end

def prompter
  puts ' '
  puts 'Welcome to Our App!'
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all games'
  puts '4 - List all genres'
  puts '5 - List all labels'
  puts '6 - List all authors'
  puts '7 - Add a book'
  puts '8 - Add a music album'
  puts '9 - Add a game'
  puts '10 - Add an author'
  puts '11 - Add a genre'
  puts '12 - Add a label'
  puts '13 - Exit'
end

main
