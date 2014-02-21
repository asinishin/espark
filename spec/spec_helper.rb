# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'

require 'vcr'

VCR.config do |c|
  c.ignore_localhost = true
  c.cassette_library_dir = 'spec/cassettes'
  c.stub_with               :fakeweb
#  c.hook_into :fakeweb
#  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
  # so we can use `:vcr` rather than `:vcr => true`;
  # in RSpec 3 this will no longer be necessary.
  #  c.treat_symbols_as_metadata_keys_with_true_values = true
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

module ::RSpec::Core
  class ExampleGroup
    include Capybara::DSL
    include Capybara::RSpecMatchers
  end
end

###########################################################
# Settings for iPhone driver

#Capybara.register_driver :iphone do |app|
#  Capybara::Selenium::Driver.new(app, :browser => :iphone)
#end

#Capybara.javascript_driver = :iphone
###########################################################
