Given 'I have no work units' do
  @current_user.work_units.destroy_all
end

Given 'another user has a work unit' do
  create :work_unit
end

When /^I enter (\d+) hours? of work on (.*)$/ do |hours, date|
  visit new_work_unit_path
  select_date date, from: 'Date'
  fill_in 'Hours', with: hours
  click_button 'Save'
end

Then /^I should see (\d+) hours? of work on (.*)$/ do |hours, date|
  found_unit = page.all '.work-unit' do |work_unit|
    [/#{hours} hours?/, date].all? {|content| work_unit.has_content? content }
  end
  expect(found_unit.size).to be == 1
end

Then 'I should not see any work units' do
  expect(page).not_to have_selector '.work-unit'
end
