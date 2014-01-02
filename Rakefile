require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'


Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

Cucumber::Rake::Task.new(:demo, :sprint) do |t, args|
 # raise "Bad things happened. No sprint or something, probably." unless ARGV[1] && ARGV[1][/sprint\d+/]
  sprint_tag = ARGV[1]
  t.profile = 'demo'
  t.cucumber_opts = "--tags @#{sprint_tag}"
end

Cucumber::Rake::Task.new(:list_tags) do |t|
  t.profile = "list_tags"
end

task :default => [:features]