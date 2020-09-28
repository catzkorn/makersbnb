require "simplecov"
require "simplecov-console"

ENV["RACK_TEST"] = "test"
ENV["ENVIRONMENT"] = "test"

require File.join(File.dirname(__FILE__), "..", "app.rb")

require "capybara"
require "capybara/rspec"
require "rspec"
require_relative "./features/test_helpers.rb"

Capybara.app = Makersbnb

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
# Want a nice code coverage website? Uncomment this next line!
# SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    clear_users_table()
    clear_spaces_table()
  end
end
