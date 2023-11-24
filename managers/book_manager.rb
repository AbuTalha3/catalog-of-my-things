require_relative '../preserveData/preserve_book'

class BookManager
  attr_accessor :books

  def initialize
    @books = []
  end

  def load_books
    @books = PreserveBook.load_books
  end

  def save_books
    PreserveBook.save_books(@books)
  end

  def created_book(publisher, cover_state, publish_date)
    Book.new(publisher, cover_state, publish_date)
  end

  def all_books
    @books
  end

  def add_book
    puts 'Please enter the Publisher:'
    publisher = gets.chomp
    puts 'Please enter the covers state(good/bad):'
    cover_state = gets.chomp
    puts 'Please enter the published date of the book(DD/MM/YYYY):'
    publish_date = gets.chomp
    puts 'Please enter the title of the book: '
    title = gets.chomp
    puts 'Please enter the color of the book: '
    color = gets.chomp
    new_book = Book.new({
                          publisher: publisher,
                          cover_state: cover_state,
                          publish_date: publish_date,
                          title: title,
                          color: color
                        })
    @books << new_book
    save_books
  end
end
