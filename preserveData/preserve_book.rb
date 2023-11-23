require 'json'
require_relative '../classes/book/book'

class PreserveBook
  DATA_FILE = 'books.json'.freeze

  def self.load_books
    return [] unless File.exist?(DATA_FILE)

    JSON.parse(File.read(DATA_FILE)).map do |book_data|
      create_book_from_data(book_data)
    end
  end

  def self.save_books(books)
    book_data = books.map { |book| convert_book_to_data(book) }
    File.write(DATA_FILE, JSON.dump(book_data))
  end

  def self.create_book_from_data(book_data)
    publish_date = valid_date?(book_data['publish_date']) ? Date.parse(book_data['publish_date']) : nil

    Book.new(
      title: book_data['title'],
      publisher: book_data['publisher'],
      cover_state: book_data['cover_state'],
      publish_date: publish_date
    )
  end
  private_class_method :create_book_from_data

  def self.convert_book_to_data(book)
    {
      'title' => book.title,
      'publisher' => book.publisher,
      'cover_state' => book.cover_state,
      'publish_date' => book.publish_date.to_s
    }
  end
  private_class_method :convert_book_to_data

  def self.valid_date?(date_string)
    !date_string.nil? && !date_string.empty? && Date.parse(date_string) rescue false
  end
  private_class_method :valid_date?
end
