class HomePage
  include PageObject

  def select_puppy(puppy_number)
    button_element(:value => 'View Details', :index => puppy_number - 1).click
  end

end