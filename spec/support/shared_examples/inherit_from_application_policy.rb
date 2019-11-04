RSpec.shared_examples 'inherit from ApplicationPolicy' do
  let(:user) { FactoryBot.create :user }
  let(:record) { FactoryBot.create record_class_name(described_class).underscore }
  subject { described_class.new user, record }

  it { is_expected.to be_a_kind_of ApplicationPolicy }
end
