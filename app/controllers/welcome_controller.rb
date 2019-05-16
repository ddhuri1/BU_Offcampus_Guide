class WelcomeController < ApplicationController
  skip_before_filter :can_proceed
  
  def login
    @action = 'login'
  end
end

