require 'date'
require_relative '../classes/item'

RSpec.describe Item do
  let(:current_year) { Date.today.year }
  let(:ten_years_ago) { Date.today - (10 * 365) }

  describe 'Initialization' do
    context 'when no publish date is provided' do
      it 'sets the publish_date to the current date' do
        item = Item.new(nil)
        expect(item.publish_date).to eq(Date.today)
      end
    end

    context 'when a publish date is provided' do
      it 'sets the publish_date to the provided date' do
        publish_date = Date.new(2010, 1, 1)
        item = Item.new(publish_date)
        expect(item.publish_date).to eq(publish_date)
      end
    end

    it 'sets the archived to true by default' do
      item = Item.new(Date.new(2010, 1, 1))
      expect(item.archived).to be_truthy
    end
  end

  describe '#can_be_archived?' do
    it 'returns true for an item published more than 10 years ago' do
      item = Item.new(ten_years_ago)
      # expect(item.can_be_archived?).to be_truthy
      expect(item.send(:can_be_archived?)).to be_truthy
    end

    it 'returns false for an item published less than 10 years ago' do
      item = Item.new(Date.today)
      # expect(item.can_be_archived?).to be_falsey
      expect(item.send(:can_be_archived?)).to be_falsey
    end
  end

  describe '#move_to_archive' do
    it 'sets archived to true for an item that can be archived' do
      item = Item.new(ten_years_ago, archived: false)
      item.move_to_archive
      expect(item.archived).to be_truthy
    end

    it 'leaves archived as false for an item that cannot be archived' do
      item = Item.new(Date.today, archived: false)
      item.move_to_archive
      expect(item.archived).to be_falsey
    end
  end
end
