require 'json'

class PreserveBook
  DATA_FILE = 'books.json'.freeze

  def self.load_books
    if File.exist?(DATA_FILE)
      JSON.parse(File.read(DATA_FILE)).map do |book_data|
        Book.new(book_data['publisher'], book_data['cover_state'], Date.parse(book_data['publish_date']))
      end
    else
      []
    end
  end

  def self.save_books(books)
    book_data = books.map do |book|
      {
        'publisher' => book.publisher,
        'cover_state' => book.cover_state,
        'publish_date' => book.publish_date.to_s
      }
    end
    File.write(DATA_FILE, JSON.dump(book_data))
  end
end
