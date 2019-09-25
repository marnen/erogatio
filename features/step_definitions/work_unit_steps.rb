Given 'I have no work units' do
  @current_user.work_units.destroy_all
end

Given 'another user has a work unit' do
  create :work_unit
end

When /^I enter (\d+) hours? of work for "([^"]+)" on (.*)$/ do |hours, description, date|
  visit new_work_unit_path
  select_date date, from: 'Date'
  fill_in 'Hours', with: hours
  fill_in 'Description', with: description
  click_button 'Save'
end

Then /^I should see (\d+) hours? of work for "([^"]+)" on (.*)$/ do |hours, description, date|
  found_unit = page.all work_unit_selector do |work_unit|
    {hours: /#{hours} hours?/, description: description, date: date}.all? {|css_class, content| work_unit.has_css? ".#{css_class}", text: content }
  end
  expect(found_unit.size).to be == 1
end

Then 'I should see the following work unit:' do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  field_hash = table.rows_hash.inject({}) do |memo, pair|
    field, content = pair
    css_class = field.downcase.gsub ' ', '-'
    memo.tap {|memo| memo[css_class] = content }
  end
  found_unit = page.all work_unit_selector do |work_unit|
    field_hash.all? {|css_class, content| work_unit.has_css? ".#{css_class}", text: content }
  end
  expect(found_unit.size).to be == 1
end

Then 'I should not see any work units' do
  expect(page).not_to have_selector '.work-unit'
end

private

def work_unit_selector
  '.work_unit'
end
