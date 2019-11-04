require 'rails_helper'
require 'pundit/rspec'

RSpec.describe ClientPolicy, type: :policy do
  let(:user) { FactoryBot.create :user }
  let(:client) { FactoryBot.create :client }
  subject { described_class.new user, client }

  it { is_expected.to be_a_kind_of ApplicationPolicy }

  permissions :create_work_unit? do
    subject { described_class }

    context 'client belongs to given user' do
      it 'permits access' do
        expect(subject).to permit user, FactoryBot.create(:client, user: user)
      end
    end

    context 'client belongs to other user' do
      it 'does not permit access' do
        expect(subject).not_to permit user, client
      end
    end
  end

  describe described_class::Scope do
    subject { described_class.new(user, Client).resolve }

        it 'returns all clients that belong to the given user' do
          my_clients = FactoryBot.create_list :client, rand(2..10), user: user
          expect(subject).to contain_exactly *my_clients
        end

        it 'does not return clients that do not belong to the given user' do
          others_clients = FactoryBot.create_list :client, rand(2..10)
          expect(subject).to be_empty
        end
  end
end
