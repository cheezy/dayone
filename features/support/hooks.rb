require 'watir-webdriver'

Before do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  @browser = Watir::Browser.new :firefox
end


After do
  @browser.close
end