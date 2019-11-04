RSpec.shared_examples "allow access to given user's records only" do
  let(:factory_name) { record_class_name(described_class).underscore }
  let(:user) { FactoryBot.create :user }

  subject { described_class }

  context 'record belongs to given user' do
    it 'permits access' do
      expect(subject).to permit user, FactoryBot.create(factory_name, user: user)
    end
  end

  context 'record belongs to other user' do
    it 'does not permit access' do
      expect(subject).not_to permit user, FactoryBot.create(factory_name)
    end
  end
end
