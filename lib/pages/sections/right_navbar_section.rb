class RightNavbarSection < SitePrism::Section

  element :dashboard_link, '.dashboard'
  element :logout_link, '[href*="/logout"]'
  element :login_link, '[href="/login"]'
  element :items_counter, '.notific-num'

  def click_login
    login_link.click
  end

  def items_quantity
    items_counter.text
  end
end