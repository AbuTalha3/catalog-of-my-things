require_relative '../classes/music/genre'

module GenreModule
  def list_all_genres
    if @genres.empty?
      puts 'There are no genres'
    else
      puts 'List of genres:'
      @genres.each_with_index do |genre, i|
        puts "Number: #{i + 1}, ID: #{genre.id}, Name: #{genre.name}"
      end
    end
  end
end
