class ProductPage < SitePrism::Page

  set_url('/de/products{/product}')

  section :cart, CartSection, '.checkout-slider'
  section :right_navbar, RightNavbarSection, '.navbar-right'

  element :add_to_cart_button, '#enjoy-btn'
  element :product_title, '.productPage__title'
  element :product_cost_price, '.productPage__costPrice'
  element :monthly_price, '#variant_price_monthly'
  element :shipment_terms, '.productPage__shipment'


  def click_add_to_cart
    add_to_cart_button.click
  end

  def product_name
    product_title.text
  end


  def product_cost
    product_cost_price.text
  end

  def price_per_month
    monthly_price.text
  end

  def shipment
    shipment_terms.text
  end
end