class WelcomeController < ApplicationController
  before_filter :authorize
  def index
    if session[:admin]
      redirect_to '/users'
    else
      redirect_to '/profile'
    end
  end
end
