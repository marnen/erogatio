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

When /^I go to (.*)$/ do |page_name|
  visit path_to page_name
end

When /^(.+) within (.+)$/ do |step_text, selector|
  within selector_for selector do
    step step_text
  end
end

Then /^I should be on (.*)$/ do |page_name|
  expect(current_path).to be == path_to(page_name)
end

Then 'I should see {string}' do |text|
  expect(page).to have_text text
end
