require 'json'
require_relative '../classes/book/label'

class PreserveLabel
  DATA_FILE = 'labels.json'.freeze

  def self.load_labels
    return [] unless File.exist?(DATA_FILE)

    JSON.parse(File.read(DATA_FILE)).map do |label_data|
      create_label_from_data(label_data)
    end
  end

  def self.save_labels(labels)
    label_data = labels.map { |label| convert_label_to_data(label) }
    File.write(DATA_FILE, JSON.pretty_generate(label_data))
  end

  def self.create_label_from_data(label_data)
    Label.new(label_data['title'], label_data['color'])
  end
  private_class_method :create_label_from_data

  def self.convert_label_to_data(label)
    {
      'title' => label.title,
      'color' => label.color
    }
  end
  private_class_method :convert_label_to_data
end
