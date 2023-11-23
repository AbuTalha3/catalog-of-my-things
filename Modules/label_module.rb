require_relative '../classes/book/label'

module LabelModule
  def list_all_labels
    if @labels.empty?
      puts 'There are no labels to show'
    else
      puts 'List of labels:'
      @labels.each_with_index do |label, _i|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
