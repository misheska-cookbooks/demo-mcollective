require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen'

@instances = []
@config = Kitchen::Config.new
@names = %w( mcollective-admin-centos65 chef-server-centos65 node1-centos65 )
@names.each { |name| @instances << @config.instances.get(name) }

desc 'create instances'
task :create do
  @instances.each { |i| i.create }
end

desc 'destroy instances'
task :destroy do
  @names.each { |name| @config.instances.get(name).destroy }
end

desc 'run cookbooks against instances'
task :converge do
  @names.each { |name| @config.instances.get(name).converge }
end

desc 'list instances'
task :list do
  sh 'kitchen list'
end

desc 'create cluster'
task :default  => [:converge]

desc 'verify instances'
task :verify do
  @names.each { |name| @config.instances.get(name).verify }
end

desc 'serverspec tests'
task :test => [:create, :converge, :verify]

# Style tests.  Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  Rubocop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      fail_tags: ['any'],
      tags: ['~FC005']
    }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

# Rspec and ChefSpec
desc "Run ChefSpec examples"
RSpec::Core::RakeTask.new(:spec)
