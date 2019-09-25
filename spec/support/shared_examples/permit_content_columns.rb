require 'rails_helper'

RSpec.shared_examples 'permit content columns' do
  describe '.permitted_params' do
    it 'includes all the content field names except the timestamps' do
      expect(described_class.permitted_params).to contain_exactly *described_class.content_columns.map(&:name).reject {|name| name.ends_with? '_at' }
    end
  end
end
