class AccessController < ApplicationController

  layout 'application'

  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    menu
    render('menu')
  end

  def menu
  end

  def login
  end

  def attempt_login
    authorized_user = User.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      if authorized_user.name
        session[:username] = authorized_user.name
      else
        session[:username] = authorized_user.email
      end
      flash[:notice] = "You are logged in!"
      redirect_to(:action => 'menu')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:controller => 'public', :action => 'index')
  end

end
