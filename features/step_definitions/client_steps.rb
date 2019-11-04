Given 'I have the following client(s):' do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.transpose.hashes.each {|hash| FactoryBot.create :client, hash.merge(user: @current_user) } # TODO: go through the UI once it exists
end
