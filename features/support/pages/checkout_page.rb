class CheckoutPage
  include PageObject

  text_field(:name, :id => 'order_name')
  text_field(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  select_list(:pay_type, :id => 'order_pay_type')
  button(:place_order, :value => 'Place Order')

  DEFAULT_DATA = {
    'name' => 'Cheezy',
    'address' => '123 Cleveland Blvd',
    'email' => 'cheezy@example.com',
    'pay_type' => 'Credit card'
  }

  def checkout(data = {})
    populate_page_with DEFAULT_DATA.merge(data)
    place_order
  end

end