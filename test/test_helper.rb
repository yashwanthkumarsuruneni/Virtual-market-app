ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  # Logs in a test user.
  def log_in_as(user, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email:       user.email,
                                  password:    password
                                  }
    else
      session[:user_id] = user.id
    end
  end
  def admin_log_in_as(admin, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post adminlogin_path, session: { email:       admin.email,
                                  password:    password
                                  }
    else
      session[:user_id] = admin.id
    end
  end

  private

    # Returns true inside an integration test.
    def integration_test?
      defined?(post_via_redirect)
    end
  # Add more helper methods to be used by all tests here...
end
