Given 'I have no clients' do
  @current_user.clients.destroy_all
end

Given /^(I|another user) (?:have|has) the following clients?:$/ do |user, table|
  # table is a Cucumber::MultilineArgument::DataTable
  options = user == 'I' ? {user: @current_user} : {}
  table.transpose.hashes.each {|hash| FactoryBot.create :client, hash.merge(options) }
end

Then 'I should see the following client(s):' do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.transpose.hashes.each do |hash|
    field_hash = hash.inject({}) do |memo, pair|
      field, content = pair
      css_class = field.downcase.gsub ' ', '-'
      memo.tap {|memo| memo[css_class] = content }
    end

    found_unit = page.all '.client' do |work_unit|
      field_hash.all? {|css_class, content| work_unit.has_css? ".#{css_class}", text: content }
    end
    expect(found_unit.size).to be == 1
  end
  # TODO: can we refactor this to a table diff?
  # TODO: unify with work_unit_steps.
end
