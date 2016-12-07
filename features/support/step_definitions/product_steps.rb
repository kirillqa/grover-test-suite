When(/^I open '(.*)' product page$/) do |name|
  @get_grover.product_page.load(product: name)
end

When(/^I click on 'add product to cart' button$/) do
  @get_grover.product_page.click_add_to_cart
end

Then(/^I should see the following product details:$/) do |data|
  data.hashes.each do |product|
    title = product[:title]
    shipment = product[:shipment]
    product_cost = product[:product_cost]
    price_per_month = product[:price_per_month]

    expect(@get_grover.product_page.product_name).to eq(title) if title
    expect(@get_grover.product_page.shipment).to eq(shipment) if shipment
    expect(@get_grover.product_page.product_cost).to eq(product_cost) if product_cost
    expect(@get_grover.product_page.price_per_month).to eq(price_per_month) if price_per_month
  end
end

Then(/^I should see '(.*)' item of '(.*)' in shopping cart pop up$/) do |quantity, name|
  @get_grover.product_page.wait_for_cart

  expect(@get_grover.product_page.cart.product_name).to start_with(name)

  product_amount = @get_grover.product_page.cart.product_amount
  expect(product_amount).to eq(quantity), "product quantity does not match: expected #{quantity} but was #{product_amount}"

  items_quantity = @get_grover.product_page.right_navbar.items_quantity
  expect(items_quantity).to eq(quantity), "product quantity in header does not match: expected #{quantity} but was #{items_quantity}"
end