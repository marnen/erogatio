Given 'I have no clients' do
  @current_user.clients.destroy_all
end

Given /^(I|another user) (?:have|has) the following clients?:$/ do |user, table|
  # table is a Cucumber::MultilineArgument::DataTable
  options = user == 'I' ? {user: @current_user} : {}
  each_column(table) {|hash| FactoryBot.create :client, hash.merge(options) }
end
