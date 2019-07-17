require 'rails_helper'

describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of :email }

    describe 'uniqueness' do
      before(:each) { FactoryBot.create :user }
      it { is_expected.to validate_uniqueness_of :email }
    end
  end
end
