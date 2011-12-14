class PublicController < ApplicationController


  def index
    if session[:user_id]
      if User.find_by_id(session[:user_id])
        flash[:notice] = flash[:notice]
        redirect_to(:controller => 'access', :action => 'index')
      else
        session[:user_id] = nil
        session[:username] = nil
      end
    end
  end

end
