ENV["RAILS_ENV"] ||= "test"

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'

if ENV["COVERAGE"]
  SimpleCov.start('rails') do
    merge_timeout 3600
  end
end

require 'sidekiq/testing/inline'

require 'mocha/setup'

class ActiveSupport::TestCase
  include AuthHelper
  include Wrong
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  require 'factory_girl'
  include FactoryGirl::Syntax::Methods
  FactoryGirl.reload

end
