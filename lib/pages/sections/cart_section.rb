class CartSection < SitePrism::Section

  element :name, '.name'
  element :amount, '.amount'

  def product_name
    name.text
  end

  def product_amount
    amount.text
  end
end