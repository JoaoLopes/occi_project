class MeetingController < ApplicationController

  def show
    @meeting = Meeting.find_by_user_link(params[:id])
    if !@meeting
      flash[:notice] = "Meeting not available"
      redirect_to({:controller => "public", :action => "index" })
    end
  end

  def new
    @meeting = Meeting.new
    #@meeting.topics.build
    if session[:user_id]
      @manager = User.find_by_id(session[:user_id])
    end
  end

  def manage
  end
  
  

  def create
    logger.debug "\n\n\n##############################################################\n"
    logger.debug "#{params}\n"
    @manager = User.find_by_email(params[:manager_email])
    @meeting = Meeting.new(params[:meeting])
    if @manager
      logger.debug "Manager is "+@manager.name
    else
      logger.debug "Manager is going to be created"
      @manager = User.new
      @manager.email = params[:manager_email]
      if params[:manager_name] != ''
        @manager.name = params[:manager_name]
      end
      if !@manager.save
        flash[:notice] = @manager.errors.full_messages
        render :action => 'new'
      end
    end
    
    guests = params[:emails].split(',').map {|g| g.strip }
    if guests.count == 0
      flash[:notice] = "You must have at least one guest!"
      render :action => 'new'
      return
    end
    
    guest_list = []
    guests.each do |guest|
      logger.debug guest
      if !guest.blank?
      
        # split the fields
        if guest.index('"')
          name = guest.split('"')[1]
          mail = guest.split('<')[1][0..-2]
          user = User.find_by_email(mail)
        else
          mail = guest
          name = nil
        end
        
        # check if user already exists, if not create him
        user = User.find_by_email(mail)
        if user
          logger.debug "User exists"
        else
          logger.debug "Going to create"
          user = User.new
          user.email = mail
          if name
            user.name = name
          end
          
          # we might have problems
          if !user.save
            flash[:notice] = user.errors.full_messages
            render :action => 'new'
            return
          end
        end
        guest_list += [user]
      end
    end
    date = params[:date].split("/").map {|n| n.to_i}
    time = params[:time].split(":").map {|n| n.to_i}
    
    @meeting.datetime = DateTime.civil_from_format("utc",date[2], date[1], date[0], time[0], time[1], 0)
    @meeting.user_link = Meeting.get_new_link
    @meeting.manager_link = Meeting.get_new_link
    if !@meeting.save
      flash[:notice] = @meeting.errors.full_messages
      render :action => 'new'
      return
    end
    @meeting.set_manager(@manager)
    guest_list.each do |guest|
      @meeting.add_guest(guest)
    end
    logger.debug "##############################################################\n\n\n"
    flash[:notice] = "Meeting created successfully."
    redirect_to :action => "show"
  end

end
