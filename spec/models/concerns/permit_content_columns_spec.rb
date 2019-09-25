require 'rails_helper'

RSpec.describe PermitContentColumns, type: :concern do
  let(:host_class) { Class.new(ActiveRecord::Base) { include PermitContentColumns } }

  describe '.permitted_params' do
    it 'returns the names of all content columns except those that end with "_at"' do
      names_to_include = Faker::Lorem.words(rand 6..10)
      names_to_exclude = Faker::Lorem.words(rand 2..5).map {|word| "#{word}_at" }
      all_names = names_to_include + names_to_exclude
      columns = all_names.map {|name| Struct.new(:name).new name }.shuffle
      allow(host_class).to receive(:content_columns).and_return columns

      expect(host_class.permitted_params).to contain_exactly *names_to_include
    end
  end
end
