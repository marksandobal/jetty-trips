require_relative 'controller_authorization' # or require_relative '../controller_authorization' if write in `spec/support/devise.rb`

RSpec.configure do |config|
  # For Devise >= 4.1.1
  config.include Devise::Test::ControllerHelpers, :type => :controller
  # Use the following instead if you are on Devise <= 4.1.0
  # config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerAuthorization, :type => :controller
end