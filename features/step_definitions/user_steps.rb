Given 'no users exist' do
  User.destroy_all
end

Given 'a user exists' do
  @user = FactoryBot.create :user
end
