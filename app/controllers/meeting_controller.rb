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
    if session[:user_id]
      @manager = User.find_by_id(session[:user_id])
    end
  end

  def manage
  end
  
  

  def create
    logger.debug "\n\n\n##############################################################\n"
    logger.debug "#{params[:meeting][:datetime]}\n"
    logger.debug "##############################################################\n\n\n"
    redirect_to(:action => 'new')
  end

end
