Given(/^I am on the puppy adoption site$/) do
  @browser.goto 'http://puppies.herokuapp.com'
  @home = HomePage.new(@browser)
end

When(/^I click the first view details button$/) do
  @home.select_puppy 1
  @details = DetailsPage.new(@browser)
end

And(/^I click the second view details button$/) do
  @home.select_puppy 2
  @details = DetailsPage.new(@browser)
end

And(/^I click the adopt me button$/) do
  @details.add_to_cart
  @shopping_cart = ShoppingCartPage.new(@browser)
end

And(/^I click the complete the adoption button$/) do
  @shopping_cart.proceed_to_checkout
  @checkout = CheckoutPage.new(@browser)
end

And(/^I click the adopt another puppy button$/) do
  @shopping_cart.continue_shopping
end

And(/^I enter "([^"]*)" in the name field$/) do |name|
  @checkout.name = name
end

And(/^I enter "([^"]*)" in the address field$/) do |address|
  @checkout.address = address
end

And(/^I enter "([^"]*)" in the email field$/) do |email|
  @checkout.email = email
end

And(/^I select "([^"]*)" from the pay type dropdown$/) do |pay_type|
  @checkout.pay_type = pay_type
end

And(/^I click the place order button$/) do
  @checkout.place_order
end

Then(/^I should see "([^"]*)"$/) do |expected_message|
  expect(@browser.text).to include expected_message
end

Then(/^I should see "([^"]*)" for the name on line item (\d+)$/) do |name, item|
  expect(@shopping_cart.name_for_line_item(item)).to include name
end

And(/^I should see "(.+)" for the subtotal on line item (\d+)$/) do |subtotal, item|
  expect(@shopping_cart.subtotal_for_line_item(item)).to eql subtotal
end

And(/^I should see "(.+)" for the cart total$/) do |total|
  expect(@shopping_cart.cart_total).to eql total
end

