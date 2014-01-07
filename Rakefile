require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

desc "Show command usage"
task :help do |t|
  puts 'Runs cucumber features.'
  puts
  puts 'Usage:'
  puts 'rake [profile] [tag=tag_name]'
  puts "Show the set of defined tag names using the 'list_tags' profile"
end

config_file = File.join(File.dirname(__FILE__), '.config', 'cucumber.yml')
YAML.load_file(config_file).keys.each do |profile|
  Cucumber::Rake::Task.new(profile, "Run features with #{profile} profile") do |t|
    #t.profile = ARGV[0] || 'default'
    t.profile = profile
    t.cucumber_opts = "--tags @#{ENV['tag']}" if ENV.has_key? 'tag'
  end
end

rule "" do |t|
  Rake::Task[:default].execute # expects a profile named default
end
