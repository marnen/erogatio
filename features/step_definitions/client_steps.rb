Given /^(I|another user) (?:have|has) the following clients?:$/ do |user, table|
  # table is a Cucumber::MultilineArgument::DataTable
  options = user == 'I' ? {user: @current_user} : {}
  table.transpose.hashes.each {|hash| FactoryBot.create :client, hash.merge(options) }
end
