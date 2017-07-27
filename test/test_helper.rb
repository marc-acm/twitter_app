require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

ENV['RAILS_ENV'] ||= 'test' #Listing 5.35

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
   include ApplicationHelper


# Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end
end



  # Add more helper methods to be used by all tests here...
end
