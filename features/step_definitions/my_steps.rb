Given(/^I am on the puppy adoption site$/) do
  visit HomePage
end

When(/^I click the view details button for (.+)$/) do |name|
  on(HomePage).select_puppy name
end

And(/^I click the adopt me button$/) do
  on(DetailsPage).add_to_cart
end

And(/^I click the complete the adoption button$/) do
  on(ShoppingCartPage).proceed_to_checkout
end

And(/^I click the adopt another puppy button$/) do
  on(ShoppingCartPage).continue_shopping
end

And(/^I enter "([^"]*)" in the name field$/) do |name|
  on(CheckoutPage).name = name
end

And(/^I enter "([^"]*)" in the address field$/) do |address|
  on(CheckoutPage).address = address
end

And(/^I enter "([^"]*)" in the email field$/) do |email|
  on(CheckoutPage).email = email
end

And(/^I select "([^"]*)" from the pay type dropdown$/) do |pay_type|
  on(CheckoutPage).pay_type = pay_type
end

And(/^I click the place order button$/) do
  on(CheckoutPage).place_order
end

Then(/^I should see "([^"]*)"$/) do |expected_message|
  expect(@current_page.text).to include expected_message
end

Then(/^I should see "([^"]*)" for the name on (line item \d+)$/) do |name, item|
  expect(on(ShoppingCartPage).name_for_line_item(item)).to include name
end

And(/^I should see "(.+)" for the subtotal on (line item \d+)$/) do |subtotal, item|
  expect(on(ShoppingCartPage).subtotal_for_line_item(item)).to eql subtotal
end

And(/^I should see "(.+)" for the cart total$/) do |total|
  expect(on(ShoppingCartPage).cart_total).to eql total
end

