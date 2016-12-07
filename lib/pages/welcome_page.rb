class WelcomePage < SitePrism::Page

  set_url('/welcome')

  element :welcome_message, '.header.text-center'

  def welcome_text
    welcome_message.text
  end
end