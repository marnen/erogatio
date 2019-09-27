require 'rails_helper'
require 'pundit/rspec'

RSpec.describe UserPolicy, type: :policy do
  let(:current_user) { FactoryBot.create :user }
  let(:record) { FactoryBot.create :user }
  subject { described_class.new current_user, record }

  it { is_expected.to be_a_kind_of ApplicationPolicy }

  context 'permissions' do
    subject { described_class }

    permissions :index? do
      it 'does not permit access' do
        expect(subject).not_to permit current_user, User
      end
    end

    permissions :show? do
      it "permits access to the current user's own record" do
        expect(subject).to permit current_user, current_user
      end

      it "does not permit access to other users' records" do
        expect(subject).not_to permit current_user, record
      end
    end
  end
end
