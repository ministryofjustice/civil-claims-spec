require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'hashie'
require 'rspec/expectations'
require 'selenium-webdriver'

World(RSpec::Matchers)

config_file = File.join(File.dirname(__FILE__), 'config', 'environments.yml')
environment = 'development'
CONFIG = Hashie::Mash.new(YAML.load_file(config_file))[environment]

Capybara.register_driver :firefox_with_no_javascript do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile["javascript.enabled"] = false
  Capybara::Selenium::Driver.new(app, :profile => profile)
end

# http://jmeter.apache.org/usermanual/jmeter_proxy_step_by_step.pdf
Capybara.register_driver :firefox_with_proxy do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  proxy = 'localhost:8080'

  profile.proxy = Selenium::WebDriver::Proxy.new(
    :http     => proxy,
    :ftp      => proxy,
    :ssl      => proxy
  )

  Capybara::Selenium::Driver.new(app, :profile => profile)
end


Capybara.run_server = false
Capybara.app_host = CONFIG.base_url

# Capybara.default_driver = :firefox_with_proxy
# Capybara.default_driver = :firefox_with_no_javascript
# Capybara.default_driver = :poltergeist
Capybara.default_driver = :selenium
