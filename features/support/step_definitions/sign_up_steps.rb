When(/^I submit sign up form with the following data:/) do |data|
  data.hashes.each do |form|
    user = User.new
    user.first_name = form[:first_name]
    user.last_name = form[:last_name]
    user.email = form[:email]
    user.password = form[:password]
    user.confirm_password = form[:confirm_password]

    @get_grover.sign_up_page.submit_form_with(user)
  end
end