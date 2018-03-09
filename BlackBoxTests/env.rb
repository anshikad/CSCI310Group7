
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'nokogiri'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :driver_path=>"/usr/lib/chromium-browser/chromedriver")
end

Capybara.default_driver = :chrome