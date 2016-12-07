class LoginPage < SitePrism::Page

  set_url('/login')

  # Login Form
  element :email_field, '#user_name'
  element :password_field, '#password'
  element :login_button, '.mt-lg.login'

  # Right section of the form
  element :sign_up_link, '[href="/signup"]'

  def click_sign_up
    sign_up_link.click
  end

  def fill_form(user)
    email_field.set(user.email)
    password_field.set(user.password)
  end

  def click_login
    login_button.click
  end

  def login_as(user)
    fill_form(user)
    click_login
  end
end

