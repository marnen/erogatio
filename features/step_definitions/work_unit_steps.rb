Given 'I have no work units' do
  @current_user.work_units.destroy_all
end

Given 'I have a work unit' do
  @work_unit = FactoryBot.create :work_unit, user: @current_user
end

Given 'I have the following work unit:' do |table|
  @work_unit = FactoryBot.create :work_unit, table.rows_hash.merge(user: @current_user)
end

Given 'another user has a work unit' do
  @work_unit = create :work_unit
end

When 'I enter the following work unit(s):' do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  each_column(table) do |hash|
    visit new_work_unit_path
    ['Date', 'Payment due'].each do |field|
      date = hash.delete(field)
      select_date date, from: field if date
    end
    select hash.delete('Client'), from: 'Client'
    hash.each do |field, value|
      fill_in field, with: value
    end
    click_button 'Save'
  end
end

Then 'I should not see any work units' do
  expect(page).not_to have_selector '.work-unit'
end
