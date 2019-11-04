RSpec.shared_examples "scope to given user's records only" do
  let(:policy_class) { described_class.to_s.chomp '::Scope' }
  let(:user) { FactoryBot.create :user }
  let(:factory_name) { record_class_name(policy_class).underscore }
  subject { described_class.new(user, record_class(policy_class)).resolve }

  it 'returns all records that belong to the given user' do
    my_records = FactoryBot.create_list factory_name, rand(2..10), user: user
    expect(subject).to contain_exactly *my_records
  end

  it 'does not return records that do not belong to the given user' do
    others_records = FactoryBot.create_list factory_name, rand(2..10)
    expect(subject).to be_empty
  end
end
