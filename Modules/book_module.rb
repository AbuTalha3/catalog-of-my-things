require_relative '../classes/book/book'

module BookModule
  def created_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    puts "Book added: Publisher - #{book.publisher}, Cover state - #{book.cover_state}, Published Date - #{book.publish_date}"
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books to show'
    else
      puts 'List of books:'
      @books.each_with_index do |book, i|
        puts "#{i + 1}) Publisher: #{book.publisher}, Cover state: #{book.cover_state}, Published Date: #{book.publish_date}"
      end
    end
  end
end
