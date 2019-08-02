Given 'I am logged in' do
  @current_user = build :user
  email = @current_user.email
  password = @current_user.password
  @current_user.save!
  visit login_path
  fill_in 'E-mail address', with: email
  fill_in 'Password', with: password
  click_button 'Log In'
end

Given 'I am not logged in' do
  visit logout_path
end

Then 'I should be logged in as {string}' do |email|
  expect(page).to have_selector 'header .current-user', text: "Logged in as #{email}"
end
