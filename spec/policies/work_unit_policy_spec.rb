require 'rails_helper'
require 'pundit/rspec'

RSpec.describe WorkUnitPolicy, type: :policy do
  let(:user) { FactoryBot.create :user }
  let(:work_unit) { FactoryBot.create :work_unit }
  subject { described_class.new user, work_unit }

  it { is_expected.to be_a_kind_of ApplicationPolicy }

  permissions :update?, :edit? do
    subject { described_class }

    context 'work unit belongs to given user' do
      it 'permits access' do
        expect(subject).to permit user, FactoryBot.create(:work_unit, user: user)
      end
    end

    context 'work unit belongs to other user' do
      it 'does not permit access' do
        expect(subject).not_to permit user, work_unit
      end
    end
  end

  describe described_class::Scope do
    subject { described_class.new(user, WorkUnit).resolve }

    it 'contains all work units that belong to the given user' do
      my_work_units = FactoryBot.create_list :work_unit, rand(2..10), user: user
      expect(subject).to contain_exactly *my_work_units
    end

    it 'does not contain work units that do not belong to the given user' do
      others_work_units = FactoryBot.create_list :work_unit, rand(2..10)
      expect(subject).to be_empty
    end
  end
end
