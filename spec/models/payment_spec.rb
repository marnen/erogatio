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

  include_examples 'permit content columns'
end
