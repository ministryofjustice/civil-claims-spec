require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'hashie'
require 'rspec/expectations'

World(RSpec::Matchers)

config_file = File.join(File.dirname(__FILE__), 'config', 'environments.yml')
environment = 'development'
CONFIG = Hashie::Mash.new(YAML.load_file(config_file))[environment]

Capybara.run_server = false
Capybara.app_host = CONFIG.base_url
Capybara.default_driver = :poltergeist