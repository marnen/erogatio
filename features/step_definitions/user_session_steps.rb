Given 'I am logged in' do
  @current_user = build :user
  email = @current_user.email
  password = @current_user.password
  @current_user.save!
  visit login_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Login'
end

Given 'I am not logged in' do
  visit logout_path
end
