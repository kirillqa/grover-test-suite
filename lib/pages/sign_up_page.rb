class SignUpPage < SitePrism::Page

  set_url('/signup')

  # Sign Up Form
  element :first_name_field, '[name="spree_user[first_name]"]'
  element :last_name_field, '[name="spree_user[last_name]"]'
  element :email_field, '[name="spree_user[email]"]'
  element :password_field, '[name="spree_user[password]"]'
  element :confirm_password_field, '[name="spree_user[password_confirmation]"]'

  element :submit_button, '.mt-lg'

  # Right section of the form
  element :login_link, '[href="/login"]'

  def fill_form(user)
    first_name_field.set(user.first_name)
    last_name_field.set(user.last_name)
    email_field.set(user.email)
    password_field.set(user.password)
    confirm_password_field.set(user.confirm_password)
  end

  def click_submit
    submit_button.click
  end

  def submit_form_with(user)
    fill_form(user)
    click_submit
  end

end