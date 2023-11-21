require_relative '../classes/book/label'

module LabelModule
  def list_all_labels
    if @labels.empty?
      puts 'There are no labels to show'
    else
      @labels.each_with_index do |label, _i|
        puts 'List of labels:'
        puts "Title: #{label.title}, color: #{label.color}"
      end
    end
  end
end
