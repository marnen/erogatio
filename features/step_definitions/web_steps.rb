Given /^I am on (.*)$/ do |page_name|
  visit path_to page_name
end

When 'I click {string}' do |button|
  click_link_or_button button
end

When 'I fill in the following:' do |table|
  table.rows_hash.each do |field, value|
    begin
      fill_in field, with: value
    rescue Capybara::ElementNotFound => not_found
      begin
        select_date value, from: field
      rescue ArgumentError
        raise not_found
      end
    end
  end
end

When /^I go to (.+)$/ do |page_name|
  visit path_to page_name
end

When /^(.+) within (.+)$/ do |step_text, selector|
  within selector_for selector do
    step step_text
  end
end

Then /^I should be on (.+)$/ do |page_name|
  expect(current_path).to be == path_to(page_name)
end

Then /^I should (not )?see "(.+)"$/ do |negation, text|
  expect(page.has_text? text).to be == !negation
end

Then /^I should (not )?see the following (.+):$/ do |negation, klass, table|
  # table is a Cucumber::MultilineArgument::DataTable

  record_selector = ".#{klass.downcase.singularize.gsub ' ', '_'}"
  table.transpose.hashes.each do |hash|
    field_hash = hash.transform_keys {|field| field.downcase.gsub ' ', '-' }

    found_unit = page.all record_selector do |work_unit|
      field_hash.all? {|field_selector, content| work_unit.has_css? ".#{field_selector}", text: content }
    end
    expect(found_unit.size).to be == (negation ? 0 : 1)
  end
  # TODO: can we refactor this to a table diff?
end

Then /^I should not be able to get to (.+)$/ do |page_name|
  path = path_to page_name
  begin
    visit path
    expect(current_path).not_to be == path
  rescue Pundit::NotAuthorizedError
    # that's a type of success
    true
  end
end

Then 'I should not be able to select {string} from {string}' do |value, menu|
  within(find_field menu, type: :select) do
    expect(page).not_to have_css 'option', text: value
  end
end
