ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
require "rails/test_help"

module ActiveSupport
  class TestCase
    fixtures :all
  def is_logged_in?
    !session[:user_id].present?
  end

  def log_in_as user
    session[:user_id] = user.id
  end
end

module ActionDispatch
  class IntegrationTest
    fixtures :all
  def log_in_as user, password: "password", remember_me: Settings.session.remember
    post login_path, params: {session: {email: user.email, password: password, remember_me: remember_me}}
  end
end
