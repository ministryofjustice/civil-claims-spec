require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'hashie'
require 'rspec/expectations'
require 'selenium-webdriver'

World(RSpec::Matchers)

config_file = File.join(File.dirname(__FILE__), 'config', 'environments.yml')
environment = 'development'
CONFIG = Hashie::Mash.new(YAML.load_file(config_file))[environment]

Capybara.register_driver :no_javascript do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile["javascript.enabled"] = false
  Capybara::Selenium::Driver.new(app, :profile => profile)
end


# http://jmeter.apache.org/usermanual/jmeter_proxy_step_by_step.pdf
Capybara.register_driver :jmeter_proxied_firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  jmeter_proxy = 'localhost:8080'

  profile.proxy = Selenium::WebDriver::Proxy.new(
    :http     => jmeter_proxy,
    :ftp      => jmeter_proxy,
    :ssl      => jmeter_proxy
  )

  Capybara::Selenium::Driver.new(app, :profile => profile)
end

Capybara.run_server = false
Capybara.app_host = CONFIG.base_url

#Capybara.default_driver = :jmeter_proxied_firefox
#Capybara.default_driver = :firefox_with_no_javascript
Capybara.default_driver = :poltergeist
