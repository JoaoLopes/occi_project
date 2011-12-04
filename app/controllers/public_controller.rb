class PublicController < ApplicationController


  def index
    if session[:user_id]
      redirect_to(:controller => 'access', :action => 'index')
    end
  end

  def show
    
  end

end
