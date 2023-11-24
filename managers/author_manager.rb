require_relative '../preserveData/preserve_author'

class AuthorManager
  attr_accessor :authors

  def initialize
    @authors = []
    @preserve_author = PreserveAuthor.new
  end

  def load_authors
    @authors = @preserve_author.load_authors
  end

  def save_authors
    @preserve_author.save_authors(@authors)
  end

  def add_author
    puts 'Please enter the first name of the author:'
    first_name = gets.chomp
    puts 'Please enter the last name of the author:'
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    @authors << new_author
    save_authors
  end
end
