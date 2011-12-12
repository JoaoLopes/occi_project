class AccessController < ApplicationController

  layout 'application'

  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout, :new, :create]

  def index
    menu
    render('menu')
  end

  def menu
    user = User.find_by_id(session[:user_id])
    meetings = user.meetings
    @past_meetings = []
    @next_meetings = []
    meetings.each do |meeting|
      if meeting.datetime > Time.now
        @next_meetings << meeting
      else
        @past_meetings << meeting
      end
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    
    @user = User.new(params[:user])
    
    if @user.save
      if @user.name
        session[:username] = @user.name
      else
        session[:username] = @user.email
      end
      session[:user_id] = @user.id
      flash[:notice] = "Account created successfully"
      redirect_to(:action => "menu")
      return
    else
      user_local = User.find_by_email(@user.email)
      if user_local and user_local.hashed_password.blank?
        user_local.name = @user.name
        user_local.password = @user.password
        user_local.password_confirmation = @user.password_confirmation
        @user = user_local
        if @user.save
          if @user.name
            session[:username] = @user.name
          else
            session[:username] = @user.email
          end
          session[:user_id] = @user.id
          flash[:notice] = "Account created successfully"
          redirect_to(:action => "menu")
          return
        else
          flash[:notice] = @user.errors.full_messages[0]
          render('new');
          return
        end
      end
      flash[:notice] = @user.errors.full_messages[0]
      render('new');
      return
    end
  end

  def login
  end
  
  def edit
    @user = User.find_by_id(session[:user_id])
  end
  
  def update
    @user = User.find_by_id(session[:user_id])
    if @user.update_attributes(params[:user])
      if @user.name
        session[:username] = @user.name
      else
        session[:username] = @user.email
      end
      flash[:notice] = "Profile updated."
      redirect_to(:action => 'menu')
    else
      flash[:notice] = ""
      @user.errors.full_messages.each do |msg|
        flash[:notice] << msg
      end
      render('edit')
    end
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
      #UserMailer.hello_world(authorized_user).deliver
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
