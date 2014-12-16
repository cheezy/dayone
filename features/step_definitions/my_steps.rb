Given(/^I am on the puppy adoption site$/) do
  visit HomePage
end

Then(/^I should see "([^"]*)"$/) do |expected_message|
  expect(@current_page.text).to include expected_message
end

When(/^I complete an adoption$/) do
  navigate_all
end

When(/^I attempt to checkout without a (.+)$/) do |field|
  navigate_to(CheckoutPage).checkout(field => '')
end

Then(/^I should see the error message "([^"]*)"$/) do |the_message|
  expect(on(CheckoutPage).errors).to include the_message
end

Given(/^I have an order for "([^"]*)"$/) do |name|
  navigate_to(CheckoutPage).checkout('name' => name)
end

When(/^I process that order$/) do
  visit LandingPage
  on(LoginPage).login_to_system('admin', 'password')
  on(LandingPage).adoptions
  on(ProcessPuppyPage).process_puppy
end