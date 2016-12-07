When(/^I click on sign up link$/) do
  @get_grover.login_page.click_sign_up
end

When(/^I submit login form with the following data:$/) do |data|
  data.hashes.each do |post|
    user = User.new
    user.email = post[:email]
    user.password = post[:password]

    @get_grover.login_page.login_as(user)
  end
end

When(/^I login as:/) do |data|
  step "I am on 'login' page"
  step 'I submit login form with the following data:', data
end


