require 'rails_helper'
require 'pundit/rspec'

RSpec.describe WorkUnitPolicy, type: :policy do

  include_examples 'inherit from ApplicationPolicy'

  permissions :update?, :edit? do
    include_examples "allow access to given user's records only"

    context 'paid work unit' do
      let(:user) { FactoryBot.create :user }
      it 'does not permit access' do
        expect(described_class).not_to permit user,  FactoryBot.create(:work_unit, user: user, paid: true)
      end
    end
  end

  describe described_class::Scope do
    include_examples "scope to given user's records only"
  end
end
