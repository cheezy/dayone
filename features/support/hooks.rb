require 'watir-webdriver'

Before do
  ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
  @browser = Watir::Browser.new :firefox
end


After do |scenario|
  if scenario.failed?
    filename = "error-#{@current_page.class}-#{Time.now}.png".gsub(' ', '_')
    @current_page.save_screenshot(filename)
    embed(filename, 'image/png')
  end

  @browser.close
end