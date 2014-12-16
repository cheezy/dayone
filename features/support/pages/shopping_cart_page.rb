class ShoppingCartPage
  include PageObject

  button(:proceed_to_checkout, :value => 'Complete the Adoption')
  button(:continue_shopping, :value => 'Adopt Another Puppy')
  table(:the_cart, :index => 0)
  cell(:cart_total, :class => 'total_cell')

  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  ROWS_PER_PUPPY = 6

  def name_for_line_item(item)
    data_for(item, NAME_COLUMN)
  end

  def subtotal_for_line_item(item)
    data_for(item, SUBTOTAL_COLUMN)
  end

  private

  def data_for(item, column)
    row = (item - 1) * ROWS_PER_PUPPY
    the_cart_element[row][column].text
  end

end
