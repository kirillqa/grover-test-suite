Given(/^I am on '(.*)' page$/) do |page|

  @get_grover = GetGrover.new

  case page.downcase
  when 'sign up'
    @page = @get_grover.sign_up_page
  when 'login'
    @page = @get_grover.login_page
  else
    generate_not_supported_error(page)
  end
  @page.load
end

Given(/^I open website$/) do
  @get_grover = GetGrover.new
  @get_grover.index_page.load
end

Then(/^(?:I should see|should be redirected to) user home page$/) do
  @home = @get_grover.home_page
  expect(@home).to be_displayed
  expect(@home.right_navbar).to have_dashboard_link
  expect(@home.right_navbar).to have_logout_link
  expect(@home.right_navbar).not_to have_login_link
end

Then(/^I should see index page$/) do
  @index = @get_grover.index_page
  expect(@index).to be_displayed
  expect(@index.right_navbar).to have_login_link
  expect(@index.right_navbar).not_to have_dashboard_link
  expect(@index.right_navbar).not_to have_logout_link
end

Then(/^I should see login form$/) do
  @login = @get_grover.login_page
  expect(@login).to be_displayed
end

Then(/^I should see sign up page$/) do
  @sign_up = @get_grover.sign_up_page
  expect(@sign_up).to be_displayed
  expect(@sign_up).to have_first_name_field
  expect(@sign_up).to have_last_name_field
  expect(@sign_up).to have_email_field
  expect(@sign_up).to have_password_field
  expect(@sign_up).to have_confirm_password_field
  expect(@sign_up).to have_submit_button
end

Then(/^I should see welcome page$/) do
  @welcome = @get_grover.welcome_page
  expect(@welcome).to be_displayed
end
