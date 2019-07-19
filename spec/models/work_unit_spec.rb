require 'rails_helper'

RSpec.describe WorkUnit, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :hours }
    it { is_expected.to validate_presence_of :user_id }
  end
end
