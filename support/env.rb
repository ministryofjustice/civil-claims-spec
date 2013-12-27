require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'hashie'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

World(RSpec::Matchers)

environment = ENV['ENV'] || 'demo'
config_file = File.join(File.dirname(__FILE__), 'config', 'environments.yml')
CONFIG = Hashie::Mash.new(YAML.load_file(config_file))[environment]
pp CONFIG

page_models_dir = File.join(File.dirname(__FILE__), 'page_models', '*')
page_section_models_dir = File.join(File.dirname(__FILE__), 'page_models', 'sections', '*')

Dir.glob(page_section_models_dir) { |f| require f }
Dir.glob(page_models_dir) { |f| require f if File.file? f }


Data = Hashie::Mash.new(YAML.load_file(File.join(File.dirname(__FILE__), 'fixtures', 'repossession_claim.yml')))

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

if environment == 'demo'
  Capybara.default_driver = :selenium
  AfterStep { sleep 2 }
end