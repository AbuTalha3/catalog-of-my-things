require_relative '../preserveData/preserve_label'

class LabelManager
  attr_accessor :labels

  def initialize
    @labels = []
  end

  def load_labels
    @labels = PreserveLabel.load_labels
  end

  def save_labels
    PreserveLabel.save_labels(@labels)
  end

  def add_label
    puts 'Please enter the title of the label:'
    title = gets.chomp
    puts 'Please enter the color of the label:'
    color = gets.chomp
    new_label = Label.new(title, color)
    @labels << new_label
  end
end
