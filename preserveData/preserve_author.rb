require 'json'
require_relative '../classes/games-and-authors/author'

class PreserveAuthor
  DATA_FOLDER = File.expand_path('../../authors.json', __dir__).freeze

  def load_authors
    return [] unless File.exist?(DATA_FOLDER)

    data = JSON.parse(File.read(DATA_FOLDER))
    authors = data['Authors']

    return [] unless authors.is_a?(Array)

    authors.map do |author_data|
      create_author_from_data(author_data)
    end
  end

  def save_authors(authors)
    File.open(DATA_FOLDER, 'w') do |file|
      data = {
        'Authors' => authors.map do |author|
          convert_author_to_data(author)
        end
      }
      file.write(JSON.pretty_generate(data))
    end
  end

  private

  def create_author_from_data(author_data)
    Author.new(author_data['first_name'], author_data['last_name'])
  end

  def convert_author_to_data(author)
    {
      'first_name' => author.first_name,
      'last_name' => author.last_name
    }
  end
end
