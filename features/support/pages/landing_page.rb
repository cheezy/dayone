class LandingPage
  include PageObject

  page_url 'http://puppies.herokuapp.com/admin'

  link(:adoptions, :text => 'Adoptions')

end