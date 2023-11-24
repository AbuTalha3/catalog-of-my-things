require 'json'

class PreserveLabel
  DATA_FILE = 'labels.json'.freeze

  def self.load_labels
    if File.exist?(DATA_FILE)
      JSON.parse(File.read(DATA_FILE)).map do |label_data|
        Label.new(label_data['title'], label_data['color'])
      end
    else
      []
    end
  end

  def self.save_labels(labels)
    label_data = labels.map do |label|
      {
        'title' => label.title,
        'color' => label.color
      }
    end
    File.write(DATA_FILE, JSON.dump(label_data))
  end
end
