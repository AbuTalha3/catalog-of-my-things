module AuthorModule
  def save_authors
    authors_data = []
    @authors.each do |author|
      authors_data << { first_name: author.first_name, last_name: author.last_name }
    end
    File.write('authors.json', JSON.dump(authors_data))
  end

  def load_authors
    authorfile = 'authors.json'.freeze
    if File.exist?(authorfile)
      JSON.parse(File.read(authorfile)).map do |author|
        Author.new(author['first_name'], author['last_name'])
      end
    else
      []
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'No author found'
    else
      puts 'List of Authors'
    end
    @authors.each_with_index do |author, i|
      print "\n #{i + 1}) Author First Name:", author.first_name, ', '
      print 'Author Last Name:', author.last_name
    end
  end
end
