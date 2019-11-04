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
  table.transpose.hashes.each do |hash|
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

Then 'I should see the following work unit(s):' do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.transpose.hashes.each do |hash|
    field_hash = hash.inject({}) do |memo, pair|
      field, content = pair
      css_class = field.downcase.gsub ' ', '-'
      memo.tap {|memo| memo[css_class] = content }
    end

    found_unit = page.all work_unit_selector do |work_unit|
      field_hash.all? {|css_class, content| work_unit.has_css? ".#{css_class}", text: content }
    end
    expect(found_unit.size).to be == 1
  end
  # TODO: can we refactor this to a table diff?
end

Then 'I should not see any work units' do
  expect(page).not_to have_selector '.work-unit'
end

private

def work_unit_selector
  '.work_unit'
end
