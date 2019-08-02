Given /^I am on (.*)$/ do |page_name|
  visit path_to page_name
end

When /^I go to (.*)$/ do |page_name|
  visit path_to page_name
end

Then /^I should be on (.*)$/ do |page_name|
  expect(current_path).to be == path_to(page_name)
end
