require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :work_unit }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :work_unit_id }
  end

  describe '.permitted_params' do
    it 'includes all the content field names except the timestamps' do
      expect(Payment.permitted_params).to contain_exactly *Payment.content_columns.map(&:name).reject {|name| name.ends_with? '_at' }
    end
  end
end
